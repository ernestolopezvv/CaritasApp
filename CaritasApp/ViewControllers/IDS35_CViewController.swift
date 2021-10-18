//
//  IDS35_CViewController.swift
//  CaritasApp
//
//  Created by Santiago A.A.M on 06/10/21.
//

import UIKit



class IDS35_CViewController: UIViewController {
    
    var chofer = "Erick Solis Mahl"
    var recolecciones = [Donation]()
  

    
    @IBOutlet weak var recoleccionesTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        APIFunctions.functions.delegate = self
        APIFunctions.functions.fetchDonations()
        
        recoleccionesTableView.delegate = self
        recoleccionesTableView.dataSource = self
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // Detect wich indexPath doanation the user slected
        let indexPath = recoleccionesTableView.indexPathForSelectedRow
        
        guard indexPath != nil else {
            //The user hasn't selected anything
            return
        }
        
        // Get the Items of the Donation the user tapped on
        let donacion = recolecciones[indexPath!.row]
        
        // Get the reference to the IDS16_ViewControler
        let detailViewControler = segue.destination as! IDS16ViewController
        
        // Pass the donation to te IDS16_ViewContreler
        detailViewControler.itemsList = donacion.articulos_donados
        
        detailViewControler.logo = donacion.donador.nombre
        
        
        
    }

}

extension IDS35_CViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        print("Selecciono Recoleccion")
    }
   
    
}

extension IDS35_CViewController: UITableViewDataSource {
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recolecciones.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell = recoleccionesTableView.dequeueReusableCell(withIdentifier: "recoleccionesCell", for: indexPath) as! RecoleccionesTableViewCell
        
        //MARK: Fecha Donacion Label
        let isDate = recolecciones[indexPath.row].fecha_creacion
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        let date = dateFormatter.date(from: isDate)!

        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "es_ES")
        formatter.dateStyle = .short
        
        let fechaDonacion = formatter.string(from: date)
        
        //MARK: Logo Donador Label
        let logo  = recolecciones[indexPath.row].donador.nombre
        
        cell.fechaDonacionLabel.text = fechaDonacion
        cell.logoImageView.image = UIImage(named: logo)
        
        
        //MARK: Cantidad de  Articulos Donados Label
        cell.cantidadArticulosLabel.text = String(recolecciones[indexPath.row].articulos_donados.count)
        
        //MARK: Fecha Almacen Label
        
        cell.almacenDestiniLabel.text = recolecciones[indexPath.row].almacen_destino
        
        
        
        return cell
    }
  
    
}




extension IDS35_CViewController: DataDelegate {
    
    func updateArray(newArray: String) {
        
        do {
            recolecciones = try JSONDecoder().decode([Donation].self, from: newArray.data(using: .utf8)!)
            print(recolecciones)
            
        }catch {
            print("Faild to decode")
            
        }
        self.recoleccionesTableView?.reloadData()
    }
    
}




