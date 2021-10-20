import Foundation
import Alamofire

struct Donation: Codable {
    
    var _id :String?
    var estado_factura: Bool?
    var fecha_creacion: Date?
    var fecha_recepcion: Date?
    var precio_total_reportado: Double?
    var precio_total_recibido: Double?
    var peso_total_reportado: Double?
    var peso_total_recibido: Double?
    var almacen_destino: String?
    var donador: UserInDonation?
    var recolector: UserInDonation?
    var estado_recepcion_almacen: Bool?
    var estado_recepcion_chofer: Bool?
    var articulos_donados: [ItemInDonation]?
    
    init(fecha_creacion:Date,precio_total_reportado: Double, peso_total_reportado:Double, estado_factura:Bool, estado_recepcion_almacen: Bool, estado_recepcion_chofer: Bool, articulos_donados: [ItemInDonation], donador: UserInDonation, recolector: UserInDonation, almacen_destino: String, peso_total_recibido: Double, precio_total_recibido: Double, fecha_recepcion: Date, _id: String){
        self.fecha_creacion = fecha_creacion
        self.precio_total_reportado = precio_total_reportado
        self.peso_total_reportado = peso_total_reportado
        self.estado_factura = estado_factura
        self.estado_recepcion_almacen = estado_recepcion_almacen
        self.estado_recepcion_chofer = estado_recepcion_chofer
        self.peso_total_recibido = peso_total_recibido
        self.precio_total_recibido = precio_total_recibido
        self.almacen_destino = almacen_destino
        self.articulos_donados = articulos_donados
        self.donador = donador
        self.recolector = recolector
        self.fecha_recepcion = fecha_recepcion
        self._id = _id
    }
    
}

struct UserInDonation: Codable {
    var id: String
    var nombre: String
}

struct ItemInDonation: Codable {
    var UPC: String?
    var cantidad_donada: Int?
    var cantidad_recibida: Int?
    var cantidad_buen_estado: Int?
    var precio_unitario: Double?
    var precio_total_unidades: Double?
    var numero_serie_externo: String?
}

struct MiVariable {
    static var fechaseleccionada = ""
}
