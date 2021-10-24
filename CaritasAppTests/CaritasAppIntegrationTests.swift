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
            XCTAssertEqual(user.correo, "capitan@gmail.com")
            XCTAssertEqual(user.entidad, "Caritas")
            XCTAssertEqual(user.nombres, "Steve")
            XCTAssertEqual(user.rfc, "MELM8305281H0")
            XCTAssertEqual(user.rol, "Administrador")
        } catch {
            XCTFail("error info: \(error)")
        }
    }
    
    func testDecodeDonador() throws {
                // Given
            let json: String = """
                [
                   {
                      "precio_total_reportado":40.5,
                      "peso_total_reportado":44.2,
                      "donador":{
                          "id":"616d006345d547c02f759ebe",
                          "nombre":"John",
                          "apellido":"a"
                      },
                      "recolector":{
                          "id": "6164926fc2c86e7e343477cb",
                          "nombre": "Stephen",
                          "apellido": "Strange"
                      },
                      "articulos_donados": [
                          {
                              "_id": "616726cb608388b21951ee35",
                              "UPC": "123456",
                              "cantidad_donada": 1,
                              "cantidad_recibida": 1,
                              "cantidad_buen_estado": 1,
                              "precio_unitario": 40.5,
                              "precio_total_unidades": 2.5,
                              "peso_total_unidades": 3.4,
                              "numero_serie_externo": "827292"
                          },
                          {
                              "_id": "616726cb608388b21951ee36",
                              "UPC": "131415",
                              "cantidad_donada": 3,
                              "cantidad_recibida": 2,
                              "cantidad_buen_estado": 2,
                              "precio_unitario": 70,
                              "precio_total_unidades": 140,
                              "peso_total_unidades": 0.37,
                              "numero_serie_externo": "464841"
                          }
                      ]
                   }
                ]
                """//.data(using: .utf8)!
            do {
                // When
                let decoder = JSONDecoder()
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
                decoder.dateDecodingStrategy = .formatted(dateFormatter)
            
                let donations = try decoder.decode([Donation].self, from: json.data(using: .utf8)!)
                
                XCTAssertEqual(donations[0].precio_total_reportado, 40.5)
                XCTAssertEqual(donations[0].peso_total_reportado, 44.2)
                
                XCTAssertEqual(donations[0].articulos_donados![0].UPC, "123456")
                XCTAssertEqual(donations[0].articulos_donados![0].precio_unitario, 40.5)
                
            } catch {
                XCTFail("error info: \(error)")
            }
        }
    

    

}
