//
//Item.swift
//  CaritasApp
//
//  Created by Enrique Ruiz on 26/09/21.
//

import Foundation

struct Item: Decodable {
    var descripcion: String
    var uom: String?
    var upc: String
    var peso_articulo_kg: String?
}
