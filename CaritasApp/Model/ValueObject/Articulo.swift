//
//  Articulo.swift
//  CaritasApp
//
//  Created by Enrique Ruiz on 26/09/21.
//

import Foundation

public class Articulo: Codable {
    public let ID_Articulo: Int
    public let UPC: String
    public let UOM: String
    public var Descripcion: String
    public var Foto: String
    public let Peso_Articulo: Float16
    
   
    public init(ID_Articulo: Int, UPC: String, UOM: String, Descripcion: String, Foto: String, Peso_Articulo: Float16) {
        self.ID_Articulo = ID_Articulo
        self.UPC = UPC
        self.UOM = UOM
        self.Descripcion = Descripcion
        self.Foto = Foto
        self.Peso_Articulo = Peso_Articulo
    }
}
