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
        
        if update == true {
            
            itemDescriptionTextField.text = item!.descripcion
            itemUomTextField.text = item!.uom
            itemUpcTextField.text = item!.upc
            itemWeightTextField.text = item!.peso_articulo_kg
            
            
        }

    }
    
    @IBOutlet weak var itemDescriptionTextField: UITextField!
    @IBOutlet weak var itemUomTextField: UITextField!
    @IBOutlet weak var itemUpcTextField: UITextField!
    @IBOutlet weak var itemWeightTextField: UITextField!
    
    @IBAction func saveClick(_ sender: Any) {
        APIFunctions.functions.addItem(descripcion: itemDescriptionTextField.text!, uom: itemUomTextField.text!, upc: itemUpcTextField.text!, peso_articulo_kg: itemWeightTextField.text!)
        let alertController = UIAlertController(title: "Agregado!", message: "Se agrego un nuevo producto", preferredStyle: .alert)
        let OKAction = UIAlertAction(title: "OK", style: .default) {
            (action: UIAlertAction!) in
            // Code in this block will trigger when OK button tapped.
            print("Producto agregado");
        }
        alertController.addAction(OKAction)
        self.present(alertController, animated: true, completion: nil)
        
        /*if update == true {
            
            APIFunctions.functions.updateItem(descripcion: itemDescriptionTextField.text!, uom: itemUomTextField.text!, upc: itemUpcTextField.text!, peso_articulo: itemWeightTextField.text!)
            
            
        }
        else {
            
            APIFunctions.functions.addItem(descripcion: itemDescriptionTextField.text!, uom: itemUomTextField.text!, upc: itemUpcTextField.text!, peso_articulo: itemWeightTextField.text!)
            
        }*/
        //self.navigationController?.popViewController(animated: true)

        
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


