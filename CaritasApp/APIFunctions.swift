//
//  APIFunctions.swift
//  CaritasApp
//
//  Created by Enrique Ruiz on 08/10/21.
//

import Foundation
import Alamofire

struct Donation: Decodable {
    
    var _id :String?
    var estado_factura: String?
    var fecha_creacion: String?
    var fecha_recepcion: String?
    var precio_total_reportado: String?
    var precio_total_recibido: String?
    var peso_total_reportado: String?
    var peso_total_recibido: String?
    var almacen_destino: String?
    //var donador: UserInDonation?
    //var recolector: UserInDonation?
    var estado_recepcion_almacen: String?
    var estado_recepcion_chofer: String?
    //var articulos_donados: [ItemInDonation]?
    
}

struct User: Decodable {
    var _id: String
    var apellidos: String
    var contrasena: String
    var correo: String
    var entidad: String
    var nombres: String
    var rfc: String?
    var rol: String?
}

struct UserInDonation: Decodable {
    var _id: String?
    var nombre: String?
}

struct ItemInDonation: Decodable {
    var upc: String?
    var cantidad_donada: String?
    var cantidad_recibida: String?
    var cantidad_buen_estado: String?
    var precio_unitario: String?
    var precio_total_unidades: String?
    var numero_serie_externo: String?
}

struct Item: Decodable {
    var descripcion: String?
    var peso_articulo: String?
    var uom: String?
    var upc: String?
}

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

}
