//
//  IDS16ViewController.swift
//  CaritasApp
//
//  Created by Santiago A.A.M on 07/10/21.
//

import UIKit

class IDS16ViewController: UIViewController {

    var itemsList = [Item]()
    var logo = String()
    var articulosArray = [Int]()
    
    @IBOutlet weak var donadorImageView: UIImageView!
    @IBOutlet weak var productosTableView: UITableView!
   
    @IBOutlet weak var cantidadTotalArticulosLabel: UILabel!
    
    @IBOutlet weak var pesoRecoleccionLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        donadorImageView.image = UIImage(named: logo)
        
        
        productosTableView.dataSource = self
        
        
        
        
    }
    

}

extension IDS16ViewController: UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return itemsList.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = productosTableView.dequeueReusableCell(withIdentifier: "articulosCell", for: indexPath) as! ArticulosTableViewCell
        
        let descripcion = itemsList[indexPath.row].descripcion
        
        cell.descripcionArticuloLabel.text = descripcion
        
        cell.imagenArtinculoImageView.image = UIImage(named: descripcion)
        
        let cantidadArticulos = String( itemsList[indexPath.row].cantidad_donada)
        
        cell.catidadArtiucloLabel.text = cantidadArticulos
       
        articulosArray.append(Int(cantidadArticulos)!)

        var total = articulosArray.reduce(0, +)
        
        cantidadTotalArticulosLabel.text = String(total)
        
        
        
        return cell
    }

    
    
    
}



