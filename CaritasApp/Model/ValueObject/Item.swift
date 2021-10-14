//
//Item.swift
//  CaritasApp
//
//  Created by Enrique Ruiz on 26/09/21.
//

import Foundation

struct Item: Decodable {
    var upc: String
    var uom: String?
    var descripcion: String
    var peso_articulo: String?
}
