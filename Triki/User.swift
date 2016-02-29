//
//  User.swift
//  Triki
//
//  Created by Santiago Carmona gonzalez on 2/27/16.
//  Copyright © 2016 Santiago Carmona's. All rights reserved.
//

import UIKit
import SwiftyJSON
import Alamofire

class User{
    var username:String!
    var password:String!

    init (username:String!, password:String!) {
        self.username = username
        self.password = password
    }
    
    
    static func createUser(email:String,phone:String,password:String,name:String, callback:(status:Bool,errors:JSON) -> Void){
        func completion(request: NSURLRequest?, response:NSHTTPURLResponse? , result:Result<AnyObject>){
            if let rdata = result.value {
                let data = JSON(rdata)
                //                print(data)
                callback(status: true,errors: data)
            } else {
                callback(status: false, errors:nil)
            }
        }
        let parm = ["user":["email":email,
            "phone":phone,
            "password":password,
            "name":name]]
        Alamofire.request(
            .POST,
            Connection.URL("user"),
            parameters: parm,
            encoding: .JSON).responseJSON(completionHandler: completion)
    }
    
    static func login(key:String, password:String, callback:(status:Bool,errors:JSON) -> Void){
        //Completion: funcion callback del .responseJSON que se encarga de verificar si se tiene conexion con el servidor
        func completion(request: NSURLRequest?, response:NSHTTPURLResponse? , result:Result<AnyObject>){
            if let rdata = result.value {
                let data = JSON(rdata)
                if data["success"].boolValue == true {
//                    let user = User(email: data["user"]["email"].stringValue, phone: data["user"]["phone"].intValue)

                }
                //print(data)
                callback(status: true,errors:data)
            } else {
                callback(status: false,errors:nil)
            }
        }
        let header = ["Application-Type":"tasking"]
        let parameters = ["user":["key":key,
            "password":password]]
        Alamofire.request(
            .POST,
            Connection.URL("user/signin"),
            parameters: parameters,
            headers: header,
            encoding: .JSON).responseJSON(completionHandler: completion)
    }


}
