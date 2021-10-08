//
//  IDS-25_SDViewController.swift
//  CaritasApp
//
//  Created by Enrique Ruiz on 08/10/21.
//

import UIKit

class IDS25_SDViewController: UIViewController {
 
    @IBAction func on2GoButton(_ sender: Any) {
        performSegue(withIdentifier: "DonatorToHistory", sender: self)
    }
    
    
    @IBAction func on2CloseButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
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
