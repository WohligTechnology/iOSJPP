//
//  RestApi.swift
//  JPP
//
//  Created by Chintan Shah on 27/01/16.
//  Copyright © 2016 Wohlig Technology. All rights reserved.
//

import Foundation
import SwiftHTTP

//let adminUrl = "http://192.168.1.103/jppbackend/";
let adminUrl = "http://admin.jaipurpinkpanthers.com/"
//let adminUrl = "http://wohlig.co.in/pinkpanther/jppbackend/"
let imageURL = adminUrl + "uploads/";
let apiURL = adminUrl + "index.php/json/";

open class RestApi {
    
    open func getYoutubeImage(_ videoID:String) -> String {
        return "http://img.youtube.com/vi/" + videoID + "/hqdefault.jpg"
    }
    
    open func getVideo( _ completion: @escaping ( (JSON) -> Void) )  {
        var json = JSON(1);
     HTTP.GET(apiURL + "getAllVideoGallery")
             { response in
                if let _ = response.error {
                    completion(json);
                }
                else
                {
                    json  = JSON(data: response.data)
                    completion(json);
                }
            }
       
    }
    
    open func getImage(_ urlStr:String) -> UIImage {
        let url = URL(string: imageURL + urlStr)
        let data = try? Data(contentsOf: url!) //make sure your image in this url does exist, otherwise unwrap in a if let check
        return UIImage(data: data!)!
    }
    
    open func getImageCache(_ urlStr:String) -> URL {
        let url = URL(string: adminUrl + "index.php/image/index?name=" + urlStr + "&width=400")
        return url!
    }
    
    open func getImageThumbCache(_ urlStr:String) -> URL {
        let url = URL(string: adminUrl + "index.php/image/index?name=" + urlStr + "&width=250")
        return url!
    }
    
    open func getImageSizeCache(_ urlStr:String) -> URL {
        let url = URL(string: adminUrl + "index.php/image/index?name=" + urlStr + "&width=600")
        return url!
    }

    
    open func getImageExternalCacheURL(_ urlStr:String) -> URL {
        let url = URL(string:urlStr)
        return url!
    }
    
    open func getImageExternalURL(_ urlStr:String) -> UIImage {
        let url = URL(string: urlStr)
        let data = try? Data(contentsOf: url!) //make sure your image in this url does exist, otherwise unwrap in a if let check
        return UIImage(data: data!)!
    }
    
    open func getThumb(_ urlStr:String) -> UIImage {
        let url = URL(string: adminUrl + "index.php/image/index?name=" + urlStr + "&width=400")
        let data = try? Data(contentsOf: url!) //make sure your image in this url does exist, otherwise unwrap in a if let check
        return UIImage(data: data!)!
    }
    
    open func getGallery( _ completion: @escaping ( (JSON) -> Void) )  {
        var json = JSON(1);
        do {
             HTTP.GET(apiURL + "getallgallery")
            { response in
                if let _ = response.error {
                    completion(json);
                }
                else
                {
                    json  = JSON(data: response.data)
                    completion(json);
                }
            }
      
    }
    }
    
    open func getNews( _ completion: @escaping ( (JSON) -> Void) )  {
        var json = JSON(1);
         HTTP.GET(apiURL + "getallnews")
             { response in
                if let _ = response.error {
                    completion(json);
                }
                else
                {
                    json  = JSON(data: response.data)
                    completion(json);
                }
            }
       
    }
    
    open func getCongratulations( _ completion: @escaping ( (JSON) -> Void) )  {
        var json = JSON(1);
        HTTP.GET(apiURL + "getcongratulation")
            { response in
                if let _ = response.error {
                    completion(json);
                }
                else
                {
                    json  = JSON(data: response.data)
                    completion(json);
                }
            }
       
    }

    
    open func getMatchUpdate( _ completion: @escaping ( (JSON) -> Void) )  {
        var json = JSON(1);
         HTTP.GET(apiURL + "getscheduleforiosandroidseason4")
//            print("apicalltest")
             { response in
                if let _ = response.error {
                    completion(json);
                }
                else
                {
                    json  = JSON(data: response.data)
                    completion(json)
                }
            }
        
    }
    
    open func getPointTable( _ completion: @escaping ( (JSON) -> Void) )  {
        var json = JSON(1);
       
            HTTP.GET(apiURL + "getallpoint")
           { response in
                if let _ = response.error {
                    completion(json);
                }
                else
                {
                    json  = JSON(data: response.data)
                    completion(json);
                }
            }
        
    }
    
    open func getSchedule( _ completion: @escaping ( (JSON) -> Void) )  {
        var json = JSON(1);
    
            HTTP.GET(apiURL + "getScheduleAndroid")
             { response in
                if let _ = response.error {
                    completion(json);
                }
                else
                {
                    json  = JSON(data: response.data)
                    completion(json);
                }
            }
        
    }
    

    open func getWorldCup( _ completion: @escaping ( (JSON) -> Void) )  {
        var json = JSON(1);
         HTTP.GET(apiURL + "getScheduleForIosAndroidWorldCup2016")
            { response in
                if let _ = response.error {
                    completion(json);
                }
                else
                {
                    json  = JSON(data: response.data)
                    completion(json);
                }
            }
        
    }
    
    open func sendFanCorner(_ firstname:String, lastname:String, mobile:String, email:String, city:String, favouriteplayer:String, completion: @escaping ( (JSON) -> Void) )  {
        var json = JSON(1);
        let params = ["firstname": firstname, "lastname": lastname, "mobile": mobile, "email": email, "city": city, "favouriteplayer": favouriteplayer]
        //print(params)
       HTTP.POST(apiURL + "contactus", parameters: params, requestSerializer: JSONParameterSerializer())
            { response in
                if let _ = response.error {
                    completion(json);
                }
                else
                {
                    json  = JSON(data: response.data)
                    completion(json);
                }
            }
       
    }

    
    func getHome(_ completion: @escaping ( (JSON) -> Void)) {
        
        var json = JSON(1);
        HTTP.GET(apiURL + "getHomeContent")
           { response in
                if let _ = response.error {
                    completion(json);
                }
                else
                {
                    json  = JSON(data: response.data)
                    completion(json);
                }
            }
       
    }
    
    
    func getHomeMatch(_ completion: @escaping ( (JSON) -> Void)) {
        var json = JSON(1);
        HTTP.GET(apiURL + "getLatestMatch")
            { response in
                if let _ = response.error {
                    completion(json);
                }
                else
                {
                    json  = JSON(data: response.data)
                    completion(json);
                }
            }
       
    }
    
    func getGalleryById(_ id:String,completion: @escaping ( (JSON) -> Void)) {
        var json = JSON(1);
        
        let params = ["galleryid": id]
       
             HTTP.GET(apiURL + "getGallerySlide", parameters: params)
             { response in
                if let _ = response.error {
                    completion(json);
                }
                else
                {
                    json  = JSON(data: response.data)
                    completion(json);
                }
            }
       
    }
    
    func getWallPaper(_ completion: @escaping ( (JSON) -> Void)) {
        var json = JSON(1);
        
        let params = ["type": "1"]
         HTTP.POST(apiURL + "getWallpaper", parameters: params)
             { response in
                if let _ = response.error {
                    completion(json);
                }
                else
                {
                    json  = JSON(data: response.data)
                    completion(json);
                }
            }
       
        
    }
    
    public func getAllPlayers(completion: @escaping ((JSON) -> Void))
    {
        var json = JSON(1)
       
       let params = ["type": "1"]
             HTTP.GET(apiURL + "getallplayers", parameters: params)
                { response in
                    
                    if let _ = response.error {
                        let nsError = response.error! as NSError
                        if nsError.code == 401 {
                            json = JSON(nsError.code)
                            completion(json)
                        }else{
                            completion(json);
                        }
                    }
                    else
                    {
                        json  = JSON(data: response.data)
                        completion(json);
                    }
                }
            
            
        }
    
    
   func getSinglePlayer(_ id:String,completion: @escaping ( (JSON) -> Void))
    {
        var json = JSON(1)
        
        let params = ["id": id]
        HTTP.POST(apiURL + "getsingleplayer", parameters: params)
           { response in
                
                if let _ = response.error {
                    let nsError = response.error! as NSError
                    if nsError.code == 401 {
                        json = JSON(nsError.code)
                        completion(json)
                    }else{
                        completion(json);
                    }
                }
                else
                {
                    json  = JSON(data: response.data)
                    completion(json);
                }
            }
        
        
    }

    func getallteam(_ completion: @escaping ( (JSON) -> Void)) {
        
        var json = JSON(1);
        HTTP.GET(apiURL + "getallteam")
             { response in
                if let _ = response.error {
                    completion(json);
                }
                else
                {
                    json  = JSON(data: response.data)
                    completion(json);
                }
            }
        
    }

    open func getapphomeimage( _ completion: @escaping ( (JSON) -> Void) )  {
        var json = JSON(1);
         HTTP.GET(apiURL + "getapphomeimage")
            { response in
                if let _ = response.error {
                    completion(json);
                }
                else
                {
                    json  = JSON(data: response.data)
                    completion(json);
                }
            }
       
    }

    open func getSponsorImage( _ completion: @escaping ( (JSON) -> Void) )  {
        var json = JSON(1);
        
             HTTP.GET(apiURL + "getsponsorimage")
           { response in
                if let _ = response.error {
                    completion(json);
                }
                else
                {
                    json  = JSON(data: response.data)
                    completion(json);
                }
            }
        
    }

    
    open func merchandise( _ completion: @escaping ( (JSON) -> Void) )  {
        var json = JSON(1);
         HTTP.GET(apiURL + "getallmerchandize")
         { response in
                if let _ = response.error {
                    completion(json);
                }
                else
                {
                    json  = JSON(data: response.data)
                    completion(json);
                }
            }
       
    }

    
    open func tickets( _ completion: @escaping ( (JSON) -> Void) )  {
        var json = JSON(1);
         HTTP.GET(apiURL + "getAllTicket")
            { response in
                if let _ = response.error {
                    completion(json);
                }
                else
                {
                    json  = JSON(data: response.data)
                    completion(json);
                }
            }
        
    }
    
    
}
