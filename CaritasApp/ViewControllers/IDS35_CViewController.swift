//
//  IDS35_CViewController.swift
//  CaritasApp
//
//  Created by Santiago A.A.M on 06/10/21.
//

import UIKit

class IDS35_CViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    // Recibe las donaciones
    var donacionesArray = [Donation]()
    
    // Informacion detallada de cada donacion en nueva pantalla
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let vc = segue.destination as! IDS16ViewController
        
        if segue.identifier == "recoleccionDetailSegue" {
            
            vc.donacion = donacionesArray[donacionesTableView.indexPathForSelectedRow!.row]
            
            
        }
    }
    
    
    
    @IBAction func onCloseButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func onGoButtonDonationInfo(_ sender: Any) {
        performSegue(withIdentifier: "DriverToDonationInfo", sender: self)
    }
    
    
    
    @IBOutlet weak var donacionesTableView: UITableView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // llama al endpoint Fetchdonacion
        APIFunctions.functions.delegate = self
        APIFunctions.functions.fetchDonations()
        
        
        donacionesTableView.delegate = self
        donacionesTableView.dataSource = self

      
    }
    

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
        return donacionesArray.count
        
    }
    
    //Crea una lista de Donaciones
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "recoleccionesCell", for: indexPath)
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "YYYY-MM-dd"
        
        
        let nombreDonador = donacionesArray[indexPath.row].donador?.nombre
        
        cell.textLabel?.text = nombreDonador
        
        return cell
    }
    
    

}




extension IDS35_CViewController: DataDelegate{
    
    //Llena los datos en una array
    func updateArray(newArray: String) {
        
        do {
            let decoder = JSONDecoder()
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
            decoder.dateDecodingStrategy = .formatted(dateFormatter)
            donacionesArray = try decoder.decode([Donation].self, from: newArray.data(using: .utf8)!)
           
            
        } catch {
            print("Failed to decode Donations!")
        }
        self.donacionesTableView?.reloadData()

        
    }
}
