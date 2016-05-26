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

//let adminUrl = "http://192.168.0.124/jppbackend/";
let adminUrl = "http://admin.jaipurpinkpanthers.com/";
let imageURL = adminUrl + "uploads/";
let apiURL = adminUrl + "index.php/json/";

public class RestApi {
    
    public func getYoutubeImage(videoID:String) -> String {
        return "http://img.youtube.com/vi/" + videoID + "/hqdefault.jpg"
    }
    
    public func getVideo( completion: ( (JSON) -> Void) )  {
        var json = JSON(1);
        do {
            let opt = try HTTP.GET(apiURL + "getAllVideoGallery")
            opt.start { response in
                if let _ = response.error {
                    completion(json);
                }
                else
                {
                    json  = JSON(data: response.data)
                    completion(json);
                }
            }
        } catch _ {
            completion(json);
        }
    }
    
    
    
    
    public func getImage(urlStr:String) -> UIImage {
        let url = NSURL(string: imageURL + urlStr)
        let data = NSData(contentsOfURL: url!) //make sure your image in this url does exist, otherwise unwrap in a if let check
        return UIImage(data: data!)!
    }
    
    public func getImageCache(urlStr:String) -> NSURL {
        let url = NSURL(string: adminUrl + "index.php/image/index?name=" + urlStr + "&width=400")
        return url!
    }
    
    public func getImageThumbCache(urlStr:String) -> NSURL {
        let url = NSURL(string: adminUrl + "index.php/image/index?name=" + urlStr + "&width=250")
        return url!
    }
    
    public func getImageExternalCacheURL(urlStr:String) -> NSURL {
        let url = NSURL(string:urlStr)
        return url!
    }
    
    public func getImageExternalURL(urlStr:String) -> UIImage {
        let url = NSURL(string: urlStr)
        let data = NSData(contentsOfURL: url!) //make sure your image in this url does exist, otherwise unwrap in a if let check
        return UIImage(data: data!)!
    }
    
    public func getThumb(urlStr:String) -> UIImage {
        let url = NSURL(string: adminUrl + "index.php/image/index?name=" + urlStr + "&width=400")
        let data = NSData(contentsOfURL: url!) //make sure your image in this url does exist, otherwise unwrap in a if let check
        return UIImage(data: data!)!
    }
    
    public func getGallery( completion: ( (JSON) -> Void) )  {
        var json = JSON(1);
        do {
            
            
            let opt = try HTTP.GET(apiURL + "getallgallery")
            opt.start { response in
                if let _ = response.error {
                    completion(json);
                }
                else
                {
                    json  = JSON(data: response.data)
                    completion(json);
                }
            }
        } catch _ {
            completion(json);
        }
    }
    
    public func getNews( completion: ( (JSON) -> Void) )  {
        var json = JSON(1);
        do {
            let opt = try HTTP.GET(apiURL + "getallnews")
            opt.start { response in
                if let _ = response.error {
                    completion(json);
                }
                else
                {
                    json  = JSON(data: response.data)
                    completion(json);
                }
            }
        } catch _ {
            completion(json);
        }
    }
    
    public func getPointTable( completion: ( (JSON) -> Void) )  {
        var json = JSON(1);
        do {
            let opt = try HTTP.GET(apiURL + "getallpoint")
            opt.start { response in
                if let _ = response.error {
                    completion(json);
                }
                else
                {
                    json  = JSON(data: response.data)
                    completion(json);
                }
            }
        } catch _ {
            completion(json);
        }
    }
    
    public func getSchedule( completion: ( (JSON) -> Void) )  {
        var json = JSON(1);
        do {
            let opt = try HTTP.GET(apiURL + "getScheduleAndroid")
            opt.start { response in
                if let _ = response.error {
                    completion(json);
                }
                else
                {
                    json  = JSON(data: response.data)
                    completion(json);
                }
            }
        } catch _ {
            completion(json);
        }
    }
    
    public func sendFanCorner(firstname:String, lastname:String, mobile:String, email:String, location:String, completion: ( (JSON) -> Void) )  {
        var json = JSON(1);
        let params = ["firstname": firstname, "lastname": lastname, "mobile": mobile, "email": email, "location": location]
        //print(params)
        do {
            let opt = try HTTP.POST(apiURL + "contactus", parameters: params, requestSerializer: JSONParameterSerializer())
            opt.start { response in
                if let _ = response.error {
                    completion(json);
                }
                else
                {
                    json  = JSON(data: response.data)
                    completion(json);
                }
            }
        } catch _ {
            completion(json);
        }
    }

    
    func getHome(completion: ( (JSON) -> Void)) {
        var json = JSON(1);
        do {
            let opt = try HTTP.GET(apiURL + "getHomeContent")
            opt.start { response in
                if let _ = response.error {
                    completion(json);
                }
                else
                {
                    json  = JSON(data: response.data)
                    completion(json);
                }
            }
        } catch _ {
            completion(json);
        }
    }
    
    func getGalleryById(id:String,completion: ( (JSON) -> Void)) {
        var json = JSON(1);
        
        let params = ["galleryid": id]
        do {
            let opt = try HTTP.GET(apiURL + "getGallerySlide", parameters: params)
            opt.start { response in
                if let _ = response.error {
                    completion(json);
                }
                else
                {
                    json  = JSON(data: response.data)
                    completion(json);
                }
            }
        } catch _ {
            completion(json);
        }
        
    }
    
    func getWallPaper(completion: ( (JSON) -> Void)) {
        var json = JSON(1);
        
        let params = ["type": "1"]
        do {
            let opt = try HTTP.GET(apiURL + "getWallpaper", parameters: params)
            opt.start { response in
                if let _ = response.error {
                    completion(json);
                }
                else
                {
                    json  = JSON(data: response.data)
                    completion(json);
                }
            }
        } catch _ {
            completion(json);
        }
        
    }
    
}