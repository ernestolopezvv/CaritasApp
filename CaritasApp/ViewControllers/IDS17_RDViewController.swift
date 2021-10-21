//
//  IDS17ViewController.swift
//  CaritasApp
//
//  Created by Santiago A.A.M on 07/10/21.
//


import UIKit

class IDS17_RDViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    //Funcion al botón de regresar pantalla
    @IBAction func onCloseButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    //Hook de la TableView
    @IBOutlet weak var donationsTableView: UITableView!
    
    //Variable que contiene la información a mostrar filtrada, después del servicio REST
    var donationsArray = [Donation]()

    //Preparación de variables a utilizar dentro de la siguiente pantalla
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // Archivo siguiente
        let vc = segue.destination as! IDS2_17ViewController
        
        if segue.identifier == "receiveDonationSegue" {
            vc.donation = donationsArray[donationsTableView.indexPathForSelectedRow!.row]
            vc.fetch = true

        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return donationsArray.count
    }
    
    //Asignacion del contenido de la celda
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "donationsCell", for: indexPath) as! selectDonationCell
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "YYYY-MM-dd"
        

        cell.textLabel?.text = dateFormatter.string(from: donationsArray[indexPath.row].fecha_recepcion!)
        cell.nameLabel.text = donationsArray[indexPath.row].donador?.nombre
        
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

//Extension donde se realiza el servicio REST
extension IDS17_RDViewController: DataDelegate {
    
    //Función de extensión
    func updateArray(newArray: String) {
                
        do {
            let decoder = JSONDecoder()
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
            decoder.dateDecodingStrategy = .formatted(dateFormatter)
            donationsArray = try decoder.decode([Donation].self, from: newArray.data(using: .utf8)!)

            //Filtro onsiderando estado de recepción
            donationsArray = donationsArray.filter {$0.estado_recepcion_almacen == false}
                
            //print(donationsArray)
        } catch {
            print("Failed to decode Donations!")
        }
            self.donationsTableView?.reloadData()
    }
}
