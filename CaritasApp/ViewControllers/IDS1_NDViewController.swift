//
//  IDS1_NDViewController.swift
//  CaritasApp
//
//  Created by Ernesto López on 07/10/21.
//

import UIKit
import UniformTypeIdentifiers

class IDS1_NDViewController: UIViewController {
    
    
    var donation: Donation?
    var update = false
    
    // Conexiones con el storyboard
    @IBOutlet weak var pesoTotalTextField: UITextField!
    @IBOutlet weak var precioTotalTextField: UITextField!
    @IBOutlet weak var loadedFile: UITextView!
    @IBAction func onCloseButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    

    // Cuando se cargue un archivo se remarcaran en dos TextFields los valores del peso y precio
    override func viewDidLoad() {
        super.viewDidLoad()
        if update == true{
            pesoTotalTextField.placeholder = "Peso total de la donacion"
            precioTotalTextField.placeholder = "Precio total de la donacion"
            pesoTotalTextField.text = String(format: "%f", donation!.peso_total_reportado!)
            precioTotalTextField.text = String(format: "%f", donation!.precio_total_reportado!)
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "dd/mm/yyyy"
        }
    }
    
    // Al momento de aceptar la donación se mandará a la base de datos con la funcion del APIFunctions
    @IBAction func subirArchivo(_ sender: Any) {
        APIFunctions.functions.createDonacion(donation:donation!)
               let alertController = UIAlertController(title: "Agregado", message: "Se agrego una nueva donacion", preferredStyle: .alert)
               let OKAction = UIAlertAction(title: "OK", style: .default) {
                   (action: UIAlertAction!) in
                   // Code in this block will trigger when OK button tapped.
                   print("Donacion agregado");
               }
               alertController.addAction(OKAction)
               self.present(alertController, animated: true, completion: nil)
               
           }

    
    // Imprime en un textView toda la información contenida en el JSON, esto para que el usuario
    // pueda verificar que los datos introducidos hayan sido los correctos.
    @IBAction func loadFile(_ sender: UIButton) {
        let supportedTypes: [UTType] = [UTType.json]
        let documentPicker = UIDocumentPickerViewController(forOpeningContentTypes: supportedTypes, asCopy: true)
         documentPicker.delegate = self
         documentPicker.allowsMultipleSelection = false
         documentPicker.modalPresentationStyle = .fullScreen
         present(documentPicker, animated: true, completion: nil)
    }
}

    // Le permite al usuario importar un documento dentro del teléfono a la aplicación, así como
    // leer en diferentes formatos la información.
extension IDS1_NDViewController: UIDocumentPickerDelegate {
    public func documentPicker(_ controller: UIDocumentPickerViewController, didPickDocumentsAt urls: [URL]) {

        if let url = urls.first {
            let fileTool = DonationFileTool()
            
            do {
                let readString = try fileTool.readFileAsString(url)
                self.loadedFile.text = readString
            } catch {
                print("error trying to convert data to String")
            }
            
            do {
                let readJson = try fileTool.readFileAsJson(url)
                print("JSON: \(String(describing: readJson))")
            } catch {
                print("error trying to convert data to JSON")
            }
            
            do {
                donation = try fileTool.readFileAsDonation(url)
                self.pesoTotalTextField.text = String(format: "%f", donation!.peso_total_reportado!)
                self.precioTotalTextField.text = String(format: "%f", donation!.precio_total_reportado!)
            } catch {
                print("error trying to convert data to JSON")
            }
        }
        controller.dismiss(animated: true)
    }
        
}
