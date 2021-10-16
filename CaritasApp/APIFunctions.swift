//
//  APIFunctions.swift
//  CaritasApp
//
//  Created by Enrique Ruiz on 08/10/21.
//

import Foundation
import Alamofire


protocol DataDelegate{
    func updateArray(newArray: String)
    
}

class APIFunctions {
    
    var delegate: DataDelegate?
    static let functions = APIFunctions()
    
    func fetchDonations() {
        
        AF.request("http://localhost:3000/donaciones/fetch").response {response in
            
            print("Response fetchDonacion")
            let data = String(data: response.data!, encoding: .utf8)
            print(data)
            self.delegate?.updateArray(newArray: data!)
        }
    }
    
    func fetchDonators() {
        
        AF.request("https://caritas-app-backend.herokuapp.com/fetchusuario").response {response in
            
            print("Response fetchDonador")
            let data = String(data: response.data!, encoding: .utf8)
            print(data)
            self.delegate?.updateArray(newArray: data!)
        }
    }

}
