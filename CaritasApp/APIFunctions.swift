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
            
            print("Previo a response fetchDonacion")
            print(response.data)
            let data = String(data: response.data!, encoding: .utf8)
            print(data)
            
            self.delegate?.updateArray(newArray: data!)
        }
    }
    
    func fetchDonators() {
        
        AF.request("https://caritas-app-backend.herokuapp.com/fetchusuario").response {response in
            
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
    
    func addItem(descripcion:String, uom: String, upc: String, peso_articulo_kg: String) {
        
        AF.request("https://caritas-app-backend.herokuapp.com/createarticulo", method: .post, encoding: URLEncoding.httpBody, headers: ["descripcion": descripcion, "uom":uom, "upc":upc, "peso_articulo_kg":peso_articulo_kg]).responseJSON {response in
            
        }
    }

}
