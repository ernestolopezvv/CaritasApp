//
//  IDS1_NDViewController.swift
//  CaritasApp
//
//  Created by Santiago A.A.M on 07/10/21.
//

import UIKit
import UniformTypeIdentifiers

class IDS1_NDViewController: UIViewController, UIDocumentPickerDelegate {
    
    @IBOutlet weak var loadedFile: UITextView!
    
    @IBAction func onCloseButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func loadFile(_ sender: UIButton) {
        let supportedTypes: [UTType] = [UTType.json]
        let documentPicker = UIDocumentPickerViewController(forOpeningContentTypes: supportedTypes, asCopy: true)
         documentPicker.delegate = self
         documentPicker.allowsMultipleSelection = false
         documentPicker.modalPresentationStyle = .fullScreen
         present(documentPicker, animated: true, completion: nil)
    }
    
    public func readFileAsJson(_ url: URL) throws -> Any? {
        print("The Url is : \(url)")
        let data = try Data(contentsOf: url)
        let json = try? JSONSerialization.jsonObject(with: data, options: [])
        print("Json data=\(String(describing: json))")
        
        return json
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
