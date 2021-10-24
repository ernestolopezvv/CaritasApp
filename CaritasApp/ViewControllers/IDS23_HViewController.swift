//
//  IDS23_HViewController.swift
//  CaritasApp
//
//  Created by Santiago A.A.M on 07/10/21.
//

import UIKit

class IDS23_HViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    //Archivo anterior IDS25_SD
    public var donator: User?
    var fetch = false
    public var givenId: String?
    
    // Este archivo
    var donationsArray = [Donation]()
    
    //Se prepara para la siguiente pantalla
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Archivo siguiente IDS23_D
        let vc = segue.destination as! IDS23_DViewController
        
        if segue.identifier == "donationDetailsSegue" {
            vc.donation = donationsArray[donationsTableView.indexPathForSelectedRow!.row]
            vc.fetch = true
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return donationsArray.count
    }
    
    //Asignación de lo contenido en las celdas
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "donationsCell", for: indexPath)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "YYYY-MM-dd"            
        
        
        cell.textLabel?.text = dateFormatter.string(from: donationsArray[indexPath.row].fecha_recepcion!)
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

//Extension donde se ejecuta la solicitud de información a la base de datos
extension IDS23_HViewController: DataDelegate {
    
    func updateArray(newArray: String) {
                
        do {
            let decoder = JSONDecoder()
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
            decoder.dateDecodingStrategy = .formatted(dateFormatter)
            donationsArray = try decoder.decode([Donation].self, from: newArray.data(using: .utf8)!)

            //Filtro cosiderando el estado de la factura, para saber las donaciones que ya terminaron
            donationsArray = donationsArray.filter {$0.estado_factura == true}
            //Considerando login/acceso de usuario
            if (givenId != "LoginDonador") {
                donationsArray = donationsArray.filter {$0.donador?.id == donator?._id}
            } else {
                donationsArray = [Donation]()
                
                if (donationsArray.isEmpty)
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

