//
//  Data.swift
//  DrawingFun
//
//  Created by Tee Becker on 11/13/20.
//

import SwiftUI

struct geo: Codable{
    var lat: String
    var lng: String
}

struct address:Codable{
    let street: String
    let suite: String
    let city: String
    let zipcode: String
    let geo: geo
}

struct Profile: Codable, Identifiable{
    var id: Int
    let name: String
    let email: String
    let address: address
}


class Api {
 
    func getProfile(completion: @escaping([Profile]) -> ()) {
        
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/users") else{fatalError()}
        
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            let users = try! JSONDecoder().decode([Profile].self, from: data!)
            
            DispatchQueue.main.async {
                completion(users)
            }
        }
        .resume()
    }
    
}
