//
//  Donation.swift
//  CaritasApp
//
//  Created by Ernesto López on 13/10/21.
//

import Foundation
import Alamofire




struct Donation: Decodable {
    
    var _id: String
    var almacen_destino: String
    var estado_factura: Bool
    var fecha_creacion: String
    var fecha_recepcion: String
    var precio_total_reportado: Double
    var precio_total_recibido: Double
    var peso_total_reportado: Int
    var peso_total_recibido: Int
    var donador: Donador
    var recolector: Recolector
    var estado_recepcion_almacen: Bool
    var estado_recepcion_chofer: Bool
    var articulos_donados: [Articulo]
    
}

struct Donador: Decodable {
    var id: String
    var nombre: String
}

struct Recolector: Decodable {
    var id: String
    var nombre: String
}

struct Articulo: Decodable {
    
    var descripcion:String
    var upc:String
    var cantidad_donada: Int
    var cantidad_recibida: Int
    var cantidad_buen_estado: Int
    var precio_unitario: Double
    var precio_total_unidades: Double
    var numero_serie_externo:Int
    
}


/*
struct Donation: Decodable {
    
    var _id :String
    var estado_factura: Bool
    var fecha_creacion: Date
    var fecha_recepcion: Date
    var precio_total_reportado: Double?
    var precio_total_recibido: Double
    var peso_total_reportado: Double?
    var peso_total_recibido: Double
    var almacen_destino: String
    var donador: UserInDonation
    var recolector: UserInDonation?
    var estado_recepcion_almacen: Bool
    var estado_recepcion_chofer: Bool
    var articulos_donados: [ItemInDonation]?
    
}

struct UserInDonation: Decodable {
    var id: String
    var nombre: String
}

struct ItemInDonation: Decodable {
    var upc: String?
    var cantidad_donada: Int?
    var cantidad_recibida: Int?
    var cantidad_buen_estado: Int?
    var precio_unitario: Double?
    var precio_total_unidades: Double?
    var numero_serie_externo: String?
}
*/
