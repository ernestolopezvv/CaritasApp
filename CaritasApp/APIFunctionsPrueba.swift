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
    
    func fectchDonations() {
        
        AF.request("https://caritas-app-backend.herokuapp.com/fetchdonation").response {response in
            
            print(response.data)
            let data = String(data: response.data!, encoding: .utf8)
            
            self.delegate?.updateArray(newArray: data!)
        }
    }
    
    func addDonation(receptionState: String, billState: String, creationDate:String, receptionDate: String, weightKg: String, destination:String) {
        
        AF.request("https://caritas-app-backend.herokuapp.com/createdonation", method: .post, encoding: URLEncoding.httpBody, headers: ["receptionState": receptionState, "billState":billState, "creationDate":creationDate, "receptionDate":receptionDate, "weightKg":weightKg, "destination": destination]).responseJSON {response in
            
            
        }
    }
    
    func updateDonation(receptionState: String, billState: String, creationDate:String, receptionDate: String, weightKg: String, destination:String, id:String) {
        
        AF.request("https://caritas-app-backend.herokuapp.com/updatedonation", method: .post, encoding: URLEncoding.httpBody, headers: ["receptionState": receptionState, "billState":billState, "creationDate":creationDate, "receptionDate":receptionDate, "weightKg":weightKg, "destination": destination, "id":id]).responseJSON {response in
            
        }
    }
    
    func deleteDonation(id: String){
        
        AF.request("https://caritas-app-backend.herokuapp.com/deletedonation", method: .post, encoding: URLEncoding.httpBody, headers: ["id": id]).responseJSON {response in
            print(response)
        }

    }
}
