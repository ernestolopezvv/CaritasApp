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
    
    
    
    @IBOutlet weak var receptionStateTextField: UITextField!
    @IBOutlet weak var billStateTextField: UITextField!
    @IBOutlet weak var creationDateTextField: UITextField!
    @IBOutlet weak var receptionDateTextField: UITextField!
    @IBOutlet weak var weightKgTextField: UITextField!
    @IBOutlet weak var destinationTextField: UITextField!

    
    override func viewWillAppear(_ animated: Bool) {
        

    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if fetch == true {
            receptionDateTextField = data.receptionDate
            
            APIFunctionsPrueba.functions.fe
        receptionState: receptionStateTextField.text!, billState: billStateTextField.text!, creationDate: creationDateTextField.text!, receptionDate: receptionDateTextField.text!, weightKg: weightKgTextField.text!, destination: destinationTextField.text!, id:donation!._id)
            
            
        }
        else {
            
            APIFunctionsPrueba.functions.fectchDonation(receptionState: receptionStateTextField.text!, billState: billStateTextField.text!, creationDate: creationDateTextField.text!, receptionDate: receptionDateTextField.text!, weightKg: weightKgTextField.text!, destination: destinationTextField.text!)
            
        }
        self.navigationController?.popViewController(animated: true)
       

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
