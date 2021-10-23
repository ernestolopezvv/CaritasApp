//
//  User.swift
//  CaritasApp
//
//  Created by Enrique Ruiz on 11/10/21.
//

import Foundation

struct User: Decodable {
    var _id: String
    var apellidos: String
    var correo: String
    var entidad: String
    var nombres: String
    var rfc: String?
    var rol: String?
}
