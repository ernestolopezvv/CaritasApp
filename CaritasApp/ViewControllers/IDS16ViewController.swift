//
//  IDS16ViewController.swift
//  CaritasApp
//
//  Created by Santiago A.A.M on 07/10/21.
//

import UIKit

class IDS16ViewController: UIViewController {
    
    var donacion:Donation?
    var fecha = String()
    var peso = Double()

    @IBAction func onCloseButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
    @IBOutlet weak var fechaRecoleccionLabel: UILabel!
    
    @IBOutlet weak var pesoDonacionLabel: UILabel!
    
    @IBOutlet weak var donadorLabel: UILabel!
    
    @IBOutlet weak var almacenLabel: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let dateFormater = DateFormatter()
        dateFormater.dateFormat = "YYYY-MM-dd"
        
        fecha = dateFormater.string(from: (donacion?.fecha_creacion)!)
        
        peso = (donacion?.peso_total_reportado)!
        
        fechaRecoleccionLabel.text = fecha
        pesoDonacionLabel.text = String(peso)
        
        donadorLabel.text = donacion?.donador?.nombre
        
        almacenLabel.text = donacion?.almacen_destino
        
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
