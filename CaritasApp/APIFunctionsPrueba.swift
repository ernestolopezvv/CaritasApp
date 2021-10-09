//
//  APIFunctionsPrueba.swift
//  CaritasApp
//
//  Created by Enrique Ruiz on 08/10/21.
//

import Foundation
import Alamofire

struct Donation: Decodable {
    
    var _id: String
    var receptionState: String
    var billState: String
    var creationDate: String
    var receptionDate: String
    var weightKg: String
    var destination: String
    
}

class APIFunctionsPrueba {
    
    var delegate: DataDelegate?
    static let functions = APIFunctionsPrueba()
    
    func fetchDonations() {
        
        AF.request("https://caritas-app-backend.herokuapp.com/fetchdonation").response {response in
            
            print(response.data)
            let data = String(data: response.data!, encoding: .utf8)
            
            self.delegate?.updateArray(newArray: data!)
        }
    }

}
