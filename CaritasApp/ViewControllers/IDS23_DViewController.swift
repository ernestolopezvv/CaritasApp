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
    
    
    @IBOutlet weak var ticketLabel: UILabel!
    @IBOutlet weak var donatorLabel: UILabel!
    @IBOutlet weak var dateReceived: UILabel!
    @IBOutlet weak var amountBilledLabel: UILabel!
    @IBOutlet weak var weightKgLabel: UILabel!
    @IBOutlet weak var deliveredByLabel: UILabel!
    @IBOutlet weak var storedByLabel: UILabel!
    
    
    override func viewWillAppear(_ animated: Bool) {
        

    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if fetch == true {
           
            ticketLabel.text = donation!.receptionState
            donatorLabel.text = donation!.billState
            dateReceived.text = donation!.creationDate
            amountBilledLabel.text = donation!.receptionDate
            weightKgLabel.text = donation!.weightKg
            deliveredByLabel.text = donation!.destination
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
