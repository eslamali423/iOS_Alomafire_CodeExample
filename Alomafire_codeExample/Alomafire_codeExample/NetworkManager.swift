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

      func fetchFilms() {
        guard let url =  URL(string: "https://swapi.dev/api/films") else  {return}
        // 1
        AF.request(url).validate()
        .responseDecodable(of : Films.self) { response in
            
            guard let response =  response.value else {
                print ("something went wrong")
                return
            }
            print(response.results[0].title)
        }
        
        
       
      }
    }

