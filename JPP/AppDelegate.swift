//
//  AppDelegate.swift
//  JPP
//
//  Created by Chintan Shah on 25/01/16.
//  Copyright © 2016 Wohlig Technology. All rights reserved.
//

import UIKit
import EventKitUI
let eventStore = EKEventStore()
var mediaUrl = "";
func createEvent(EventName:String, EventTime:NSDate) {
    let event = EKEvent(eventStore: eventStore)
    event.title = EventName
    event.startDate = EventTime
    event.endDate = EventTime.dateByAddingTimeInterval(60 * 60)
    event.calendar = eventStore.defaultCalendarForNewEvents
    do {
        try eventStore.saveEvent(event, span: .ThisEvent)
//        print("Working Fine Event Stored");
    } catch {
//        print("Bad things happened")
    }
}
var SaveCalender = 1;
var galleryID = "0";
var videoIDGlo = "0";
var galleryImage = "0";
var newsImage = "";
var newsTitle = "";
var newsDate = "";
var newsContent = "";
var GalleryInsideTitle = ""
var playerIndex = 0;
var isGalWal = 0;
var players:[Player] = []
var loaderGlo:loading!
var bounds = UIScreen.mainScreen().bounds
var widthGlo = bounds.size.width
var heightGlo = bounds.size.height

func loadingInit() {
    loaderGlo = loading(frame: CGRectMake(0,0,widthGlo,heightGlo-44) )
    loaderGlo.alpha = 0
    loadingStart()
}

func loadingStart() {
    loaderGlo.frame.origin = CGPoint(x: 0, y: 0)
    loaderGlo.alpha = 1

}
func loadingStop() {
    loaderGlo.frame.origin = CGPoint(x: 0, y: heightGlo+44)
    loaderGlo.alpha = 0

//    loaderGlo.animation.moveY(heightGlo-44).makeOpacity(0.3).animateWithCompletion(0.5, {
//        loaderGlo.frame.origin = CGPoint(x: 0, y: heightGlo-44)
//    })
}



let BlueColor = UIColor(red: 10/255, green: 124/255, blue: 161/255, alpha: 1)
let PinkColor = UIColor(red: 238/255, green: 74/255, blue: 155/255, alpha: 1)
let rest = RestApi();

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate,PushNotificationDelegate {

    var window: UIWindow?
    
    internal func createMenuView() {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        var nvc: UINavigationController!
        
        let leftViewController = storyboard.instantiateViewControllerWithIdentifier("sideMenu") as!SideMenuController
        
        let mainViewController = storyboard.instantiateViewControllerWithIdentifier("home") as! HomeController
        
        nvc = UINavigationController(rootViewController: mainViewController)
        
        leftViewController.mainViewController = nvc
        
        let slideMenuController = SlideMenuController(mainViewController:nvc, leftMenuViewController: leftViewController)
        
        self.window?.backgroundColor = UIColor(red: 236.0, green: 238.0, blue: 241.0, alpha: 1.0)
        self.window?.rootViewController = slideMenuController
        self.window?.makeKeyAndVisible()
        
    }


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        createMenuView()
        
        players.append(Player(name: "NAVNEET GAUTAM", achieve: "Pro-kabaddi (2014)- 1st Position, Arjun Awardee - (2007), Asian Games (2006-10-14) - 1st Position, World Cup (2004) (2007) - 1st Position, Indoor Asian Game (2007)(2009) - 1st Position", tour: "Pro-Kabaddi (2015-2014), Asian Games (2006 -10 -14), WorldCup (2004)(2007), Indoor Asian Games (2007))(2009) ", age: "32", type: "DEFENDER", nativePlace: "Jaipur", jerseyNo: "07", image: "navneet.jpg"))
        
        players.append(Player(name: "RAJU LAL CHOUDHARY", achieve: "Pro-kabaddi (2014)- 1st Position,National Games (2011)-1st Position, Senior National (2015) - 3rd Position", tour: "Pro-Kabaddi (2015-2014)National Games (2011), Senior National Games (2015), All India Police Games (2008-15)", age: "26", type: "DEFENDER", nativePlace: "Jaipur", jerseyNo: "12", image: "raju.jpg"))
        
        players.append(Player(name: "JASVIR SINGH", achieve: "Pro-kabaddi (2014)- 1st Position,Senior National (2013) - 1st Position, National Game (2011)- 1st Position, Indoor Asian Game (2013) - 1st Position, Asian Game (2014) - 1st Position.", tour: "Pro-Kabaddi (2015-2014),Senior National (2013), National Game (2011), Indoor Asian Game (2013), Asian Game (2014)", age: "31", type: "RAIDER", nativePlace: "Panipat", jerseyNo: "02", image: "jasvir.jpg"))
        
        players.append(Player(name: "RAJESH NARWAL", achieve: "Pro-kabaddi (2014)- 1st Position,Beach Asian Games (2014) - 3rd Position, National Games (2015) - 1st Position, (2011) - 3rd Position, Senior National (2013-15) - 2nd Position", tour: "Pro-Kabaddi (2015-2014),Beach Asian Game (2014), National Games (2011) (2015), Senior National (2008-15), ", age: "25", type: "ALL ROUNDER", nativePlace: "Sonipat", jerseyNo: "11", image: "rajesh.jpg"))
        
        players.append(Player(name: "RAN SINGH", achieve: "Pro-kabaddi (2014)- 1st Position,Senior National (2007) - 2nd Position, Senior National (2006) - 3rd Position, All India Police Tournament (2008) (2011) - 1st Position, All India Police Tournament (2009-10) - 3rd Position, Dept. National Tournament (2014) - 2nd Position", tour: "Pro-Kabaddi (2015-2014),Senior National (2002-08), Senior National (2014), Dept. National Tournament  (2014), All India Police Tournanment (2008-11)", age: "28", type: "ALL ROUNDER", nativePlace: "Sangrur", jerseyNo: "33", image: "ran_singh.jpg"))
        
        players.append(Player(name: "GANGADHARI MALLESH", achieve: "Pro-kabaddi (2014)- 1st Position,School Nationals(2008) -3rd Position", tour: "Pro-Kabaddi (2015-2014),Senior National (2015-2012),Junior National Championship (2012-2009), School Nationals(2009-2009)", age: "22", type: "ALL ROUNDER", nativePlace: "Choutapally", jerseyNo: "10", image: "gangadhari.jpg"))
        
        players.append(Player(name: "ROHIT RANA", achieve: "Pro-kabaddi (2014)- 1st Position,National Games (2014) - 3rd Position, Dept. National (2011-14) - 1st Postion", tour: "Pro-Kabaddi (2015-2014), National Games (2010-15), Senior National  (2010-14), Dept National (2011-14)", age: "27", type: "DEFENDER", nativePlace: "Dharmshala", jerseyNo: "05", image: "rohit_rana.jpg"))
        
        players.append(Player(name: "SAMARJEET SINGH", achieve: "Pro-kabaddi (2014)- 1st Position,Asian Games (2010) - 1st Position , Indoor Asian Games (2010) - 1st Postion, Safe Games (2010) -1st Position, Indoor Asian Games (2013)", tour: "Pro-Kabaddi (2015-2014),Asian Games (2010),Indoor Asian Games (2010), Safe Games (2010), Indoor Asian Games (2013)", age: "29", type: "ALL ROUNDER", nativePlace: "Khedi Daulatpur", jerseyNo: "77", image: "samarjeet.jpg"))
        
        players.append(Player(name: "SANJAY SHRESTHA", achieve: "Pro-kabaddi (2014)- 1st Position", tour: "Pro-Kabaddi (2015-2014),World Cup ( , 9th Safe game, 10th Safe Game, 11th Safe Game ", age: "31", type: "ALL ROUNDER", nativePlace: "Dhanusha", jerseyNo: "04", image: "sanjay.jpg"))
        
        players.append(Player(name: "SONU NARWAL", achieve: "All India Police (2009) - 1st Position, Asian Championship (2005) - 1st Position , Asian Games (2010)- 1st Position, Beach Asian Games (2011) - 2nd Position.", tour: "Pro-Kabaddi (2015),Senior National Game (2008-09), Asian Championship(2005), Asian Game (2010), Beach Asian Game(2011), All India Police Kabaddi (2009-10-11)", age: "29", type: "RAIDER", nativePlace: "Sonipat", jerseyNo: "22", image: "sonu.jpg"))
        
        players.append(Player(name: "KULDEEP SINGH", achieve: "National (2012-13) - 1st Position, National Game (2011) - 3rd Position, Dept. National (2008)- 2nd Position, (2009)- 1st Position.", tour: "Pro-Kabaddi (2015),National Game (2011), National (2008-15), Dept. National (2008-09)", age: "23", type: "ALL ROUNDER", nativePlace: "Sonipat", jerseyNo: "08", image: "kuldeep.jpg"))
        
        players.append(Player(name: "C. ARUN", achieve: "All India University (2012) - 1st Position.", tour: "Pro-Kabaddi (2015),All India University (2012), Senior National (2015)", age: "22", type: "DEFENDER", nativePlace: "Thiruvarur", jerseyNo: "03", image: "carun.jpg"))
        
        players.append(Player(name: "ANIL PATIL", achieve: "Senior National(2007)-1st Position,Senior National (2011, 2012)- 3rd Position ,Departmental National (2014)- 3rd Position,", tour: "Senior National- (2007-2009,2011-2012), Departmental National (2006,2010,2013-2015)", age: "33", type: "ALL ROUNDER", nativePlace: "Mumbai", jerseyNo: "01", image: "anil.jpg"))
        
        players.append(Player(name: "ROHIT KUMAR PRAJAPAT", achieve: "Sub Junior National Under 16  (2012) - 2nd Position, Under 19 School national (2012)- 3rd PositionJunior National Federation Cup (2014)- 3rd Position, Senior West Zone (2015) - 3rd Position", tour: "Pro-Kabaddi (2015), Under 20 Junior National (2012-14), All India University kabbadi tournament(2014), Under 19 School National(2012), Under 16 Sub Juniour National(2011), Junior National Federation cup (2014), Senior West Zone (2015)", age: "19", type: "RAIDER", nativePlace: "Jaipur", jerseyNo: "14", image: "rohit_kumar.jpg"))
        
        players.append(Player(name: "JAGDEESHA K.K", achieve: "Departmental National Campionship (2014-2012) - 2nd Position, Departmental National Campionship (2006-2002)- 1st Position, Asian Cup (2002)- 1st Position, Senior National (2005-2003) -1st Position, Senior Federation Cup (2003)- 1st Position", tour: "Departmental National Campionship- (2015-1999),Senior National (2013-1999),National Games (2003-1999), Senior Federation Cup (2006-2003), Asian Cup(2002)", age: "", type: "DEFENDER", nativePlace: "Koipaddy", jerseyNo: "09", image: "jagdeesha.jpg"))
        
        players.append(Player(name: "SATISH KUMAR", achieve: "Senior National (2007,2008,2011)- 1st Positon, Senior National (2015)- 2nd Position,Senior Federation (2006) - 3rd Position, Beach Kabaddi National Campionship (2008) - 1st Position", tour: "Senior National -(2007,2008,2011,2015),Senior Federation Cup (2006), Beach Kabaddi National Campionship(2008)", age: "31", type: "RAIDER", nativePlace: "Rohera", jerseyNo: "06", image: "satish.jpg"))
        
        players.append(Player(name: "MOHAMMAD MAGHSOUDLOU", achieve: "Asian Indoor Kabaddi Games Incheon (2014)-2nd Position, Asian Beach Kabaddi Games China (2012)-1st Position, National Kabaddi Championship (2008,2009,2010,2011,2012)-1st Position, National Kabaddi Premier League (2006,2007)-1st Position", tour: "Asian Game 2010, Beach Game haiyang 2012, Indoor Game 2013, Asian Game 2014, Prokabaddi Season 2 & 3", age: "25", type: "ALL ROUNDER", nativePlace: "Gorgan", jerseyNo: "23", image: "mohammad.png"))
        
        players.append(Player(name: "WEI YANG TSAI", achieve: "National Game: Presidential Cup - Gold Medal 2015 November, Friendly game against Korea, Japan, Thailand - Silver Medal 2015 November, Senator Cup - Gold Medal 2015 April, College Games - Gold Medal 2015 February, Prokabaddi Season 1", tour: "No information currently available", age: "26", type: "ALL ROUNDER", nativePlace: "Taiwan", jerseyNo: "20", image: "david.png"))
        
        
        PushNotificationManager.pushManager().delegate = self
        PushNotificationManager.pushManager().handlePushReceived(launchOptions)
        PushNotificationManager.pushManager().sendAppOpen()
        PushNotificationManager.pushManager().registerForPushNotifications()
        return true
    }
    
    func application(application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: NSData) {
        PushNotificationManager.pushManager().handlePushRegistration(deviceToken)
    }
    
    func application(application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: NSError) {
        PushNotificationManager.pushManager().handlePushRegistrationFailure(error)
    }
    
    func application(application: UIApplication, didReceiveRemoteNotification userInfo: [NSObject : AnyObject]) {
        PushNotificationManager.pushManager().handlePushReceived(userInfo)
    }
    
    func onPushAccepted(pushManager: PushNotificationManager!, withNotification pushNotification: [NSObject : AnyObject]!, onStart: Bool) {
        print("Push notification accepted: \(pushNotification)");
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

