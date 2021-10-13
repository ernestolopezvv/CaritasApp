//
//  Donacion.swift
//  CaritasApp
//
//  Created by Enrique Ruiz on 26/09/21.
//

import Foundation

struct Donation: Decodable {
    
    var _id :String
    var estado_factura: Bool
    var fecha_creacion: Date
    var fecha_recepcion: Date
    var precio_total_reportado: Double
    var precio_total_recibido: Double?
    var peso_total_reportado: Double
    var peso_total_recibido: Double?
    var almacen_destino: String
    var donador: UserInDonation
    var recolector: UserInDonation
    var estado_recepcion_almacen: Bool
    var estado_recepcion_chofer: Bool
    //var articulos_donados: [ItemInDonation]?
    
}
