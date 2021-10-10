//
//  IDS34ViewController.swift
//  CaritasApp
//
//  Created by Ernesto López on 09/09/21.
//
//Cambio prueba dentro de main para el rebase

import UIKit

class IDS34ViewController: UIViewController {
    
    @IBAction func onGoButtonAdmin(_ sender: Any) {
        performSegue(withIdentifier: "LoginToAdmin", sender: self)
    }
    @IBAction func onGoButtonDriver(_ sender: Any) {
        performSegue(withIdentifier: "LoginToDriver", sender: self)
    }
    @IBAction func onGoButtonDonator(_ sender: Any) {
        performSegue(withIdentifier: "LoginToDonator", sender: self)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

