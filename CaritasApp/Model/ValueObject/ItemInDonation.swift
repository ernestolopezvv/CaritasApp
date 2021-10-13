//
//  ItemInDonation.swift
//  CaritasApp
//
//  Created by Enrique Ruiz on 13/10/21.
//

import Foundation

struct ItemInDonation: Decodable {
    var upc: String
    var cantidad_donada: Double
    var cantidad_recibida: Int?
    var cantidad_buen_estado: Int?
    var precio_unitario: Double
    var precio_total_unidades: Double?
    var numero_serie_externo: String?
}
