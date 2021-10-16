//
//  IDS23_DViewController.swift
//  CaritasApp
//
//  Created by Santiago A.A.M on 07/10/21.
//

import UIKit

class IDS23_DViewController: UIViewController {
    
    @IBAction func onCloseButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    var donation: Donation?
    var fetch = false
    
    
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var donadorLabel: UILabel!
    @IBOutlet weak var recolectorLabel: UILabel!
    @IBOutlet weak var fechaCreacionLabel: UILabel!
    @IBOutlet weak var fechaRecoleccionLabel: UILabel!
    @IBOutlet weak var cantidadFacturadaLabel: UILabel!
    @IBOutlet weak var pesoRecibidoLabel: UILabel!

    
    
    override func viewWillAppear(_ animated: Bool) {
        

    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if fetch == true {
           
            idLabel.text = donation!._id
            donadorLabel.text = donation!.donador.nombre
            recolectorLabel.text = donation!.recolector.nombre
            
            let stringCreacionDate = donation?.fecha_creacion
            let dateFormatterCreacion = DateFormatter()
            dateFormatterCreacion.dateFormat = "YYYY-MM-dd"
            let creacionDateFormat = dateFormatterCreacion.date(from: stringCreacionDate!)
            let newCreacionDate = dateFormatterCreacion.string(from: creacionDateFormat!)

            fechaCreacionLabel.text = String(newCreacionDate)
            
            let stringRecepcionDate = donation?.fecha_recepcion
            let dateFormatterRecepcion = DateFormatter()
            dateFormatterRecepcion.dateFormat = "YYYY-MM-dd"
            let recepcionDateFormat = dateFormatterRecepcion.date(from: stringRecepcionDate!)
            let newRecepcionDate = dateFormatterRecepcion.string(from: recepcionDateFormat!)
            
            fechaRecoleccionLabel.text = String(newRecepcionDate)
             cantidadFacturadaLabel.text = String(donation!.precio_total_recibido)
            pesoRecibidoLabel.text = String(donation!.peso_total_recibido)
            //pesoRecibidoLabel.text = donation!.articulos_donados[1].upc
        }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    }

}
