//
//  IDS17ViewController.swift
//  CaritasApp
//
//  Created by Santiago A.A.M on 07/10/21.
//

import UIKit

class IDS17ViewController: UIViewController {

    @IBAction func onCloseButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func onGoButtonConfirm(_ sender: Any) {
        performSegue(withIdentifier: "RecieveToConfirm", sender: self)
    }
    @IBAction func onGoButtonConfirm2(_ sender: Any) {
        performSegue(withIdentifier: "RecieveToConfirm", sender: self)
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
