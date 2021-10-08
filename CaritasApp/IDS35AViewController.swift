//
//  IDS35AViewController.swift
//  CaritasApp
//
//  Created by Santiago A.A.M on 06/10/21.
//

import UIKit
import FSCalendar

class IDS35AViewController: UIViewController {
    @IBAction func onGoButtonDonation(_ sender: Any) {
        performSegue(withIdentifier: "AdminToDonation", sender: self)
    }
    @IBAction func onGoButtonCalendar(_ sender: Any) {
        performSegue(withIdentifier: "AdminToCalendar", sender: self)
    }
    
    @IBAction func onCloseButton(_ sender: Any) {
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
