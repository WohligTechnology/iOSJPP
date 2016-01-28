//
//  RestApi.swift
//  JPP
//
//  Created by Chintan Shah on 27/01/16.
//  Copyright © 2016 Wohlig Technology. All rights reserved.
//

//import Foundation
//import SwiftHTTP
//import SwiftyJSON
//
//public class RestApi {
//    
//    public func callAPI( completion: ( (JSON) -> Void) )  {
//        var json = JSON(1);
//        do {
//            let opt = try HTTP.GET("http://wohlig.co.in/cccbackend/index.php/json/getCategory")
//            opt.start { response in
//                if let err = response.error {
//                    print("error: \(err.localizedDescription)")
//                    return //also notify app of failure as needed
//                }
//                json  = JSON(data: response.data)
//                completion(json);
//                
//                
//            }
//        } catch let error {
//            print("got an error creating the request: \(error)")
//        }
//    }
//    
//}