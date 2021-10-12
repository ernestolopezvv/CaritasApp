//
//  APIFunctions.swift
//  CaritasApp
//
//  Created by Enrique Ruiz on 08/10/21.
//

import Foundation
import Alamofire

struct Donation: Decodable {
    /*
    var _id: String
    var receptionState: String
    var billState: String
    var creationDate: String
    var receptionDate: String
    var weightKg: String
    var destination: String
    
    var estado_factura: Bool
    var fecha_creacion: Date
    var fecha_recepcion: Date
    var precio_total_reportado: Double
    var precio_total_recibido: Double
    var peso_total_reportado: Double
    var peso_total_recibido: Double
    var almacen_destino: Int
    var estado_recepcion_chofer: Bool
    var estado_recepcion_almacen: Bool
     */
    
    var _id :String
    var estado_factura: String
    var fecha_creacion: String
    var fecha_recepcion: String
    var precio_total_reportado: String
    var precio_total_recibido: String
    var peso_total_reportado: String
    var peso_total_recibido: String
    var almacen_destino: String
    var estado_recepcion_chofer: String
    var estado_recepcion_almacen: String
    /*
    var donador: Object{
        var id: String
        var nombre: String }
    var recolector {
        var id: String
        var nombre: String
    }
    var articulos_donados
     */
    
}

struct User: Decodable {
    var _id: String
    var apellidos: String
    var nombres: String
    var contrasena: String
    var correo: String
    var rfc: String
    var rol: String
}

class APIFunctions {
    
    var donationDelegate: DataDelegate?
    var userDelegate: DataDelegate?
    static let functions = APIFunctions()
    
    func fetchDonations() {
        
        AF.request("https://caritas-app-backend.herokuapp.com/fetchdonacion").response {response in
            
            print(response.data)
            let data = String(data: response.data!, encoding: .utf8)
            
            self.donationDelegate?.updateArray(newArray: data!)
        }
    }
    
    func fetchUsers() {
        
        AF.request("https://caritas-app-backend.herokuapp.com/fetchusuario").response {response in
            
            print(response.data)
            let data = String(data: response.data!, encoding: .utf8)
            
            self.userDelegate?.updateArray(newArray: data!)
        }
    }

}
