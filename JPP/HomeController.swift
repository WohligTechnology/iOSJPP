//
//  HomeController.swift
//  JPP
//
//  Created by Chintan Shah on 26/01/16.
//  Copyright © 2016 Wohlig Technology. All rights reserved.
//

import UIKit
import SwiftyJSON
import DKChainableAnimationKit
import EventKitUI

var GHomeController:HomeController!;
let refreshControl = UIRefreshControl()

class HomeController: UIViewController, UIGestureRecognizerDelegate {

  
    
    func checkCalendarAuthorizationStatus() {
        let status = EKEventStore.authorizationStatusForEntityType(EKEntityType.Event)
        
        switch (status) {
        case EKAuthorizationStatus.NotDetermined:
            requestAccessToCalendar()
        case EKAuthorizationStatus.Authorized:
            print("Authorised");
        case EKAuthorizationStatus.Restricted:
            print("Restricted");
        case EKAuthorizationStatus.Denied:
            print("Denied");
        }
    }
    
    func requestAccessToCalendar() {
        eventStore.requestAccessToEntityType(EKEntityType.Event, completion: {
            (accessGranted: Bool, error: NSError?) in
            
            if accessGranted == true {
                dispatch_async(dispatch_get_main_queue(), {
                    print("Access Graned");
                    SaveCalender = 1;
                })
            } else {
                dispatch_async(dispatch_get_main_queue(), {
                    SaveCalender = 0;
                    print("Access not Graned");
                })
            }
        })
    }


    
    func setInterval(interval:NSTimeInterval, block:()->Void) -> NSTimer {
        return NSTimer.scheduledTimerWithTimeInterval(interval, target: NSBlockOperation(block: block), selector: "main", userInfo: nil, repeats: true)
    }
    
    var newsController:UIViewController!
    var galleryController: UIViewController!
    var fancornerController: UIViewController!
    var i = 0;
    @IBOutlet weak var scrollView: UIScrollView!
    var verticalLayout : VerticalLayout!
    
    
    var diffMonth = 0
    var diffDay = 0
    var diffHour = 0
    var diffMin = 0
    
    let font = UIFont(name: "Oswald-Regular", size: 14.0)
    let blue = UIColor(red: 77/255, green: 203/255, blue: 244/255, alpha: 1)
    
    var refeshController = UIRefreshControl()
    
    var HomeJSON = JSON(1)
    
    func handleTap(sender: UITapGestureRecognizer? = nil) {
        
        mediaUrl = HomeJSON["news"]["content"].string!
        
        let newsController = storyboard!.instantiateViewControllerWithIdentifier("news") as! NewsController
        self.newsController = UINavigationController(rootViewController: newsController)
        
         self.slideMenuController()?.changeMainViewController(self.newsController, close: true)
        
    }
    
    func jpptvTap(sender: UITapGestureRecognizer? = nil) {
        let galleryController = storyboard!.instantiateViewControllerWithIdentifier("gallery") as! GalleryController
        self.galleryController = UINavigationController(rootViewController: galleryController)
        self.slideMenuController()?.changeMainViewController(self.galleryController, close: true)
        galleryController.activeGal = 1
    }
    
    func signupTap(sender: UITapGestureRecognizer? = nil) {
        let fancornerController = storyboard!.instantiateViewControllerWithIdentifier("fanCorner") as! FanCornerController
        self.fancornerController = UINavigationController(rootViewController: fancornerController)
        self.slideMenuController()?.changeMainViewController(self.fancornerController, close: true)
    }
    
    func showScore(json:JSON) {
        let updates = doneMatch(frame: CGRectMake(8,8,self.verticalLayout.frame.width-16,300));
        //updates.teamOneScore.font = UIFont(name: "Kenyan-Coffee", size: 45)
        //updates.teamTwoScore.font = UIFont(name: "Kenyan-Coffee", size: 45)
        //updates.teamOneScore.layer.borderWidth = 3
        //updates.teamOneScore.layer.borderColor = UIColor.whiteColor().CGColor
        //updates.teamTwoScore.layer.borderWidth = 3
        //updates.teamTwoScore.layer.borderColor = UIColor.whiteColor().CGColor
        
        updates.team1image.image = UIImage(named: "t" + json["latestMatch"]["team1id"].string! + ".png")
        updates.team2image.image = UIImage(named: "t" + json["latestMatch"]["team2id"].string! + ".png")
        if json["latestMatch"]["score1"]=="" {
            updates.teamOneScore.text = "0"
        }else{
            updates.teamOneScore.text = json["latestMatch"]["score1"].string
        }
        if json["latestMatch"]["score2"]=="" {
            updates.teamTwoScore.text = "0"
        }else{
            updates.teamTwoScore.text = json["latestMatch"]["score2"].string
        }
        
        updates.fulltimeText.text = json["latestMatch"]["totalmatchtime"].string!
        
        switch json["latestMatch"]["team1"].string! {
        case "Jaipur Pink Panthers":
            updates.teamOneScore.tintColor = UIColor(red: 231/255, green: 45/255, blue: 137/255, alpha: 1) //E72D89
        case "Bengaluru Bulls":
            updates.teamOneScore.textColor = UIColor(red: 176/255, green: 29/255, blue: 33/255, alpha: 1) //b01d21
        case "Bengal Warriors":
            updates.teamOneScore.textColor = UIColor(red: 242/255, green: 103/255, blue: 36/255, alpha: 1) //f26724
        case "Dabang Delhi":
            updates.teamOneScore.textColor = UIColor(red: 217/255, green: 31/255, blue: 45/255, alpha: 1) //d91f2d
        case "Patna Pirates":
            updates.teamOneScore.textColor = UIColor(red: 10/255, green: 68/255, blue: 54/255, alpha: 1) //0a4436
        case "Puneri Patlan":
            updates.teamOneScore.textColor = UIColor(red: 240/255, green: 78/255, blue: 35/255, alpha: 1) //f04e23
        case "Telgu Titans":
            updates.teamOneScore.textColor = UIColor(red: 218/255, green: 33/255, blue: 49/255, alpha: 1) //da2131
        case "U Mumba":
            updates.teamOneScore.textColor = UIColor(red: 241/255, green: 89/255, blue: 34/255, alpha: 1) //f15922
        default:
            updates.teamOneScore.textColor = UIColor(red: 231/255, green: 45/255, blue: 137/255, alpha: 1) //E72D89
        }
        
        switch json["latestMatch"]["team2"].string! {
        case "Jaipur Pink Panthers":
            updates.teamTwoScore.textColor = UIColor(red: 231/255, green: 45/255, blue: 137/255, alpha: 1) //E72D89
            print("Jaipur Pink Panthers")
        case "Bengaluru Bulls":
            updates.teamTwoScore.textColor = UIColor(red: 176/255, green: 29/255, blue: 33/255, alpha: 1) //b01d21
            print("Bengaluru Bulls")
        case "Bengal Warriors":
            updates.teamTwoScore.textColor = UIColor(red: 242/255, green: 103/255, blue: 36/255, alpha: 1) //f26724
        case "Dabang Delhi":
            updates.teamTwoScore.textColor = UIColor(red: 217/255, green: 31/255, blue: 45/255, alpha: 1) //d91f2d
        case "Patna Pirates":
            updates.teamTwoScore.textColor = UIColor(red: 10/255, green: 68/255, blue: 54/255, alpha: 1) //0a4436
        case "Puneri Patlan":
            updates.teamTwoScore.textColor = UIColor(red: 240/255, green: 78/255, blue: 35/255, alpha: 1) //f04e23
        case "Telgu Titans":
            updates.teamTwoScore.textColor = UIColor(red: 218/255, green: 33/255, blue: 49/255, alpha: 1) //da2131
        case "U Mumba":
            updates.teamTwoScore.textColor = UIColor(red: 241/255, green: 89/255, blue: 34/255, alpha: 1) //f15922
        default:
            updates.teamTwoScore.textColor = UIColor(red: 231/255, green: 45/255, blue: 137/255, alpha: 1) //E72D89
        }
        
        self.verticalLayout.addSubview(updates)
    }
    
    func homeLoaded(json:JSON) {
        print(json)
        if(json == 1)
        {
            let alertController = UIAlertController(title: "No Connection", message:
                "Please check your internet connection", preferredStyle: UIAlertControllerStyle.Alert)
            alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.Default,handler: nil))
            
            self.presentViewController(alertController, animated: true, completion: nil)
        }
        else
        {   self.i += 1
            HomeJSON = json;
            dispatch_async(dispatch_get_main_queue(), {
                if(self.i>1)
                {
                    self.verticalLayout.removeFromSuperview()
                }
                self.verticalLayout = VerticalLayout(width: self.view.frame.width);
                self.scrollView.insertSubview(self.verticalLayout, atIndex: 0)
                
                let dateFormatter = NSDateFormatter()
                dateFormatter.dateFormat = "dd MMM yyyy, HH:mm"
                
                let date = NSDate()
                let calendar = NSCalendar.currentCalendar()
                let components = calendar.components([.Month, .Day, .Hour, .Minute, .Second], fromDate: date)
                let month = components.month
                let day = components.day
                let hour = components.hour
                let minutes = components.minute
                
                let datematch = dateFormatter.dateFromString(json["latestMatch"]["starttimedate"].string!)!
                let unitFlags: NSCalendarUnit = [.Month, .Day, .Hour, .Minute, .Second]
                let componentsmatch = NSCalendar.currentCalendar().components(unitFlags, fromDate: datematch)
                print(componentsmatch)
                print(components)
                
                let matchMonth = componentsmatch.month
                let matchDay = componentsmatch.day
                let matchHour = componentsmatch.hour
                let matchMins = componentsmatch.minute
                
                self.diffMonth = matchMonth - month
                self.diffDay = matchDay - day
                self.diffHour = matchHour - hour
                self.diffMin = matchMins - minutes
                let range = calendar.rangeOfUnit(.Day, inUnit: .Month, forDate: date)
                range.length
                
                if(self.diffMin < 0) { self.diffHour = self.diffHour - 1;  self.diffMin = self.diffMin + 60 }
                
                if(self.diffHour < 0) { self.diffDay = self.diffDay - 1; self.diffHour = self.diffHour + 24 }
                
                if(self.diffDay < 0) { self.diffMonth = self.diffMonth - 1; self.diffDay = self.diffDay + range.length }


                print("in diff min min")
                print(self.diffMin)
                print(self.diffMonth)
                
                if(json["latestMatch"]["score2"] == "" && self.diffMin > 0 && self.diffHour >= 0 && self.diffDay >= 0 && self.diffMonth >= 0) {
                    
                    let updates = seasonOpener(frame: CGRectMake(8,8,self.verticalLayout.frame.width-16,380))
                    
                    
                    let dateFormatter = NSDateFormatter()
                    dateFormatter.dateFormat = "dd MMM yyyy, HH:mm"
                    updates.EventTimeTop = dateFormatter.dateFromString(json["latestMatch"]["starttimedate"].string!)!
                    updates.EventNameTop = json["latestMatch"]["team1"].string! + " VS " + json["latestMatch"]["team2"].string!;
                    
                    
                    self.verticalLayout.addSubview(updates)
                    //updates.addToCalender.hidden = true
                    updates.team1Image.image = UIImage(named: "t" + json["latestMatch"]["team1id"].string! + ".png")
                    updates.team2Image.image = UIImage(named: "t" + json["latestMatch"]["team2id"].string! + ".png")
                    updates.matchTime.text = json["latestMatch"]["starttimedate"].string
                    updates.matchVenue.text = json["latestMatch"]["stadium"].string
                    
                    updates.trapLabel.text = "NEXT MATCH"
                    
                    let date = NSDate()
                    let calendar = NSCalendar.currentCalendar()
                    let components = calendar.components([.Month, .Day, .Hour, .Minute, .Second], fromDate: date)
                    let month = components.month
                    let day = components.day
                    let hour = components.hour
                    let minutes = components.minute

                    
                    let range = calendar.rangeOfUnit(.Day, inUnit: .Month, forDate: date)
                    range.length
                    
                    let datematch = dateFormatter.dateFromString(json["latestMatch"]["starttimedate"].string!)!
                    let unitFlags: NSCalendarUnit = [.Month, .Day, .Hour, .Minute, .Second]
                    let componentsmatch = NSCalendar.currentCalendar().components(unitFlags, fromDate: datematch)
                    
                    let matchMonth = componentsmatch.month
                    let matchDay = componentsmatch.day
                    let matchHour = componentsmatch.hour
                    let matchMins = componentsmatch.minute
                    
                    self.diffMonth = matchMonth - month
                    self.diffDay = matchDay - day
                    self.diffHour = matchHour - hour
                    self.diffMin = matchMins - minutes
                    
                    self.setInterval(10, block: { () -> Void in
                        
                        let date = NSDate()
                        let calendar = NSCalendar.currentCalendar()
                        let components = calendar.components([.Month, .Day, .Hour, .Minute, .Second], fromDate: date)
                        let month = components.month
                        let day = components.day
                        let hour = components.hour
                        let minutes = components.minute
                    
                        
                        var diffMonth = matchMonth - month
                        var diffDay = matchDay - day
                        var diffHour = matchHour - hour
                        var diffMin = matchMins - minutes
                        
                        if(diffMin < 0) { diffHour = diffHour - 1;  diffMin = diffMin + 60 }
                        
                        if(diffHour < 0) { diffDay = diffDay - 1; diffHour = diffHour + 24 }
                        
                        if(diffDay < 0) { diffMonth = diffMonth - 1; diffDay = diffDay + range.length }
                        
                        //print(diffDay)
                        //print(diffHour)
                        //print(diffMin)
                        
                        updates.remainingMonths.text = String(diffMonth)
                        updates.remainingDays.text = String(diffDay)
                        updates.remainingHours.text = String(diffHour)
                        updates.remainingMins.text = String(diffMin)
                        if(diffMin <= 0 && diffHour <= 0 && diffDay <= 0){
                            //print("start match")
                            self.refresh(self.refeshController)
                        }else{
                            //print("still on")
//                            updates.removeFromSuperview()

                        }
                        
                    })
                    
                    if(self.diffMin < 0) { self.diffHour = self.diffHour - 1;  self.diffMin = self.diffMin + 60 }
                    
                    if(self.diffHour < 0) { self.diffDay = self.diffDay - 1; self.diffHour = self.diffHour + 24 }
                    
                    if(self.diffDay < 0) { self.diffMonth = self.diffMonth - 1; self.diffDay = self.diffDay + range.length }
                    
                    updates.remainingMonths.text = String(self.diffMonth)
                    updates.remainingDays.text = String(self.diffDay)
                    updates.remainingHours.text = String(self.diffHour)
                    updates.remainingMins.text = String(self.diffMin)
                    
                } else{
                    self.showScore(json)
                }
                
                
                
                if((json["news"]["id"].string) != nil) {
                    let newsBox = news(frame: CGRectMake(8,8,self.verticalLayout.frame.width-16,260) );
                    newsBox.newsDate.text = json["news"]["timestamp"].string
                    newsBox.newsSubTitle.text = json["news"]["name"].string
                    newsBox.newsDescription.text = json["news"]["content"].string

                    newsBox.newsImage.hnk_setImageFromURL(rest.getImageThumbCache(json["news"]["image"].string!))
                    let tap = UITapGestureRecognizer(target: self, action: Selector("handleTap:"))
                    tap.delegate = self
                    newsBox.addGestureRecognizer(tap)
                    self.verticalLayout.addSubview(newsBox);
                }
                
                // SIGN UP SECTION
                let signupsection = signupSection(frame: CGRectMake(8, 8, self.verticalLayout.frame.size.width - 16, 90))
                let sutap = UITapGestureRecognizer(target: self, action: Selector("signupTap:"))
                sutap.delegate = self
                signupsection.signupButton.addGestureRecognizer(sutap)
                self.verticalLayout.addSubview(signupsection)
                
                // JPP TV SECTION
                let tvsection = jpptv(frame: CGRectMake(8, 8, self.verticalLayout.frame.size.width - 16, 200))
                let tvtap = UITapGestureRecognizer(target: self, action: Selector("jpptvTap:"))
                tvtap.delegate = self
                tvsection.addGestureRecognizer(tvtap)
                self.verticalLayout.addSubview(tvsection)
                
                let teamTitle = team2(frame: CGRectMake(8,8,self.verticalLayout.frame.width-16,34) );
                self.verticalLayout.addSubview(teamTitle);
                
                let PinkBox = UIView(frame:CGRectMake(8,0,self.verticalLayout.frame.width-16,300));
                PinkBox.backgroundColor = UIColor(red: 77/255, green: 203/255, blue: 244/255, alpha: 1)
                self.verticalLayout.addSubview(PinkBox);
                
                let tableHeader = table(frame: CGRectMake(8,8,PinkBox.frame.width-16,44));
                
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
                
                tableHeader.tablePoint.font = self.font
                tableHeader.tablePoint.text = "PTS"
                
                
                PinkBox.addSubview(tableHeader)
                
                let topSpaceinPink = 8;
                let spacingPink = 3;
                
                for(var i = 0; i<json["points"].count; i++)
                {
                    
                    let topDistance = topSpaceinPink+spacingPink+((44+spacingPink)*(i+1));
                    
                    let insideTable = table(frame: CGRectMake(8,CGFloat(topDistance),PinkBox.frame.width-16,40));
                    
                    insideTable.tableNo.text = String(i+1)
                    
                    insideTable.tableTeam.text = json["points"][i]["name"].string
                    
                    insideTable.tablePlayed.text = json["points"][i]["played"].string
                    
                    insideTable.tableWon.text = json["points"][i]["wins"].string
                    
                    insideTable.tableLost.text = json["points"][i]["lost"].string
                    
                    insideTable.tablePoint.text = json["points"][i]["point"].string
                    
                    if (json["points"][i]["name"].string == "Jaipur Pink Panthers") {
                        insideTable.tableNo.font = self.font
                        insideTable.tableTeam.font = self.font
                        insideTable.tablePlayed.font = self.font
                        insideTable.tableWon.font = self.font
                        insideTable.tableLost.font = self.font
                        insideTable.tablePoint.font = self.font
                        
                        insideTable.tableNo.textColor = PinkColor
                        insideTable.tableTeam.textColor = PinkColor
                        insideTable.tablePlayed.textColor = PinkColor
                        insideTable.tableWon.textColor = PinkColor
                        insideTable.tableLost.textColor = PinkColor
                        insideTable.tablePoint.textColor = PinkColor
                        
                        insideTable.backgroundColor = UIColor(red: 77/255, green: 203/255, blue: 244/255, alpha: 1)
                    }
                    
                    PinkBox.frame.size.height = CGFloat(topDistance + 44 + 8)
                    
                    PinkBox.addSubview(insideTable);
                }
                self.resizeView(8);
                
            })
            
            dispatch_async(dispatch_get_main_queue(), {
                loadingStop()
            });
            
            
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        checkCalendarAuthorizationStatus()
        GHomeController = self;
        
        self.setNavigationBarItem()
        
        //refreshControl.addSubview(loaderView)
        refreshControl.backgroundColor = lightBlueColor
        refreshControl.tintColor = PinkColor
        refreshControl.addTarget(self, action: "refresh:", forControlEvents: .ValueChanged)
        scrollView.addSubview(refreshControl)
        
        loadingInit()
        callhome()
        
    }
    
    
    func callhome() {
        self.view.addSubview(loaderGlo)
        rest.getHome(homeLoaded)
    }
    
    func refresh(refreshControl: UIRefreshControl) {
        // Do your job, when done:
        callhome()
        refreshControl.endRefreshing()
    }
    
    func resizeView(offset:CGFloat)
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
