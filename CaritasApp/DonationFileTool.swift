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

    // Lee el archivo como un objeto con los atributos de donación
    public func readFileAsDonation(_ url: URL) throws -> Donation {
        print("The Url is : \(url)")
        var readDonation : Donation
        
        let data = try Data(contentsOf: url)
        let decoder = JSONDecoder()
        readDonation = try decoder.decode(Donation.self, from: data)
        return readDonation
    }
    
    // Permite leer el archivo como string
    public func readFileAsString(_ url: URL) throws -> String {
        print("The Url is : \(url)")
        var strData : String
        
        let data = try Data(contentsOf: url)
        strData = String(decoding: data, as: UTF8.self)
        print("String data=\(strData)")

        return strData
    }
    
    // Permite leer el archivo como formato JSON
    public func readFileAsJson(_ url: URL) throws -> Any? {
        print("The Url is : \(url)")
        let data = try Data(contentsOf: url)
        let json = try? JSONSerialization.jsonObject(with: data, options: [])
        print("Json data=\(String(describing: json))")
        
        return json
    }
}
