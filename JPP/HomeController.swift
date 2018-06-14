//
//  HomeController.swift
//  JPP
//
//  Created by Chintan Shah on 26/01/16.
//  Copyright © 2016 Wohlig Technology. All rights reserved.
//

import UIKit
import DKChainableAnimationKit
import EventKitUI

var GHomeController:HomeController!;
let refreshControl = UIRefreshControl()
var timer = Timer()
let updates = doneMatch()
class HomeController: UIViewController, UIGestureRecognizerDelegate {
    var pointsTable: JSON = []
    
    func checkCalendarAuthorizationStatus() {
        let status = EKEventStore.authorizationStatus(for: EKEntityType.event)
        
        switch (status) {
        case EKAuthorizationStatus.notDetermined:
            requestAccessToCalendar()
        case EKAuthorizationStatus.authorized:
            print("Authorised");
        case EKAuthorizationStatus.restricted:
            print("Restricted");
        case EKAuthorizationStatus.denied:
            print("Denied");
            
        }
    }
    
    func requestAccessToCalendar() {
        eventStore.requestAccess(to: EKEntityType.event, completion: {
            (accessGranted: Bool, error: Error?) in
            
            if accessGranted == true {
                DispatchQueue.main.async(execute: {
                    print("Access Graned");
                    
                    SaveCalender = 1;
                })
            } else {
                DispatchQueue.main.async(execute: {
                    SaveCalender = 0;
                    print("Access not Graned");
                })
            }
        })
    }
 

    
    func setInterval(_ interval:TimeInterval, block: @escaping ()->Void) -> Timer {
        return Timer.scheduledTimer(timeInterval: interval, target: BlockOperation(block: block), selector: #selector(Operation.main), userInfo: nil, repeats: true)
    }
    
    var newsController:UIViewController!
    var galleryController: UIViewController!
    var fancornerController: UIViewController!
    var matchupdateController: UIViewController!
    var i = 0;
    @IBOutlet weak var scrollView: UIScrollView!
    var verticalLayout : VerticalLayout!
    
    var getPicture: JSON = []
    
    var diffMonth = 0
    var diffDay = 0
    var diffHour = 0
    var diffMin = 0
    
    let font = UIFont(name: "Oswald-Regular", size: 13.0)
    let blue = UIColor(red: 77/255, green: 203/255, blue: 244/255, alpha: 1)
    
    var refeshController = UIRefreshControl()
    
    var HomeJSON = JSON(1)
    
    func handleTap(_ sender: UITapGestureRecognizer? = nil) {
        
        mediaUrl = HomeJSON["news"]["content"].string!
        
        let newsController = storyboard!.instantiateViewController(withIdentifier: "news") as! NewsController
        self.newsController = UINavigationController(rootViewController: newsController)
        
         self.slideMenuController()?.changeMainViewController(self.newsController, close: true)
        
    }
    
    func jpptvTap(_ sender: UITapGestureRecognizer? = nil) {
        let galleryController = storyboard!.instantiateViewController(withIdentifier:"matchupdate" ) as! MatchUpdateController
        self.galleryController = UINavigationController(rootViewController: galleryController)
        self.slideMenuController()?.changeMainViewController(self.galleryController, close: true)
//        galleryController.activeGal = 1
    }
    
    func homeApp(_ sender: UITapGestureRecognizer? = nil) {
        let matchupdateController = storyboard!.instantiateViewController(withIdentifier: "knowteam") as! KnowTeamController
        self.matchupdateController = UINavigationController(rootViewController: matchupdateController)
        self.slideMenuController()?.changeMainViewController(self.matchupdateController, close: true)
        //        galleryController.activeGal = 1
    }

    
    func signupTap(_ sender: UITapGestureRecognizer? = nil) {
        let fancornerController = storyboard!.instantiateViewController(withIdentifier: "fanCorner") as! FanCornerController
        self.fancornerController = UINavigationController(rootViewController: fancornerController)
        self.slideMenuController()?.changeMainViewController(self.fancornerController, close: true)
    }
    
    func showScore(_ json:JSON) {
        
        let updates1 = doneMatch(frame: CGRect(x: 8,y: 8,width: self.verticalLayout.frame.width-16,height: 300));
        print(updates1)
//        updates1.teamOneScore.font = UIFont(name: "Kenyan-Coffee", size: 45)
//        updates1.teamTwoScore.font = UIFont(name: "Kenyan-Coffee", size: 45)
//        updates1.teamOneScore.layer.borderWidth = 3
//        updates1.teamOneScore.layer.borderColor = UIColor.white.cgColor
//        updates1.teamTwoScore.layer.borderWidth = 3
//        updates1.teamTwoScore.layer.borderColor = UIColor.white.cgColor
        
         updates1.team1image.hnk_setImageFromURL(rest.getImageSizeCache(json["latestMatch"]["appteamimage1"].stringValue))
        updates1.team2image.hnk_setImageFromURL(rest.getImageSizeCache(json["latestMatch"]["appteamimage2"].stringValue))
        if json["latestMatch"]["score1"]=="" {
            updates1.teamOneScore.text = "0"
        }else{
            updates1.teamOneScore.text = json["latestMatch"]["score1"].string
        }
        if json["latestMatch"]["score2"]=="" {
            updates1.teamTwoScore.text = "0"
        }else{
            updates1.teamTwoScore.text = json["latestMatch"]["score2"].string
        }
        
        updates1.fulltimeText.text = json["latestMatch"]["totalmatchtime"].string!
    
        
        switch json["latestMatch"]["team1"].string! {
        case "Jaipur Pink Panthers":
            updates1.teamOneScore.tintColor = UIColor(red: 231/255, green: 45/255, blue: 137/255, alpha: 1) //E72D89
        case "Bengaluru Bulls":
            updates1.teamOneScore.textColor = UIColor(red: 176/255, green: 29/255, blue: 33/255, alpha: 1) //b01d21
        case "Bengal Warriors":
            updates1.teamOneScore.textColor = UIColor(red: 242/255, green: 103/255, blue: 36/255, alpha: 1) //f26724
        case "Dabang Delhi":
            updates1.teamOneScore.textColor = UIColor(red: 217/255, green: 31/255, blue: 45/255, alpha: 1) //d91f2d
        case "Patna Pirates":
            updates1.teamOneScore.textColor = UIColor(red: 10/255, green: 68/255, blue: 54/255, alpha: 1) //0a4436
        case "Puneri Paltan":
            updates1.teamOneScore.textColor = UIColor(red: 240/255, green: 78/255, blue: 35/255, alpha: 1) //f04e23
        case "Telugu Titans":
            updates1.teamOneScore.textColor = UIColor(red: 218/255, green: 33/255, blue: 49/255, alpha: 1) //da2131
        case "U Mumba":
            updates1.teamOneScore.textColor = UIColor(red: 241/255, green: 89/255, blue: 34/255, alpha: 1) //f15922
        default:
            updates1.teamOneScore.textColor = UIColor(red: 231/255, green: 45/255, blue: 137/255, alpha: 1) //E72D89
        }
        
        switch json["latestMatch"]["team2"].string! {
        case "Jaipur Pink Panthers":
            updates1.teamTwoScore.textColor = UIColor(red: 231/255, green: 45/255, blue: 137/255, alpha: 1) //E72D89
            print("Jaipur Pink Panthers")
        case "Bengaluru Bulls":
            updates1.teamTwoScore.textColor = UIColor(red: 176/255, green: 29/255, blue: 33/255, alpha: 1) //b01d21
            print("Bengaluru Bulls")
        case "Bengal Warriors":
            updates1.teamTwoScore.textColor = UIColor(red: 242/255, green: 103/255, blue: 36/255, alpha: 1) //f26724
        case "Dabang Delhi":
            updates1.teamTwoScore.textColor = UIColor(red: 217/255, green: 31/255, blue: 45/255, alpha: 1) //d91f2d
        case "Patna Pirates":
            updates1.teamTwoScore.textColor = UIColor(red: 10/255, green: 68/255, blue: 54/255, alpha: 1) //0a4436
        case "Puneri Paltan":
            updates1.teamTwoScore.textColor = UIColor(red: 240/255, green: 78/255, blue: 35/255, alpha: 1) //f04e23
        case "Telugu Titans":
            updates1.teamTwoScore.textColor = UIColor(red: 218/255, green: 33/255, blue: 49/255, alpha: 1) //da2131
        case "U Mumba":
            updates1.teamTwoScore.textColor = UIColor(red: 241/255, green: 89/255, blue: 34/255, alpha: 1) //f15922
        default:
            updates1.teamTwoScore.textColor = UIColor(red: 231/255, green: 45/255, blue: 137/255, alpha: 1) //E72D89
        }
        
        self.verticalLayout.addSubview(updates1)
    }
    
    func homeLoaded(_ json:JSON) {
       
        print(json["latestMatch"]);
        if(json == 1)
        {
            let alertController = UIAlertController(title: "No Connection", message:
                "Please check your internet connection", preferredStyle: UIAlertControllerStyle.alert)
            alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.default,handler: nil))
            
            self.present(alertController, animated: true, completion: nil)
        }
        else
        {   self.i += 1
            HomeJSON = json;
            print(HomeJSON)
            
            DispatchQueue.main.async(execute: {
                if(self.i>1)
                {
                    self.verticalLayout.removeFromSuperview()
                }
                self.verticalLayout = VerticalLayout(width: self.view.frame.width);
                self.scrollView.insertSubview(self.verticalLayout, at: 0)
                
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "dd MMM yyyy, HH:mm"
                
                let date = Date()
                var calendar = Calendar.current
                let components = (calendar as NSCalendar).components([.month, .day, .hour, .minute, .second, .year], from: date)
                let month = components.month
                let day = components.day
                let hour = components.hour
                let minutes = components.minute
                var year = components.year
                print("showMeYear\(year)")
                
                print("hellojson\(json["latestMatch"])");
                if json["latestMatch"]["starttimedate"].string != nil && self.getPicture["status"].stringValue == "2" {
                    print("showhomeimage\(self.getPicture["image"].string)")
                    
                    let datematch = dateFormatter.date(from: json["latestMatch"]["starttimedate"].string!)!
                    let unitFlags = Set<Calendar.Component>([.month, .day, .hour, .minute, .second])
//                    calendar.timeZone = NSTimeZone.init(abbreviation: "IST")! as TimeZone
                    let componentsmatch = calendar.dateComponents(unitFlags, from: datematch)
                    
                    var matchMonth = componentsmatch.month
                    let matchDay = componentsmatch.day
                    let matchHour = componentsmatch.hour
                    let matchMins = componentsmatch.minute
                    var matchYear = componentsmatch.year
                    
//                    self.diffMonth = matchMonth! - month!
//                    self.diffDay == self.diffDay
                    print("gochi\(self.diffDay)")
//                    self.diffDay = matchDay! - day!
                    var diffMonth = matchMonth! - month!
                    print("diffMonth\(diffMonth)")
                    var monthBefore = 0
// 
                   self.diffDay = 0
                    self.diffDay = self.diffDay + matchDay! - day!
                    print("gochi\(self.diffDay)")
                    if diffMonth != 0 {
                       
                        for _ in  1...diffMonth{
                            if matchMonth != 1 {
                                monthBefore = matchMonth! - 1
                                
                                
                            }else{
                                monthBefore = 12
                            };
                            matchMonth = monthBefore
                            print("comeonfast\(matchMonth)")
                            if monthBefore == 1 || monthBefore == 3 || monthBefore == 5 || monthBefore == 7 || monthBefore == 8 || monthBefore == 10 || monthBefore == 12 {
                                self.diffDay = self.diffDay + 31
                                print("gochi\(self.diffDay)")
                            }else if monthBefore == 4 || monthBefore == 6 || monthBefore == 9 || monthBefore == 11{
                                self.diffDay = self.diffDay + 30
                                print("gochi\(self.diffDay)")
                            }else {
                                if matchYear!/4 == 0 {
                                    self.diffDay = self.diffDay + 29
                                    print("gochi\(self.diffDay)")
                                }else {
                                    self.diffDay = self.diffDay + 28
                                    print("gochi\(self.diffDay)")
                                }
                            }
                            
                        }
                    }else{
                    self.diffDay = matchDay! - day!
                        print("gochi55\(self.diffDay)")
                print("pleaseShowmeDays1")
                    }

                    self.diffHour = matchHour! - hour!
                    self.diffMin = matchMins! - minutes!
                    self.diffDay == self.diffDay
                    print("gochi56\(self.diffDay)")
                    let range = calendar.range(of: .day, in: .month, for: date)
                    range?.count
                    
                    if(self.diffMin < 0) { self.diffHour = self.diffHour - 1;  self.diffMin = self.diffMin + 60 }
                    
                    if(self.diffHour < 0) { self.diffDay = self.diffDay - 1; self.diffHour = self.diffHour + 24 }
                    print("gochi56\(self.diffDay)")
                    if(self.diffDay < 0) { self.diffMonth = self.diffMonth - 1; self.diffDay = self.diffDay + (range?.count)! }
                    
                     print("gochi567\(self.diffDay)")
                    if(json["latestMatch"]["score2"] == "" && self.diffMin >= 0 && self.diffHour >= 0 && self.diffDay >= 0 && self.diffMonth >= 0) {
                        
                        if self.diffMonth == 0 && self.diffDay == 0 && self.diffHour == 0 && self.diffMin == 0 {
                            self.showScore(json)
                        }else{
                            
                            var updates = seasonOpener(frame: CGRect(x: 8, y: 8, width: self.verticalLayout.frame.width-16, height: 380))
                            
                            
                            let dateFormatter = DateFormatter()
                            dateFormatter.dateFormat = "dd MMM yyyy, HH:mm"
                            
                            
                            if ((json["latestMatch"]["starttimedate"].string != nil)) {
                                updates.EventTimeTop = dateFormatter.date(from: json["latestMatch"]["starttimedate"].string!)!
                            }else {
                                print("json error")
                            }
                            updates.EventTimeTop = dateFormatter.date(from: json["latestMatch"]["starttimedate"].string!)!
                            
                            if((json["latestMatch"]["team1"].string != nil) && (json["latestMatch"]["team2"].string != nil))
                            {
                                updates.EventNameTop = json["latestMatch"]["team1"].string! + " VS " + json["latestMatch"]["team2"].string!;
                            }else{
                                print("json error")
                            }
                            
                           
                            
                            self.verticalLayout.addSubview(updates)
                            self.resizeView(8)
                            
//                             self.updates.addToCalendar.addTarget(self, action: #selector(self.playerCareer(_:)), for: .touchUpInside)
//                            
//                            
//                                                       updates.addToCalender.isHidden = true
                            
                            
                            
                            if(json["latestMatch"]["team1id"] ).string != nil {
                            updates.team1Image.hnk_setImageFromURL(rest.getImageSizeCache(json["latestMatch"]["appteamimage1"].stringValue))
                            }
                            if(json["latestMatch"]["team2id"]).string != nil {
                            updates.team2Image.hnk_setImageFromURL(rest.getImageSizeCache(json["latestMatch"]["appteamimage2"].stringValue))
                            }
                            
                            
                            updates.matchTime.text = json["latestMatch"]["starttimedate"].string
                            
                            
                            print(json["latestMatch"]["stadium"].string);
                            print("JJJJJJJJJJ");
                            if(json["latestMatch"]["stadium"].string != nil) {
                                updates.matchVenue.text = json["latestMatch"]["stadium"].string
                                print("KKKKKKKKKK");
                            }
                            
                            
                            if(json["latestMatch"]["level"].stringValue == "semifinal" )
                            {
                                updates.trapLabel.text = "SEMI FINALS"
                            }
                            else if(json["latestMatch"]["level"].stringValue == "final" )
                            {
                                updates.trapLabel.text = "FINALS"
                            }
                            else {
                                updates.trapLabel.text = json["latestMatch"]["level"].stringValue
                            }
                            
                            let date = NSDate()
                            var calendar = NSCalendar.current
                            let components = calendar.dateComponents([.month, .day, .hour, .minute, .second], from: date as Date)
                            let month = components.month
                            let day = components.day
                            let hour = components.hour
                            let minutes = components.minute
                            
                           

                            let range = calendar.range(of: .day, in: .month, for: date as Date)
                            range?.count
                            
                            
                            let datematch = dateFormatter.date(from: json["latestMatch"]["starttimedate"].string!)!
                            let unitFlags = Set<Calendar.Component>([.month, .day, .hour, .minute, .second, .year])
                            print("seeThis\(unitFlags)")
//                            calendar.timeZone = TimeZone(identifier: "UTC")!
                            let componentsmatch = calendar.dateComponents(unitFlags, from: datematch)
                            
                            
//                            var matchMonth = componentsmatch.month
                            let matchDay = componentsmatch.day
                            let matchHour = componentsmatch.hour
                            let matchMins = componentsmatch.minute
                            var matchYear = componentsmatch.year
                            print("yearPlease\(matchYear)")
                            
                            
                            self.setInterval(10, block: { () -> Void in
                                
                                let date = NSDate()
                                print("showmedate\(date)")
                                var calendar = NSCalendar.current
//                                calendar.timeZone = TimeZone(identifier: "UTC")!
                                let components = (calendar as NSCalendar).components([.month, .day, .hour, .minute, .year], from: date as Date)
                                let month = components.month
                                let day = components.day
                                let hour = components.hour
                                let minutes = components.minute
                                let year = components.year
                                
                                let datematch = dateFormatter.date(from: json["latestMatch"]["starttimedate"].string!)!
                                let unitFlags = Set<Calendar.Component>([.month, .day, .hour, .minute, .second, .year])
                                print("seeThis\(unitFlags)")
                                //                            calendar.timeZone = TimeZone(identifier: "UTC")!
                                let componentsmatch = calendar.dateComponents(unitFlags, from: datematch)
                                
                                
                                //                            var matchMonth = componentsmatch.month
                                let matchDay = componentsmatch.day
                                let matchHour = componentsmatch.hour
                                let matchMins = componentsmatch.minute
                                var matchYear = componentsmatch.year
                                print("yearPlease\(matchYear)")
                                let range = calendar.range(of: .day, in: .month, for: date as Date)
                                range?.count
                                
                                var diffMonth = matchMonth! - month!
                                print("diffMonth\(diffMonth)")
                                var monthBefore = 0
                                //
                                self.diffDay = 0
                                self.diffDay = self.diffDay + matchDay! - day!
                                print("gochi1\(self.diffDay)")
                                if diffMonth != 0 {
                                    
                                    for _ in  1...diffMonth{
                                        if matchMonth != 1 {
                                            monthBefore = matchMonth! - 1
                                            
                                            
                                        }else{
                                            monthBefore = 12
                                        };
                                        matchMonth = monthBefore
                                        print("comeonfast\(matchMonth)")
                                        if monthBefore == 1 || monthBefore == 3 || monthBefore == 5 || monthBefore == 7 || monthBefore == 8 || monthBefore == 10 || monthBefore == 12 {
                                            self.diffDay = self.diffDay + 31
                                            print("gochi2\(self.diffDay)")
                                        }else if monthBefore == 4 || monthBefore == 6 || monthBefore == 9 || monthBefore == 11{
                                            self.diffDay = self.diffDay + 30
                                            print("gochi3\(self.diffDay)")
                                        }else {
                                            if matchYear!/4 == 0 {
                                                self.diffDay = self.diffDay + 29
                                                print("gochi4\(self.diffDay)")
                                            }else {
                                                self.diffDay = self.diffDay + 28
                                                print("gochi5\(self.diffDay)")
                                            }
                                        }
                                        
                                    }
                                }else{
                                    self.diffDay = matchDay! - day!
                                    print("gochi6\(self.diffDay)")
                                    print("pleaseShowmeDays")
                                }

                                
                                var diffHour = matchHour! - hour!
                                var diffMin = matchMins! - minutes!
                                
                                if(diffMin < 0) { diffHour = diffHour - 1;  diffMin = diffMin + 60 }
                                
                                if(diffHour < 0) { self.diffDay = self.diffDay - 1; diffHour = diffHour + 24 }
                                
                                if(self.diffDay < 0) { diffMonth = diffMonth - 1; self.diffDay = self.diffDay + (range?.count)! }
                                
                                //print(diffDay)
                                //print(diffHour)
                                //print(diffMin)
                                
                                updates.remainingMonths.text = String(diffMonth)
                                print("gochi7\(self.diffDay)")
                                updates.remainingDays.text = String(self.diffDay)
                                updates.remainingHours.text = String(diffHour)
                                updates.remainingMins.text = String(diffMin)
                                if(diffMin <= 0 && diffHour <= 0 && self.diffDay <= 0){
                                    //print("start match")
                                    self.refresh(self.refeshController)
                                }else{
                                    //print("still on")
//                                   updates.removeFromSuperview()
                                    
                                }
                            })
                            updates.remainingMonths.text = String(self.diffMonth)
                            updates.remainingDays.text = String(self.diffDay)
                            updates.remainingHours.text = String(self.diffHour)
                            updates.remainingMins.text = String(self.diffMin)
                        }
                    } else{
                        self.showScore(json)
                    }
                    
                }
                else{
                    self.home()
                    let thumbnail = thumbnailImage(frame: CGRect.zero)
                    thumbnail.frame = CGRect(x: 8,y: 8,width: self.verticalLayout.frame.width-16,height: 200);
                    
                    let homeApp = UITapGestureRecognizer(target: self, action: #selector(HomeController.homeApp(_:)))
                    homeApp.delegate = self
                    thumbnail.addGestureRecognizer(homeApp)
                    thumbnail.layoutIfNeeded()

//                    print("\n thumbImage : \(thumbnail.thumbImage)")
//                    
//                    thumbnail.thumbImage.hnk_setImageFromURL(rest.getImageSizeCache(self.getPicture["image"].stringValue))
//                    print("showThumbnail\(thumbnail.thumbImage)")
                     thumbnail.thumbImage.contentMode = .scaleAspectFit
                    self.verticalLayout.addSubview(thumbnail);
                    
                                       self.resizeView(8)
                    print("goingInside")
                   
                }
            
            
                
                
                
                
//                self.showScore(json)
                
                
               
                
                if((json["news"]["id"].string) != nil) {
                    print("hello\(json["news"])")
                    let newsBox = news(frame: CGRect(x: 8,y: 8,width: self.verticalLayout.frame.width-16,height: 280) );
                    newsBox.newsDate.text = json["news"]["timestamp"].string
                    newsBox.newsSubTitle.text = json["news"]["name"].string
                    newsBox.newsDescription.text = json["news"]["content"].string
                   
                    newsBox.newsImage.hnk_setImageFromURL(rest.getImageCache(json["news"]["image"].string!))
                    print("y not coming\( newsBox.newsImage)")
                    let tap = UITapGestureRecognizer(target: self, action: #selector(HomeController.handleTap(_:)))
                    tap.delegate = self
                    newsBox.addGestureRecognizer(tap)
                    self.verticalLayout.addSubview(newsBox);
                }
                
                // SIGN UP SECTION
                let signupsection = signupSection(frame: CGRect(x: 8, y: 8, width: self.verticalLayout.frame.size.width - 16, height: 90))
                let sutap = UITapGestureRecognizer(target: self, action: #selector(HomeController.signupTap(_:)))
                sutap.delegate = self
                signupsection.signupButton.addGestureRecognizer(sutap)
                self.verticalLayout.addSubview(signupsection)
                
                // JPP TV SECTION
                let tvsection = jpptv(frame: CGRect(x: 8, y: 8, width: self.verticalLayout.frame.size.width - 16, height: 200))
                rest.getapphomeimage({(json:JSON) -> () in
                    DispatchQueue.main.sync(execute: {
                        if json == 401 {
                            print("No Data Found")
                        }else{
                            print(json)
                            self.getPicture = json
                            tvsection.season5Review.hnk_setImageFromURL(rest.getImageSizeCache(self.getPicture["image"].stringValue))
                            print("showshowshow\(self.getPicture)")
                        }
                    })
                    
                })
                let tvtap = UITapGestureRecognizer(target: self, action: #selector(HomeController.jpptvTap(_:)))
                tvtap.delegate = self
                tvsection.addGestureRecognizer(tvtap)
                self.verticalLayout.addSubview(tvsection)
                
                let teamTitle = team2(frame: CGRect(x: 8,y: 8,width: self.verticalLayout.frame.width-16,height: 34) );
                self.verticalLayout.addSubview(teamTitle);
                
                let PinkBox = UIView(frame:CGRect(x: 8,y: 0,width: self.verticalLayout.frame.width-16,height: 300));
                PinkBox.backgroundColor = UIColor(red: 77/255, green: 203/255, blue: 244/255, alpha: 1)
                self.verticalLayout.addSubview(PinkBox);
                let imageView = bgImage(frame: CGRect(x: 0, y: 0, width: PinkBox.frame.width, height: PinkBox.frame.height))
                PinkBox.addSubview(imageView)
                let tableHeader = table(frame: CGRect(x: 8,y: 8,width: PinkBox.frame.width-16,height: 44));
                
                tableHeader.tableNo.font = self.font
                tableHeader.tableNo.text = "No."
                
                tableHeader.tableTeam.font = self.font
                tableHeader.tableTeam.text = "Team"
                
                tableHeader.tablePlayed.font = self.font
                tableHeader.tablePlayed.text = "P"
                
                tableHeader.tableWon.font = self.font
                tableHeader.tableWon.text = "W"
                
                tableHeader.tableLost.font = self.font
                tableHeader.tableLost.text = "L"
                
                tableHeader.tableDraw.font = self.font
                tableHeader.tableDraw.text = "D"
                
                tableHeader.tablePoint.font = self.font
                tableHeader.tablePoint.text = "PTS"
                
                
                PinkBox.addSubview(tableHeader)
               
                
                let zone = ZoneUI(frame: CGRect(x: 8, y: 66, width: PinkBox.frame.width - 16, height: 30))
                PinkBox.addSubview(zone)
                
                let topSpaceinPink = 8;
                let spacingPink = 3;
                
               
               
                for i in 0..<self.pointsTable[0]["pointsTableA"].count
                {
                    
                    let topDistance = topSpaceinPink+spacingPink + 38 + ((44  + spacingPink)*(i+1));
                    
                    let insideTable = table(frame: CGRect(x: 8,y: CGFloat(topDistance),width: PinkBox.frame.width-16,height: 40));
                    
                    insideTable.tableNo.text = String(i+1)
                    
                    insideTable.tableTeam.text = self.pointsTable[0]["pointsTableA"][i]["name"].string
                    
                    insideTable.tablePlayed.text = self.pointsTable[0]["pointsTableA"][i]["played"].string
                    
                    insideTable.tableWon.text = self.pointsTable[0]["pointsTableA"][i]["wins"].string
                    
                    insideTable.tableDraw.text = self.pointsTable[0]["pointsTableA"][i]["draw"].string
                    
                    insideTable.tableLost.text = self.pointsTable[0]["pointsTableA"][i]["lost"].string
                    
                    insideTable.tablePoint.text = self.pointsTable[0]["pointsTableA"][i]["point"].string
                    
                    if (self.pointsTable[0]["pointsTableA"][i]["name"].string == "Jaipur Pink Panthers") {
                        insideTable.tableNo.font = self.font
                        insideTable.tableTeam.font = self.font
                        insideTable.tablePlayed.font = self.font
                        insideTable.tableWon.font = self.font
                        insideTable.tableLost.font = self.font
                        insideTable.tableDraw.font = self.font
                        insideTable.tablePoint.font = self.font
                        
                        insideTable.tableNo.textColor = PinkColor
                        insideTable.tableTeam.textColor = PinkColor
                        insideTable.tablePlayed.textColor = PinkColor
                        insideTable.tableWon.textColor = PinkColor
                        insideTable.tableLost.textColor = PinkColor
                        insideTable.tableDraw.textColor = PinkColor
                        insideTable.tablePoint.textColor = PinkColor
                        
                        insideTable.backgroundColor = UIColor(red: 77/255, green: 203/255, blue: 244/255, alpha: 1)
                    }
                    
                    
                    PinkBox.frame.size.height = CGFloat(topDistance + 44 + 8)
//                    zone.frame.size.height = CGFloat(topDistance + 44 + 8)
                    
                    imageView.frame.size.height = CGFloat(topDistance + 44 + 8)
                    
                    PinkBox.addSubview(insideTable);
                    
                }
                
                let zone1 = ZoneUI(frame: CGRect(x: 8, y: 386, width: PinkBox.frame.width - 16, height: 30))
//                zone1.zoneView.backgroundColor = UIColor(red: 77/255, green: 203/255, blue: 244/255, alpha: 1)
                zone1.zoneLabel.text = "Zone B"
                PinkBox.addSubview(zone1)
                
                for i in 0..<self.pointsTable[0]["pointsTableA"].count
                {
                    
                    let topDistance1 = topSpaceinPink+spacingPink + 358 + ((44  + spacingPink)*(i+1));
                    
                    let insideTable1 = table(frame: CGRect(x: 8,y: CGFloat(topDistance1),width: PinkBox.frame.width-16,height: 40));
                    
                    insideTable1.tableNo.text = String(i+1)
                    
                    insideTable1.tableTeam.text = self.pointsTable[1]["pointsTableB"][i]["name"].string
                    
                    insideTable1.tablePlayed.text = self.pointsTable[1]["pointsTableB"][i]["played"].string
                    
                    insideTable1.tableWon.text = self.pointsTable[1]["pointsTableB"][i]["wins"].string
                    
                    insideTable1.tableDraw.text = self.pointsTable[1]["pointsTableB"][i]["draw"].string
                    
                    insideTable1.tableLost.text = self.pointsTable[1]["pointsTableB"][i]["lost"].string
                    
                    insideTable1.tablePoint.text = self.pointsTable[1]["pointsTableB"][i]["point"].string
                    
                    if (self.pointsTable[1]["pointsTableB"][i]["name"].string == "Jaipur Pink Panthers") {
                        insideTable1.tableNo.font = self.font
                        insideTable1.tableTeam.font = self.font
                        insideTable1.tablePlayed.font = self.font
                        insideTable1.tableWon.font = self.font
                        insideTable1.tableLost.font = self.font
                        insideTable1.tableDraw.font = self.font
                        insideTable1.tablePoint.font = self.font
                        
                        insideTable1.tableNo.textColor = PinkColor
                        insideTable1.tableTeam.textColor = PinkColor
                        insideTable1.tablePlayed.textColor = PinkColor
                        insideTable1.tableWon.textColor = PinkColor
                        insideTable1.tableLost.textColor = PinkColor
                        insideTable1.tableDraw.textColor = PinkColor
                        insideTable1.tablePoint.textColor = PinkColor
                        
                        insideTable1.backgroundColor = UIColor(red: 77/255, green: 203/255, blue: 244/255, alpha: 1)
                    }
                    
                    
                    PinkBox.frame.size.height = CGFloat(topDistance1 + 44 + 8)
                    //                    zone.frame.size.height = CGFloat(topDistance + 44 + 8)
                    
                    imageView.frame.size.height = CGFloat(topDistance1  + 44 + 8)
                    
                    PinkBox.addSubview(insideTable1);
                    self.resizeView(8);
                }

                
              })
            
            DispatchQueue.main.async(execute: {
                loadingStop()
            });
            
            
        }
    }
    
    func home(){
        
        
        
        rest.getPointTable({(json:JSON) -> () in
            DispatchQueue.main.sync(execute: {
                if json == 401 {
                    print("No Data Found")
                }else{
                    
                    print("hellojson\(json)")
                    self.pointsTable = json
                    
                    print("pointsTable\(self.pointsTable)")
                }
            })
            
        })
        
        
//        let thumbnail = thumbnailImage(frame: CGRect.zero)
//        rest.getapphomeimage({(json:JSON) -> () in
//            DispatchQueue.main.sync(execute: {
//                if json == 401 {
//                    print("No Data Found")
//                }else{
//                    print(json)
//                    self.getPicture = json
//                    thumbnail.thumbImage.hnk_setImageFromURL(rest.getImageSizeCache(self.getPicture["image"].stringValue))
//                    print("showshowshow\(self.getPicture)")
//                }
//            })
//            
//        })
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        checkCalendarAuthorizationStatus()
        GHomeController = self;
        
        self.setNavigationBarItem()
        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = false
        refreshControl.backgroundColor = lightBlueColor
        refreshControl.tintColor = PinkColor
        refreshControl.addTarget(self, action: #selector(HomeController.refresh(_:)), for: .valueChanged)
       
        scrollView.addSubview(refreshControl)
        loadingInit()
        home()
        callhome()
       
       
    }
    
   
    
    func callhome() {
        self.view.addSubview(loaderGlo)
        rest.getHome(homeLoaded)
    }
    
    func refresh(_ refreshControl: UIRefreshControl) {
        // Do your job, when done:
        callhome()
        home()
        refreshControl.endRefreshing()
    }
    
    func resizeView(_ offset:CGFloat)
    {
        self.verticalLayout.layoutSubviews()
        self.scrollView.contentSize = CGSize(width: self.verticalLayout.frame.width, height: self.verticalLayout.frame.height + offset)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    
    
    
    /*
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
    }
    */
    
}
