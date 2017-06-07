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
let adminUrl = "http://admin.jaipurpinkpanthers.com/";
let imageURL = adminUrl + "uploads/";
let apiURL = adminUrl + "index.php/json/";

open class RestApi {
    
    open func getYoutubeImage(_ videoID:String) -> String {
        return "http://img.youtube.com/vi/" + videoID + "/hqdefault.jpg"
    }
    
    open func getVideo( _ completion: @escaping ( (JSON) -> Void) )  {
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
    
    open func getNews( _ completion: @escaping ( (JSON) -> Void) )  {
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
    
    open func getMatchUpdate( _ completion: @escaping ( (JSON) -> Void) )  {
        var json = JSON(1);
        do {
            let opt = try HTTP.GET(apiURL + "getscheduleforiosandroidseason4")
            opt.start { response in
                if let _ = response.error {
                    completion(json);
                }
                else
                {
                    json  = JSON(data: response.data)
                    completion(json)
                }
            }
        } catch _ {
            completion(json)
        }
    }
    
    open func getPointTable( _ completion: @escaping ( (JSON) -> Void) )  {
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
    
    open func getSchedule( _ completion: @escaping ( (JSON) -> Void) )  {
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
    
    open func getWorldCup( _ completion: @escaping ( (JSON) -> Void) )  {
        var json = JSON(1);
        do {
            let opt = try HTTP.GET(apiURL + "getScheduleForIosAndroidWorldCup2016")
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
    
    open func sendFanCorner(_ firstname:String, lastname:String, mobile:String, email:String, city:String, favouriteplayer:String, completion: @escaping ( (JSON) -> Void) )  {
        var json = JSON(1);
        let params = ["firstname": firstname, "lastname": lastname, "mobile": mobile, "email": email, "city": city, "favouriteplayer": favouriteplayer]
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

    
    func getHome(_ completion: @escaping ( (JSON) -> Void)) {
        
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
    
    
    func getHomeMatch(_ completion: @escaping ( (JSON) -> Void)) {
        var json = JSON(1);
        do {
            let opt = try HTTP.GET(apiURL + "getLatestMatch")
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
    
    func getGalleryById(_ id:String,completion: @escaping ( (JSON) -> Void)) {
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
    
    func getWallPaper(_ completion: @escaping ( (JSON) -> Void)) {
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
