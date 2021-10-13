//
//  Donacion.swift
//  CaritasApp
//
//  Created by Enrique Ruiz on 26/09/21.
//

import Foundation

public class Donacion: Codable {
    public let ID_Donacion: Float16
    public var Estado_Recepcion_Chofer: Bool
    public var Estado_Recepcion_Almacen: Bool
    public var Estado_Factura: Bool
    public let Fecha_Creacion: Date
    public var Fecha_Facturacion: Date
    public var Precio_Reportado: Float16
    public var Precio_Recibido: Float16
    public var Peso_Reportado: Float16
    public var Peso_Recibido: Float16
    public let ID_Almacen_Destino: Int
    public let ID_Donador: Int
    public let ID_Recolector:Int
   
    public init(ID_Donacion: Float16, Estado_Recepcion_Chofer: Bool, Estado_Recepcion_Almacen: Bool,
                Estado_Factura: Bool, Fecha_Creacion: Date, Fecha_Facturacion: Date,
                Precio_Reportado: Float16, Precio_Recibido: Float16, Peso_Reportado: Float16,
                Peso_Recibido: Float16, ID_Almacen_Destino: Int, ID_Donador: Int, ID_Recolector:Int) {
        
        self.ID_Donacion = ID_Donacion
        self.Estado_Recepcion_Chofer = Estado_Recepcion_Chofer
        self.Estado_Recepcion_Almacen = Estado_Recepcion_Almacen
        self.Estado_Factura = Estado_Factura
        self.Fecha_Creacion = Fecha_Creacion
        self.Fecha_Facturacion = Fecha_Facturacion
        self.Precio_Reportado = Precio_Reportado
        self.Precio_Recibido = Precio_Recibido
        self.Peso_Reportado = Peso_Reportado
        self.Peso_Recibido = Peso_Recibido
        self.ID_Almacen_Destino = ID_Almacen_Destino
        self.ID_Donador = ID_Donador
        self.ID_Recolector = ID_Recolector
    }
}
