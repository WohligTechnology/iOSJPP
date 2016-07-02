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
let lightBlueColor = UIColor(red: 196/255, green: 240/255, blue: 255/255, alpha: 1)
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
        
        players.append(Player(name: "Ajay Kumar", achieve: "School u19 (Gold) 4-10-2011 to 8-10-2011, Junior National Championship 27-12-2011 to 30-12-2011  (Bronze), Senior National Championship 24-11-2015 to 29-11-2015 (Bronze), Federation cup 1-5-2016 to 5-5-2016 (Gold)", tour: "", age: "22", type: "Raider", state: "Haryana", jerseyNo: "33", image: "ajay_kumar.png"))
        players.append(Player(name: "Amit Hooda", achieve: "2015-16 Pro Kabaddi League (Patna Pirates), 2010-16 Senior State Campionship, 2015 Senior Nationals, 2016 Departmental Nationals, 2016 Federation Cup", tour: "2016 Pro Kabaddi League (Gold), 2015 Senior Nationals (Bronze), 2016 Federation Cup (Silver), 2016 Departmental Nationals (Gold), 2012,14,16 Senior State Championship (Silver), 2013 Senior State Championship (Gold)", age: "20", type: "Defender", state: "Haryana", jerseyNo: "10", image: "p26.jpg"))
        players.append(Player(name: "Amit Nagar", achieve: "2014-15 Junior National Games, 2015 U-19 School Games, 2016 Junior Asian Championship", tour: "2015 U-19 School Games(Bronze), 2016 Junior Asian Championship (Gold) ", age: "18", type: "Raider", state: "New Delhi", jerseyNo: "4", image: "p21.jpg"))
        //players.append(Player(name: "David Tsai", achieve: "2014 Pro Kabaddi League , 2015 Pro Kabaddi League ", tour: "2014 Pro Kabaddi League (Gold)", age: "26", type: "Defender", state: "Taiwan", jerseyNo: "20", image: "p19.jpg"))
        players.append(Player(name: "Jasvir Singh", achieve: "2004-2016 Senior Nationals, 2007,2009,2013 Indoor Asian Games, 2014 Asian Games, 2009-15 Departmental Nationals, 2014-16 Pro Kabaddi League(Jaipur Pink Panthers)", tour: "2014 Pro Kabaddi League (Gold), 2004,2013 Senior National Games (Gold), 2005,2010,2015 Senior Nationals (Silver), 2007 Senior Nationals (Bronze), 2007,2009,2013 Indoor Asian Games (Gold), 2014 Asian Games (Gold), 2013-14 Departmental Nationals (Gold), 2015 Departmental Nationals (Silver)", age: "32", type: "Raider", state: "Haryana", jerseyNo: "2", image: "p3.jpg"))
        players.append(Player(name: "Jawahar", achieve: "Silver medal in 45th Haryana state school tournament 56th National School Games 2010-11 held at Himachal Pradesh secure bronze medal, Participant 46th Haryana state school tournament 2011-12, Participate in Delhi state kabaddi championship 2012-13, Secure first position in Haryana state championship 2013-14, Silver medal in 61st senior national kabaddi championship 2013-14, Gold medal in 62nd senior national kabaddi championship 2014-15, Bronze medal in 35th national games Kerala 2015", tour: "", age: "21", type: "All Rounder", state: "Haryana", jerseyNo: "111", image: "jawahar.png"))
        players.append(Player(name: "Lo Chia Wei", achieve: "2016 Pro Kabaddi League (Dabang Delhi K.C.)", tour: "", age: "26", type: "Raider", state: "New Taipei City", jerseyNo: "9", image: "lo_chia.png"))
        players.append(Player(name: "Mahipal Narwal ", achieve: "2011-14 Senior National Championship, 2014-2015 Pro Kabaddi League(Puneri Paltan) , 2016 Pro Kabaddi League(Patna Pirates), 2016 Pro Kabaddi League (Jaipur Pink Panthers), 2010 All India University , 2010 National Games ", tour: "2016 Pro Kabaddi League(Gold), 2013  Senior National Championship(gold), 2011 Senior Nationals Campionship (Silver), 2010 All India University (Gold), 2010 National Games (Gold).", age: "24", type: "Raider", state: "Haryana", jerseyNo: "12", image: "p25.jpg"))
        //players.append(Player(name: "Masayuki Shimokawa", achieve: "2014-16 Pro Kabaddi League (U Mumba), 2015 Japan National Games", tour: "2016 Star Sports Pro Kabaddi Season 3 runners up (U Mumba), 2015 Star Sports Pro Kabaddi Champions (U Mumba), 2015 Japan National Games(Gold)", age: "27", type: "Raider", state: "Tokya", jerseyNo: "-", image: "p20.jpg"))
        players.append(Player(name: "Parveen Narwal", achieve: "2009 Rural State Championship, 2009 U-17 National Games, 2010 U-19 School Games, 2012,2015 Senior State Championship", tour: "2009 Rural State Championship(Gold), 2009 U-17 National Games (Silver), 2010 U-19 School Games(Gold), 2012,2015 Senior State Championship(Gold) ", age: "20", type: "All rounder", state: "Haryana", jerseyNo: "7", image: "p23.jpg"))
        players.append(Player(name: "Parvesh Malik", achieve: "2015-16 All India University, 2016 Junior National Games, 2016 Junior Asian Championship", tour: "2015-16 All India Univerisity(gold),2016 Junior Asian Championship(gold), 2015 Junior National Games(Gold)", age: "19", type: "Defender", state: "Haryana", jerseyNo: "6", image: "p22.jpg"))
        players.append(Player(name: "Rajesh Narwal", achieve: "2007 Federation Cup, 2007 U-17 School Games, 2004 Junior Rural National Championship, 2006-2015 Senior State Championship, 2008 All India University, 2014 - Beach Asian Games, 2014-16 - Super National Games , 2010-16 - Dept. Nationals Games , 2015 - National Games , 2016 - Federations Cup , 2014-16 Pro Kabaddi League(Jaipur Pink Panthers)", tour: "2008 All India University (Gold), 2010 National Games(Bronze), 2004 Junior Rural National Championship (Gold), 2007 U-17 School Games(Gold), 2006-2009 Senior State Championship (Gold), 2012-15 Senior State Championship (Gold)2014 - Beach Asian Games(Gold) , 2014-15 Super Nationals Games (Silver) , 2016 Super National Games (Bronze) , 2011-2016 Departmental Nationals Games (Gold), 2015 Nationals Games (Gold) , 2016 Federations Cup (Silver) , 2014 Pro Kabaddi Leaugue (Gold)", age: "25", type: "All rounder", state: "Haryana", jerseyNo: "11", image: "p6.jpg"))
        players.append(Player(name: "Ran Singh", achieve: "2014-2016 Pro Kabaddi League (Jaipur Pink Panthers),2002-08 Senior National Games, 2014 Senior National Games, 2014 Departmental National Games, 2008-2011 All India Police Tournament", tour: "2014 Pro Kabaddi League (Gold), 2007 Senior National Games (Silver), 2006 Senior National Games (Bronze), 2008,2011 All India Police Tournament (Gold), 2009,2010 All India Police Tournament (Bronze), 2014 Departmental National Tournament (Silver)", age: "29", type: "All rounder", state: "Punjab", jerseyNo: "13", image: "p8.jpg"))
        
        players.append(Player(name: "Rohit Rana", achieve: "2006-2010 Senior Nationals, 2010-14 Beach Kabaddi, 2011-16 Departmental Nationals, 2014-16 Pro Kabaddi League(Jaipur Pink Panthers), 2015 National Games.", tour: "2014 Pro Kabaddi League (Gold) , 2015 National Games (Bronze), 2011-2014 Departmental Nationals (Gold), ", age: "28", type: "Defender", state: "Himachal P.", jerseyNo: "5", image: "p10.jpg"))
        
        players.append(Player(name: "Shabeer Bapu Sharfudheen", achieve: "2004-2006 All India University, 2013-16 Departmental National Games, 2009-16 Senior National Games, 2015 National Games , 2014-16 Pro Kabaddi League", tour: "2016 Pro Kabaddi League (Silver), 2015 Pro Kabaddi League(Gold), 2014 Pro Kabaddi League(Silver),2015 National Games(silver),2014 Departmental National Games (Gold)", age: "29", type: "Raider", state: "Kerela", jerseyNo: "3", image: "p24.jpg"))
        
        players.append(Player(name: "Shrikant  Tewthia", achieve: "2007 Junior Nationals, 2009 All India University, 2011 National Championship, 2013 Senior Nationals, 2015 Senior Nationals, 2016 Federations Cup, 2014-15 Pro Kabaddi League (Dabang Delhi), 2016 Pro Kabaddi League (Bengluru Bulls), 2016 Pro Kabaddi League (Jaipur Pink Panthers)", tour: "2009 All India University(Silver),2013 Senior Nationals(Bronze), 2015 Senior Nationals (Gold), 2016 Federations Cup(Bronze)", age: "23", type: "All rounder", state: "Uttar Pradesh", jerseyNo: "8", image: "p27.jpg"))
        
        players.append(Player(name: "Tushar Patil", achieve: "2011-12 U-19 School National Games, 2016 Departmental Nationals, 2013 Junior National Championship,2015 University Games", tour: "2016 Star Sports Pro Kabaddi semi-finalist team (Puneri Paltan), 2011 U-19 School National Games (Gold), 2012 U-19 School National Games (Silver)", age: "21", type: "All rounder", state: "Maharashtra", jerseyNo: "99", image: "p28.jpg"))



        
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

