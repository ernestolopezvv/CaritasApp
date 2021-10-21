//
//  DonationFileTool.swift
//  CaritasApp
//
//  Created by Ernesto López on 14/10/21.
//

import Foundation

class DonationFileTool{
    enum Error: Swift.Error {
        case fileAlreadyExists
        case invalidDirectory
        case writtingFailed
    }

    let fileManager: FileManager
    
    init(fileManager: FileManager = .default) {
            self.fileManager = fileManager
    }

    public func readFileAsDonation(_ url: URL) throws -> Donation {
        print("The Url is : \(url)")
        var readDonation : Donation
        
        let data = try Data(contentsOf: url)
        let decoder = JSONDecoder()
        readDonation = try decoder.decode(Donation.self, from: data)
        //print("Donacion: =  fecha_creacion:\(readDonation.fecha_creacion) fecha_creacion:\(readDonation.fecha_creacion)")
        print("Donacion: =  peso_total_reportado:\(readDonation.peso_total_reportado) peso_total_reportado:\(readDonation.peso_total_reportado)")
        print("Donacion: =  precio_total_reportado:\(readDonation.precio_total_reportado) precio_total_reportado:\(readDonation.precio_total_reportado)")
        //print("Donacion: =  articulos_donados:\(readDonation.articulos_donados) articulos_donados:\(readDonation.articulos_donados)")
        return readDonation
    }
    
    public func readFileAsString(_ url: URL) throws -> String {
        print("The Url is : \(url)")
        var strData : String
        
        let data = try Data(contentsOf: url)
        strData = String(decoding: data, as: UTF8.self)
        print("String data=\(strData)")

        return strData
    }
    
    public func readFileAsJson(_ url: URL) throws -> Any? {
        print("The Url is : \(url)")
        let data = try Data(contentsOf: url)
        let json = try? JSONSerialization.jsonObject(with: data, options: [])
        print("Json data=\(String(describing: json))")
        
        return json
    }
}