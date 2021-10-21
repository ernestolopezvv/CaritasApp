//
//  IDS17ViewController.swift
//  CaritasApp
//
//  Created by Santiago A.A.M on 07/10/21.
//


import UIKit

class IDS17_RDViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBAction func onCloseButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
    
    @IBOutlet weak var donationsTableView: UITableView!
    
    
    var donationsArray = [Donation]()

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Archivo siguiente IDS23_D
        let vc = segue.destination as! IDS2_17ViewController
        
        if segue.identifier == "receiveDonationSegue" {
            vc.donation = donationsArray[donationsTableView.indexPathForSelectedRow!.row]
            vc.fetch = true

        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return donationsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "donationsCell", for: indexPath) as! selectDonationCell
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "YYYY-MM-dd"
        
        
        cell.textLabel?.text = dateFormatter.string(from: donationsArray[indexPath.row].fecha_recepcion!)
        cell.nameLabel.text = donationsArray[indexPath.row].donador?.nombre
        
        
        //cell.donado
        //cell.textLabel?.text = donationsArray[indexPath.row].fecha_recepcion
        return cell
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        APIFunctions.functions.delegate = self
        APIFunctions.functions.fetchDonations()
        
        donationsTableView.delegate = self
        donationsTableView.dataSource = self
    }

}

class selectDonationCell: UITableViewCell  {
    @IBOutlet weak var nameLabel: UILabel!
    
}

extension IDS17_RDViewController: DataDelegate {
    
    //Función de extensión
    func updateArray(newArray: String) {
                
        do {
            let decoder = JSONDecoder()
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
            decoder.dateDecodingStrategy = .formatted(dateFormatter)
            donationsArray = try decoder.decode([Donation].self, from: newArray.data(using: .utf8)!)

            //Considerando estado de recepción
            donationsArray = donationsArray.filter {$0.estado_recepcion_almacen == false}
                
            //print(donationsArray)
        } catch {
            print("Failed to decode Donations!")
        }
            self.donationsTableView?.reloadData()
    }
}
