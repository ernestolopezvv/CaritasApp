//
//  IDS2_18ViewController.swift
//  CaritasApp
//
//  Created by Santiago A.A.M on 07/10/21.
//

import UIKit

class IDS2_17ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBAction func onCloseButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
    @IBOutlet weak var itemsTableView: UITableView!
    
    var donation: Donation!
    var fetch = false
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //Esto es lo que se carga
        return donation?.articulos_donados?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "receivingCell", for: indexPath) as! ReceiveCellView
        
        //cell.articuloDonado = donation?.articulos_donados?[indexPath.row]
        //cell.nameLabel.text = donationsArray[indexPath.row].donador.nombre
        
        
        //cell.itemDescription?.text = donation?.articulos_donados?[indexPath.row].descripcion
        cell.itemUPC?.text = donation?.articulos_donados?[indexPath.row].UPC
        cell.itemReportedAmount?.text = String( (donation?.articulos_donados?[indexPath.row].cantidad_donada)!)
        cell.itemReceivedAmount?.text = String( (donation?.articulos_donados?[indexPath.row].cantidad_recibida)!)
        
        //cell.articuloDonado.cantidad_recibida = Int((cell.itemReceivedAmount?.text)!)
        
        
        return cell
    }
    
    
    @IBAction func updateDonation(_ sender: Any) {
                                         
        let cells = self.itemsTableView!.visibleCells as! Array<UITableViewCell>
        var cont = 0

            for cell in cells {
                var celda = cell as! ReceiveCellView
                donation?.articulos_donados?[cont].cantidad_recibida = Int(celda.itemReceivedAmount.text!)
                cont = cont + 1
                
            }

        APIFunctions.functions.receiveDonation(donation: donation!)
        
        let alertController = UIAlertController(title: "!", message: "Aparece después de ejecutar updateDonation", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Aceptar", style: .default, handler: nil/*{action in self.performSegue(withIdentifier: "receiveDonationSegue", sender: self) }*/))
        present(alertController, animated: true)
        print("Print de donacion")
        //print(donation?.articulos_donados?[0].cantidad_recibida)
        
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //APIFunctions.functions.delegate = self
        //APIFunctions.functions.fetchDonations()
        
        itemsTableView.delegate = self
        itemsTableView.dataSource = self
    }
}

class ReceiveCellView: UITableViewCell {
    
    @IBOutlet weak var itemUPC: UILabel!
    @IBOutlet weak var itemReportedAmount: UILabel!
    @IBOutlet weak var itemReceivedAmount: UITextField!
    
    //var articuloDonado: ItemInDonation!
}
