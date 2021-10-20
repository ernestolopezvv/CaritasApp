//
//  APIFunctions.swift
//  CaritasApp
//
//  Created by Enrique Ruiz on 08/10/21.
//

import Foundation
import Alamofire

class APIFunctions {
    
    var delegate: DataDelegate?
    static let functions = APIFunctions()
    
    func fetchDonations() {
        
        AF.request("https://caritas-app-backend.herokuapp.com/fetchdonacion").response {response in
            
            print("Response fetchDonacion")
            let data = String(data: response.data!, encoding: .utf8)
            print(data)
            self.delegate?.updateArray(newArray: data!)
        }
    }
    
    func fetchDonators() {
        
        AF.request("https://caritas-app-backend.herokuapp.com/fetchusuario").response {response in
            
            print("Response fetchDonador")
            let data = String(data: response.data!, encoding: .utf8)
            print(data)
            self.delegate?.updateArray(newArray: data!)
        }
    }
    
    func fetchItems() {
        
        AF.request("https://caritas-app-backend.herokuapp.com/fetcharticulo").response {response in
            
            print("Previo a response fetchDonador")
            print(response.data)
            let data = String(data: response.data!, encoding: .utf8)
            
            self.delegate?.updateArray(newArray: data!)
        }
    }
    
    func updateItem(descripcion:String, uom: String, upc: String, peso_articulo: String) {
        
        AF.request("https://caritas-app-backend.herokuapp.com/updatearticulo", method: .post, encoding: URLEncoding.httpBody, headers: ["descripcion": descripcion, "uom":uom, "upc":upc, "peso articulo kg":peso_articulo]).responseJSON {response in
            
        }
    }
    
    func createDonacion(/*fecha_creacion:String, peso_total_reportado:String, precio_total_reportado:String, estado_factura:String, estado_recepcion_almacen: String, estado_recepcion_chofer:String, almacen_destino:String, articulos_donados: [ItemInDonation]*/donation: Donation) {
            
        /*AF.request("https://caritas-app-backend.herokuapp.com/createdonation", method: .post, encoding: URLEncoding.httpBody, headers: [/*"fecha_creacion": fecha_creacion,*/ "peso_total_reportado": peso_total_reportado, "precio_total_reportado": precio_total_reportado, "estado_factura":"false", "estado_recepcion_almacen":"false", "estado_recepcion_chofer":"false", "almacen_destino":"0", "articulos_donados": articulos_donados]).responseJSON {response in
    
            }
         */
        let url = URL(string: "https://caritas-app-backend.herokuapp.com/createdonation")
        var request = URLRequest(url: url!)
        request.httpMethod = HTTPMethod.post.rawValue
        request.setValue("application/json; charset=UTF-8", forHTTPHeaderField: "Content-Type")
        let encoder = JSONEncoder()
        let jsonData = try! encoder.encode(donation)
        request.httpBody = jsonData
        AF.request(request).responseJSON {response in
            print("hola")
            print(response.data)
        }
    }
    
    func addItem(descripcion:String, uom: String, upc: String, peso_articulo_kg: String) {
        
        AF.request("https://caritas-app-backend.herokuapp.com/createarticulo", method: .post, encoding: URLEncoding.httpBody, headers: ["descripcion": descripcion, "uom":uom, "upc":upc, "peso_articulo_kg":peso_articulo_kg]).responseJSON {response in
            
        }
    }
}
