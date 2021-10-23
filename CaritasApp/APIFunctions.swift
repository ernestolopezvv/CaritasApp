//
//  APIFunctions.swift
//  CaritasApp
//
//  Created by Enrique Ruiz on 08/10/21.
//

import Foundation
import Alamofire

//Protocolo utilizado en las extensiones de los archivos
protocol DataDelegate {
    func updateArray(newArray: String)
}

//Clase que contiene todas las funciones donde se realizan métodos que tienen que ver con la base de datos
class APIFunctions {
    
    var delegate: DataDelegate?
    static let functions = APIFunctions()
    
    //Se solicitan las donaciones
    func fetchDonations() {
        
        AF.request("https://caritas-app-backend.herokuapp.com/fetchdonacion").response {response in
            
            print("Response fetchDonacion")
            let data = String(data: response.data!, encoding: .utf8)
            print(data)
            self.delegate?.updateArray(newArray: data!)
        }
    }
    
    //Se solicitan los donadores
    func fetchDonators() {
        
        AF.request("https://caritas-app-backend.herokuapp.com/fetchusuario").response {response in
            
            print("Response fetchDonador")
            let data = String(data: response.data!, encoding: .utf8)
            print(data)
            self.delegate?.updateArray(newArray: data!)
        }
    }
    
    //Se solicitan los artículos
    func fetchItems() {
        
        AF.request("https://caritas-app-backend.herokuapp.com/fetcharticulo").response {response in
            
            print("Previo a response fetchDonador")
            print(response.data)
            let data = String(data: response.data!, encoding: .utf8)
            
            self.delegate?.updateArray(newArray: data!)
        }
    }
    
    //Se actualiza la información de los artículos
    func updateItem(descripcion:String, uom: String, upc: String, peso_articulo: String) {
        
        AF.request("https://caritas-app-backend.herokuapp.com/updatearticulo", method: .post, encoding: URLEncoding.httpBody, headers: ["descripcion": descripcion, "uom":uom, "upc":upc, "peso articulo kg":peso_articulo]).responseJSON {response in
            
        }
    }
    
    //Se crea una donación
    func createDonacion(donation: Donation) {
         
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
    
    //Se actualiza la información de la donación dada
    func receiveDonation(donation: Donation) {
            
            let url = URL(string: "https://caritas-app-backend.herokuapp.com/updatedonation")
            var request = URLRequest(url: url!)
            request.httpMethod = HTTPMethod.put.rawValue
            request.setValue("application/json; charset=UTF-8", forHTTPHeaderField: "Content-Type")
            let encoder = JSONEncoder()
            let jsonData = try! encoder.encode(donation)
            request.httpBody = jsonData
            AF.request(request).responseJSON {response in
                print("hola")
                print(response.data)
            }
        }
    
    //Se añade un nuevo artículo
    func addItem(descripcion:String, uom: String, upc: String, peso_articulo_kg: String) {
        
        AF.request("https://caritas-app-backend.herokuapp.com/createarticulo", method: .post, encoding: URLEncoding.httpBody, headers: ["descripcion": descripcion, "uom":uom, "upc":upc, "peso_articulo_kg":peso_articulo_kg]).responseJSON {response in
            
        }
    }
    
    //Asignar almaen 
    func asignarAlmacen(donation: Donation) {
            
            let url = URL(string: "https://caritas-app-backend.herokuapp.com/updatealmacen")
            var request = URLRequest(url: url!)
            request.httpMethod = HTTPMethod.put.rawValue
            request.setValue("application/json; charset=UTF-8", forHTTPHeaderField: "Content-Type")
            let encoder = JSONEncoder()
            let jsonData = try! encoder.encode(donation)
            request.httpBody = jsonData
            AF.request(request).responseJSON {response in
                print(response.data)
            }
        }
}
