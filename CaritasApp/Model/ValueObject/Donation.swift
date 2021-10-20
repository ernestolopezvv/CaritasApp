//
//  Donation.swift
//  CaritasApp
//
//  Created by Ernesto López on 13/10/21.
//

import Foundation
import Alamofire

struct Donation: Codable {
    //var _id :String
    var almacen_destino: String?
    var estado_factura: String?
    var fecha_creacion: Date?
    var fecha_recepcion: Date?
    var precio_total_reportado: Double?
    var precio_total_recibido: Double?
    var peso_total_reportado: Double?
    var peso_total_recibido: Double?
    var donador: UserInDonation?
    var recolector: UserInDonation?
    var estado_recepcion_almacen: String?
    var estado_recepcion_chofer: String?
    var articulos_donados: [ItemInDonation]?
    
    init(fecha_creacion:Date,precio_total_reportado: Double, peso_total_reportado:Double, estado_factura:String, estado_recepcion_almacen: String, estado_recepcion_chofer: String, articulos_donados: [ItemInDonation], donador: UserInDonation, recolector: UserInDonation, almacen_destino: String, peso_total_recibido: Double, precio_total_recibido: Double, fecha_recepcion: Date){
        self.fecha_creacion = fecha_creacion
        self.precio_total_reportado = precio_total_reportado
        self.peso_total_reportado = peso_total_reportado
        self.estado_factura = estado_factura
        self.estado_recepcion_almacen = estado_recepcion_almacen
        self.estado_recepcion_chofer = estado_recepcion_chofer
        self.peso_total_recibido = peso_total_recibido
        self.precio_total_recibido = precio_total_recibido
        self.almacen_destino = almacen_destino
        self.articulos_donados = articulos_donados
        self.donador = donador
        self.recolector = recolector
        self.fecha_recepcion = fecha_recepcion
    }
}

struct UserInDonation: Codable {
    var id: String?
    var nombre: String?
}

struct ItemInDonation: Codable {
    var UPC: String?
    var cantidad_donada: Int?
    var cantidad_recibida: Int?
    var cantidad_buen_estado: Int?
    var precio_unitario: Double?
    var precio_total_unidades: Double?
    var numero_serie_externo: String?
}

/*
public class Articulo : Codable {
    public let UPC : String?
    public let cantidad_donada : Double?
    public let precio_unitario : Double?
    public let precio_total_unidades : Double?
    public let numero_serie_externo : String?
    
    public init(UPC: String, cantidad_donada : Double, precio_unitario: Double, precio_total_unidades : Double, numero_serie_externo : String) {
    self.UPC = UPC
    self.cantidad_donada = cantidad_donada
    self.precio_unitario = precio_unitario
    self.precio_total_unidades = precio_total_unidades
    self.numero_serie_externo = numero_serie_externo
    }
}

public class DatosDonador : Codable {
    public let idUsuario : String
    public let nombreDonador : String
    
    public init(idUsuario: String, nombreDonador : String) {
    self.idUsuario = idUsuario
    self.nombreDonador = nombreDonador
    
    }
}

struct Donador: Codable {
    let fecha_creacion : String
    let precio_total_reportado : String
    let peso_total_reportado : String
    //public let donador : DatosDonador?
    //public let articulos : [Articulo]?
        
    /*public init(fecha_creacion: String, precio_total_reportado: String, peso_total_reportado: String /*donador: DatosDonador, articulos: [Articulo]*/)  {
        self.fecha_creacion = fecha_creacion
        self.precio_total_reportado = precio_total_reportado
        self.peso_total_reportado = peso_total_reportado
        //self.donador = DatosDonador
        //self.articulos = [Articulos]
     */
 */

    

