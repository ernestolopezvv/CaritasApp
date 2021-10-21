//
//  IDS35_AViewController.swift
//  CaritasApp
//
//  Created by Santiago A.A.M on 06/10/21.
//

import UIKit
import FSCalendar

class IDS35_AViewController: UIViewController {
    
    //Asignaciones de diferentes segues a cada botón mediante hooks
    @IBAction func onGoButtonDonation(_ sender: Any) {
        performSegue(withIdentifier: "AdminToDonation", sender: self)
    }
    @IBAction func onGoButtonCalendar(_ sender: Any) {
        performSegue(withIdentifier: "AdminToCalendar", sender: self)
    }
    
    @IBAction func onGoButtonRecieve(_ sender: Any) {
        performSegue(withIdentifier: "AdminToRecieve", sender: self)
    }
    
    @IBAction func onGoButtonAdd(_ sender: Any) {
        performSegue(withIdentifier: "AdminToAdd", sender: self)
    }
    
    @IBAction func onCloseButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    

}
