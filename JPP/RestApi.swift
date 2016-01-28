//
//  RestApi.swift
//  JPP
//
//  Created by Chintan Shah on 27/01/16.
//  Copyright © 2016 Wohlig Technology. All rights reserved.
//

import Foundation
import SwiftHTTP
import SwiftyJSON

let adminUrl = "http://192.168.0.124/jppbackend/";
let imageURL = adminUrl + "uploads/";
let apiURL = adminUrl + "index.php/json/";

public class RestApi {
    
    
    public func getImage(urlStr:String) -> UIImage {
        let url = NSURL(string: "http://192.168.0.124/jppbackend/uploads/" + urlStr)
        let data = NSData(contentsOfURL: url!) //make sure your image in this url does exist, otherwise unwrap in a if let check
        return UIImage(data: data!)!
    }
    
    public func getGallery( completion: ( (JSON) -> Void) )  {
        var json = JSON(1);
        do {
            let opt = try HTTP.GET(apiURL + "getallgallery")
            opt.start { response in
                if let err = response.error {
                    print("error: \(err.localizedDescription)")
                    return //also notify app of failure as needed
                }
                json  = JSON(data: response.data)
                completion(json);
            }
        } catch let error {
            print("got an error creating the request: \(error)")
        }
    }
    
    public func getNews( completion: ( (JSON) -> Void) )  {
        var json = JSON(1);
        do {
            let opt = try HTTP.GET(apiURL + "getallnews")
            opt.start { response in
                if let err = response.error {
                    print("error: \(err.localizedDescription)")
                    return //also notify app of failure as needed
                }
                json  = JSON(data: response.data)
                completion(json);
            }
        } catch let error {
            print("got an error creating the request: \(error)")
        }
    }
    
    public func getPointTable( completion: ( (JSON) -> Void) )  {
        var json = JSON(1);
        do {
            let opt = try HTTP.GET(apiURL + "getallpoint")
            opt.start { response in
                if let err = response.error {
                    print("error: \(err.localizedDescription)")
                    return //also notify app of failure as needed
                }
                json  = JSON(data: response.data)
                completion(json);
            }
        } catch let error {
            print("got an error creating the request: \(error)")
        }
    }
    
    public func getSchedule( completion: ( (JSON) -> Void) )  {
        var json = JSON(1);
        do {
            let opt = try HTTP.GET(apiURL + "getSchedule")
            opt.start { response in
                if let err = response.error {
                    print("error: \(err.localizedDescription)")
                    return //also notify app of failure as needed
                }
                json  = JSON(data: response.data)
                completion(json);
            }
        } catch let error {
            print("got an error creating the request: \(error)")
        }
    }
    
}