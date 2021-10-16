//
//Item.swift
//  CaritasApp
//
//  Created by Enrique Ruiz on 26/09/21.
//

import Foundation


struct Item: Decodable {
    
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
struct Item: Decodable {
    var upc: String
    var uom: String?
    var descripcion: String
    var peso_articulo: String?
}
*/
