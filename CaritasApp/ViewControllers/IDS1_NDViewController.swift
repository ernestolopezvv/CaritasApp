//
//  IDS1_NDViewController.swift
//  CaritasApp
//
//  Created by Santiago A.A.M on 07/10/21.
//

import UIKit
import UniformTypeIdentifiers

class IDS1_NDViewController: UIViewController {
    
    
    @IBOutlet weak var fechaTextField: UITextField!
    @IBOutlet weak var pesoTextField: UITextField!
    @IBOutlet weak var precioTotalTextField: UITextField!
    @IBOutlet weak var donadorIDTextField: UITextField!
    
    @IBOutlet weak var nombreDonadorTextField: UITextField!
    
    @IBOutlet weak var upcTextField: UITextField!
    
    @IBOutlet weak var cantidadDonadaTextField: UITextField!
    
    @IBOutlet weak var precioUnitarioTextField: UITextField!
    
    @IBOutlet weak var precioTotalUnitarioTextField: UITextField!
    
    
    @IBOutlet weak var numeroSerieTextField: UITextField!
    
    @IBOutlet weak var loadedFile: UITextView!
    
    @IBAction func onCloseButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
        
    @IBAction func loadFile(_ sender: UIButton) {
        let supportedTypes: [UTType] = [UTType.json]
        let documentPicker = UIDocumentPickerViewController(forOpeningContentTypes: supportedTypes, asCopy: true)
         documentPicker.delegate = self
         documentPicker.allowsMultipleSelection = false
         documentPicker.modalPresentationStyle = .fullScreen
         present(documentPicker, animated: true, completion: nil)
    }
    


        // APIFunctions.functions.crearDonacion(almacen_destino: "1")
    
}

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
                let readDonation = try fileTool.readFileAsDonation(url)
                
                /*
                if (readDonation.almacen_destino != Donation.almacen_destino){
                    let alertController = UIAlertController(title: "Error", message: "Invalid Unit", preferredStyle: UIAlertController.Style.alert)
                    alertController.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
                    present(alertController, animated: true, completion: nil)
                }
                 */
                self.fechaTextField.text = String(readDonation.fecha_creacion)
                print("hola")
                print(readDonation.peso_total_reportado!)
                self.pesoTextField.text = String(format: "%f", readDonation.peso_total_reportado!)
                self.precioTotalTextField.text = String(format: "%f", readDonation.precio_total_reportado!)
                self.donadorIDTextField.text = String(readDonation.idUsuario!)
                self.nombreDonadorTextField.text = String(readDonation.nombreDonador!)
                self.upcTextField.text = String(readDonation.UPC!)
                self.cantidadDonadaTextField.text = String(format: "%f", readDonation.cantidad_donada!)
                self.precioUnitarioTextField.text = String(format: "%f", readDonation.precio_unitario!)
                self.precioTotalUnitarioTextField.text = String(format: "%f", readDonation.precio_total_unidades!)
                self.numeroSerieTextField.text = String(readDonation.numero_serie_externo!)

                
            } catch {
                print("error trying to convert data to JSON")
            }
        }

        controller.dismiss(animated: true)
    }
    
}
