//
//  IDS23_DViewController.swift
//  CaritasApp
//
//  Created by Santiago A.A.M on 07/10/21.
//

import UIKit

class IDS23_CViewController: UIViewController {
    
    @IBAction func onCloseButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    //Variables asignadas antes de acceder a esta pantalla
    var donation: Donation?
    var fetch = false
    
    // Fetch de los datos generales de la donacion
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var donadorLabel: UILabel!
    @IBOutlet weak var recolectorLabel: UILabel!
    @IBOutlet weak var fechaCreacionLabel: UILabel!
    @IBOutlet weak var fechaRecoleccionLabel: UILabel!
    @IBOutlet weak var cantidadFacturadaLabel: UILabel!
    @IBOutlet weak var pesoRecibidoLabel: UILabel!
    @IBOutlet weak var almacenDestinoTextField: UITextField!
    
    //Asignacion de valores para mostrar en el interfaz mediante el uso de hooks
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if fetch == true {
           
            idLabel.text = donation!._id
            donadorLabel.text = donation!.donador?.nombre
            recolectorLabel.text = donation!.recolector?.nombre
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "YYYY-MM-dd"
            fechaCreacionLabel.text = dateFormatter.string(from:donation!.fecha_creacion!)
            fechaRecoleccionLabel.text = dateFormatter.string(from:donation!.fecha_recepcion!)
            cantidadFacturadaLabel.text = String(format: "%f",donation!.precio_total_recibido!)
            pesoRecibidoLabel.text = String(format: "%f",donation!.peso_total_recibido!)
            //pesoRecibidoLabel.text = donation!.articulos_donados[1].upc
            almacenDestinoTextField.text = donation!.almacen_destino!
        }
    }
    
    // Se asigna el nuevo valor del almacen en un textfield y se llama a la función del APIFunctions
    // para actualizarlo en la base de datos
    @IBAction func updateAlmacen(_ sender: Any) {
        donation?.almacen_destino = almacenDestinoTextField.text
        APIFunctions.functions.asignarAlmacen(donation: donation!)
        
        let alertController = UIAlertController(title: "Almacen destino actualizado", message: "Regresa al menu principal", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Aceptar", style: .default, handler: nil/*{action in self.performSegue(withIdentifier: "receiveDonationSegue", sender: self) }*/))
        present(alertController, animated: true)
    }
}
