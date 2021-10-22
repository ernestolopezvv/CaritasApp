//
//  IDS2_18ViewController.swift
//  CaritasApp
//
//  Created by Santiago A.A.M on 07/10/21.
//

import UIKit

class IDS2_17ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    //Botón para regresar pantalla
    @IBAction func onCloseButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    //Hook de la TableView de los artículos
    @IBOutlet weak var itemsTableView: UITableView!
    
    //Variables asignadas en el archivo anterior
    var donation: Donation!
    var fetch = false
    
    //Funciones para ostrar la información en la TableView
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //Esto es lo que se carga
        return donation?.articulos_donados?.count ?? 0
    }
    
    //Asignación de información a mostrar en cada celda
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "receivingCell", for: indexPath) as! ReceiveCellView
    
        
        cell.itemUPC?.text = donation?.articulos_donados?[indexPath.row].UPC
        cell.itemReportedAmount?.text = String( (donation?.articulos_donados?[indexPath.row].cantidad_donada)!)
        cell.itemReceivedAmount?.text = String( (donation?.articulos_donados?[indexPath.row].cantidad_recibida)!)
        
        return cell
    }
    
    //Funcion donde se ejecuta el servicio REST de toda la donación después de haber ingresado la cantidad de artículos que llegaron
    @IBAction func updateDonation(_ sender: Any) {
                                         
        let cells = self.itemsTableView!.visibleCells as! Array<UITableViewCell>
        var cont = 0

        //Actualización dentro del objeto donación para enviar al servicio REST
            for cell in cells {
                var celda = cell as! ReceiveCellView
                donation?.articulos_donados?[cont].cantidad_recibida = Int(celda.itemReceivedAmount.text!)
                cont = cont + 1
                
            }

        APIFunctions.functions.receiveDonation(donation: donation!)
        
        let alertController = UIAlertController(title: "Donación recibida!", message: "Regresa al menu principal", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Aceptar", style: .default, handler: nil/*{action in self.performSegue(withIdentifier: "receiveDonationSegue", sender: self) }*/))
        present(alertController, animated: true)
        print("Print de donacion")
        print(donation?.articulos_donados?[0].cantidad_recibida)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        itemsTableView.delegate = self
        itemsTableView.dataSource = self
    }
}

//Subclase para asginar valores a los elementos de cada celda
class ReceiveCellView: UITableViewCell {
    
    @IBOutlet weak var itemUPC: UILabel!
    @IBOutlet weak var itemReportedAmount: UILabel!
    @IBOutlet weak var itemReceivedAmount: UITextField!
}
