//
//  Donation.swift
//  CaritasApp
//
//  Created by Ernesto López on 13/10/21.
//

import Foundation
import Alamofire

struct Donation: Decodable {
    
    var _id :String?
    var estado_factura: Bool?
    var fecha_creacion: Date?
    var fecha_recepcion: Date?
    var precio_total_reportado: Double?
    var precio_total_recibido: Double?
    var peso_total_reportado: Double?
    var peso_total_recibido: Double?
    var almacen_destino: String?
    var donador: UserInDonation?
    var recolector: UserInDonation?
    var estado_recepcion_almacen: Bool?
    var estado_recepcion_chofer: Bool?
    //var articulos_donados: [ItemInDonation]?
    
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
