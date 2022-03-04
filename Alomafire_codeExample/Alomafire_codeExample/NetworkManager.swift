//
//  NetworkManager.swift
//  Alomafire_codeExample
//
//  Created by Eslam Ali  on 03/03/2022.
//

import Foundation
import Alamofire
class NetworkManager {
    
    static let shared  =  NetworkManager()
    func fetchDeta(completion :  @escaping (([User]) -> Void))  {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/users") else {
            return
        }
        AF.request(url).validate()
            .responseDecodable(of : [User].self) { response in
                guard let response = response.value else {
                    print ("something went wrong ")
                    return
                }
                print(response)
                completion(response)
    }
   
    
   
        
       
      
    }
}

