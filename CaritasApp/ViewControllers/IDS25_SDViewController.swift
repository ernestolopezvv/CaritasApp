//
//  IDS25_SDViewController.swift
//  CaritasApp
//
//  Created by Enrique Ruiz on 08/10/21.
//

import UIKit

class IDS25_SDViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    //Variable que contiene todos los donadores, obtenidos de la base de datos
    var donatorsArray = [User]()
    
    // Se prepara para la siguiente pantalla para seleccionar donación específica, además de asignar variables a utilizar
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let vc = segue.destination as! IDS23_HViewController
        
        if segue.identifier == "DonatorsToDonationsSegue" {            
            vc.donator = donatorsArray[donatorsTableView.indexPathForSelectedRow!.row]
            vc.fetch = true
        }
    }
    
    //Funciones para mostrar el contenido del TableView
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return donatorsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "donatorsCell", for: indexPath)
        
        cell.textLabel?.text = donatorsArray[indexPath.row].correo
        return cell
    }
    
    //Hook del table View
    @IBOutlet weak var donatorsTableView: UITableView!
    
    override func viewWillAppear(_ animated: Bool) {
        
        APIFunctions.functions.fetchDonators()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        APIFunctions.functions.fetchDonators()
    }
    

    
    @IBAction func onCloseButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        APIFunctions.functions.delegate = self
        APIFunctions.functions.fetchDonators()
      
        donatorsTableView.delegate = self
        donatorsTableView.dataSource = self
    }
}
    

//Se solicita la información para mostrar
extension IDS25_SDViewController: DataDelegate {
    
    func updateArray(newArray: String) {
        
        do {
            donatorsArray = try JSONDecoder().decode([User].self, from: newArray.data(using: .utf8)!)
            print(donatorsArray)
            //Filtro para almacenar solo los usuarios que son donadores
            donatorsArray = donatorsArray.filter{$0.rol == "Donador"}
            //print(donatorsArray)
        } catch {
            print("Failed to decode Donators!")
        }
        self.donatorsTableView?.reloadData()
    }

}
