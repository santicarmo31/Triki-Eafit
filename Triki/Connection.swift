//
//  Connection.swift
//  Triki
//
//  Created by Santiago Carmona gonzalez on 2/27/16.
//  Copyright © 2016 Santiago Carmona's. All rights reserved.
//

import Foundation

class Connection{
    
    static let sharedInstance = Connection()
    // Constantes de conexion con el servidor.
    static let BASE_URL = "http://54.148.206.141"
    //static let BASE_URL = "http://192.168.1.13:3000"
    static let API_PATH="/api/v1/"
    
    static func Header(userKey:String) -> [String:String]{
        let headers = [
            "Authorization": "Token token=\(userKey)"
        ]
        return headers
    }
    
    static func URL(path: String) -> String {
        return "\(BASE_URL)\(API_PATH)\(path)"
    }
    
}