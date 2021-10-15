//
//  IDS35_DViewController.swift
//  CaritasApp
//
//  Created by Santiago A.A.M on 06/10/21.
//

import UIKit

class IDS35_DViewController: UIViewController {

    @IBAction func onCloseButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    @IBAction func onGoButtonImport(_ sender: Any) {
        performSegue(withIdentifier: "DonatorToImport", sender: self)
    }
    @IBAction func onGoButtonHistory(_ sender: Any) {
        performSegue(withIdentifier: "DonatorToHistory", sender: self)
    }
        
    //Filtro dependiendo del usuario una vez que haya login
    //En este caso, se muestran todos al acceder desde donador
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Archivo siguiente IDS23_D
    
        if segue.identifier == "DonatorToHistory" {
            let vc = segue.destination as! IDS23_HViewController
            vc.givenId = "LoginDonador"
            vc.fetch = true
        } else if segue.identifier == "DonatorToHistory" {
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
