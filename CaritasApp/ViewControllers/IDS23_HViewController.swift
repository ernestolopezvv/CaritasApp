//
//  IDS23_HViewController.swift
//  CaritasApp
//
//  Created by Santiago A.A.M on 07/10/21.
//

import UIKit
/*
protocol DataDelegate {
    func updateArray(newArray: String)
}
*/

class IDS23_HViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    //Archivo anterior IDS25_SD
    public var donator: User?
    var fetch = false
    public var givenId: String?
    // Este archivo
    var dArray = [Donation]()
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Archivo siguiente IDS23_D
        let vc = segue.destination as! IDS23_DViewController
        
        if segue.identifier == "donationDetailsSegue" {
            vc.donation = dArray[donationsTableView.indexPathForSelectedRow!.row]
            vc.fetch = true
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return dArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "donationsCell", for: indexPath)
       
       // let dateFormatter = DateFormatter()
        //dateFormatter.dateFormat = "YYYY-MM-dd"
        let stringRecepcionDate = dArray[indexPath.row].fecha_recepcion
        let dateFormatterRecepcion = DateFormatter()
        dateFormatterRecepcion.dateFormat = "YYYY-MM-dd"
        let recepcionDateFormat = dateFormatterRecepcion.date(from: stringRecepcionDate)
        let newRecepcionDate = dateFormatterRecepcion.string(from: recepcionDateFormat!)
        
        
        cell.textLabel?.text = String(newRecepcionDate)
        //cell.textLabel?.text = donationsArray[indexPath.row].fecha_recepcion
        return cell
    }

    @IBOutlet weak var donationsTableView: UITableView!
    
    override func viewWillAppear(_ animated: Bool) {
        
        APIFunctions.functions.fetchDonations()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        APIFunctions.functions.fetchDonations()
        
    }
    
    @IBAction func onCloseButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        APIFunctions.functions.delegate = self
        APIFunctions.functions.fetchDonations()
        
        donationsTableView.delegate = self
        donationsTableView.dataSource = self
    }
}

extension IDS23_HViewController: DataDelegate {
    
    //Función de extensión
    func updateArray(newArray: String) {
                
        do {
            let decoder = JSONDecoder()
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
            decoder.dateDecodingStrategy = .formatted(dateFormatter)
            dArray = try decoder.decode([Donation].self, from: newArray.data(using: .utf8)!)

            dArray = dArray.filter {$0.estado_factura == true}
            //Considerando login/acceso de usuario
            if (givenId != "LoginDonador") {
                dArray = dArray.filter {$0.donador.id == donator?._id}
            } else {
                dArray = [Donation]()
                
                if (dArray.isEmpty)
                {
                    let alertController = UIAlertController(title: "Inicia sesión!", message: "No hay ninguna donación para mostrar", preferredStyle: .alert)
                    alertController.addAction(UIAlertAction(title: "Aceptar", style: .default, handler: nil))
                    present(alertController, animated: true)
                }
            }
            //print(donationsArray)
        } catch {
            print("Failed to decode Donations!")
        }
            self.donationsTableView?.reloadData()
    }
}
    

    
