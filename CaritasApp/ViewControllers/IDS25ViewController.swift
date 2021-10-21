//
//  IDS25ViewController.swift
//  CaritasApp
//
//  Created by Santiago A.A.M on 07/10/21.
//

import UIKit

class IDS25ViewController: UIViewController {
    // Se continúa a la pantalla para seleccionar donador
    @IBAction func onGoButton(_ sender: Any) {
        performSegue(withIdentifier: "DonationToDonator", sender: self)
    }
    
    @IBAction func onCloseButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
