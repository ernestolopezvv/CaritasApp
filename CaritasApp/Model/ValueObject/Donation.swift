//
//  Donation.swift
//  CaritasApp
//
//  Created by Ernesto López on 13/10/21.
//

import Foundation
import Alamofire

struct Donation: Decodable {
    
    var _id :String
    var almacen_destino: String
    var estado_factura: Bool
    var fecha_creacion: Date
    var fecha_recepcion: Date
    var precio_total_reportado: Double?
    var precio_total_recibido: Double
    var peso_total_reportado: Double?
    var peso_total_recibido: Double
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



public class Donador: Codable {
    public let fecha_creacion : String
    public let precio_total_reportado : Double?
    public let peso_total_reportado : Double?
    public let idUsuario : String?
    public let nombreDonador : String?
    public let UPC : String?
    public let cantidad_donada : Double?
    public let precio_unitario : Double?
    public let precio_total_unidades : Double?
    public let numero_serie_externo : String?
     


    
    public init(fecha_creacion: String, precio_total_reportado: Double, peso_total_reportado: Double, idUsuario: String, nombreDonador : String, UPC: String, cantidad_donada : Double, precio_unitario: Double, precio_total_unidades : Double, numero_serie_externo : String) {
        self.fecha_creacion = fecha_creacion
        self.precio_total_reportado = precio_total_reportado
        self.peso_total_reportado = peso_total_reportado
        self.idUsuario = idUsuario
        self.nombreDonador = nombreDonador
        self.UPC = UPC
        self.cantidad_donada = cantidad_donada
        self.precio_unitario = precio_unitario
        self.precio_total_unidades = precio_total_unidades
        self.numero_serie_externo = numero_serie_externo
    }
    
}
