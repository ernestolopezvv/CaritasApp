//
//  IDS1_APViewController.swift
//  CaritasApp
//
//  Created by Santiago A.A.M on 07/10/21.
//

import UIKit

class IDS1_APViewController: UIViewController {
    
    var item: Item?
    var update = false
    
    @IBAction func onCloseButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)

    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var itemDescriptionTextField: UITextField!
    @IBOutlet weak var itemUomTextField: UITextField!
    @IBOutlet weak var itemUpcTextField: UITextField!
    @IBOutlet weak var itemWeightTextField: UITextField!
    
    @IBAction func saveClick(_ sender: Any) {
        
        if update == true {
            
            APIFunctions.functions.updateDonation(receptionState: receptionStateTextField.text!, billState: billStateTextField.text!, creationDate: creationDateTextField.text!, receptionDate: receptionDateTextField.text!, weightKg: weightKgTextField.text!, destination: destinationTextField.text!, id:donation!._id)
            
            
        }
        else {
            
            APIFunctions.functions.addDonation(receptionState: receptionStateTextField.text!, billState: billStateTextField.text!, creationDate: creationDateTextField.text!, receptionDate: receptionDateTextField.text!, weightKg: weightKgTextField.text!, destination: destinationTextField.text!)
            
        }
        self.navigationController?.popViewController(animated: true)

        
    }
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
