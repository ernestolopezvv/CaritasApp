//
//  CaritasAppIntegrationTests.swift
//  CaritasAppTests
//
//  Created by Ernesto López on 13/10/21.
//

import Foundation
import XCTest

@testable import CaritasApp

class CaritasAppIntegrationTest: XCTestCase {
    
    func testDecodeUser() throws {
        // Given
        /* "fecha_creacion":"2021-10-10T07:00:00.000Z"
         "fecha_recepcion":"2021-10-11T06:00:00.000Z"
         "precio_total_reportado":90.99 */
        
        let json = """
            {
                "_id":"6163d2c2c2c86e7e3434779a",
                "apellidos":"Rogers",
                "contrasena":"capitanamerica",
                "correo": "capitan@gmail.com",
                "entidad": "Caritas",
                "nombres": "Steve",
                "rfc": "MELM8305281H0",
                "rol":"Administrador",
            }
        """.data(using: .utf8)!
        do {
            // When
            let decoder = JSONDecoder()
            /*
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
            decoder.dateDecodingStrategy = .formatted(dateFormatter)
             */
            let user = try decoder.decode(User.self, from: json)
            
            // Then
            XCTAssertEqual(user._id, "6163d2c2c2c86e7e3434779a")
            XCTAssertEqual(user.apellidos, "Rogers")
            XCTAssertEqual(user.contrasena, "capitanamerica")
            XCTAssertEqual(user.correo, "capitan@gmail.com")
            XCTAssertEqual(user.entidad, "Caritas")
            XCTAssertEqual(user.nombres, "Steve")
            XCTAssertEqual(user.rfc, "MELM8305281H0")
            XCTAssertEqual(user.rol, "Administrador")
        } catch {
            XCTFail("error info: \(error)")
        }
    }
    
    func testDecodeDonation() throws {
            // Given
        let json: String = """
                [
                   {
                      "_id":"616497b2c2c86e7e343477dd",
                      "estado_factura":false,
                      "fecha_creacion":"2021-10-10T07:00:00.000Z",
                      "fecha_recepcion":"2021-10-11T06:00:00.000Z",
                      "precio_total_reportado":90.99,
                      "precio_total_recibido":90.99,
                      "peso_total_reportado":2.5,
                      "peso_total_recibido":2.5,
                      "almacen_destino":"1",
                      "estado_recepcion_almacen":false,
                      "estado_recepcion_chofer":false,
                   }
                ]
            """//.data(using: .utf8)!
            let decoder = JSONDecoder()
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
            decoder.dateDecodingStrategy = .formatted(dateFormatter)
            let donations = try decoder.decode([Donation].self, from: json.data(using: .utf8)!)
            
            XCTAssertEqual(donations[0]._id, "616497b2c2c86e7e343477dd")
            XCTAssertEqual(donations[0].estado_factura, false)
            XCTAssertEqual(donations[0].peso_total_recibido, 2.5)
        }
}
