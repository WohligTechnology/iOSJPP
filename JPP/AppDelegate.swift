//
//  AppDelegate.swift
//  JPP
//
//  Created by Chintan Shah on 25/01/16.
//  Copyright © 2016 Wohlig Technology. All rights reserved.
//

import UIKit
import EventKitUI

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
    loaderGlo = loading(frame: CGRectMake(0,heightGlo-44,widthGlo,heightGlo-44) )
    loaderGlo.alpha = 0.0
    loadingStart()
}

func loadingStart() {
    loaderGlo.frame.origin = CGPoint(x: 0, y: heightGlo-44)
    loaderGlo.animation.moveY(-heightGlo+44).makeOpacity(1.0).animateWithCompletion(0.5, {
        loaderGlo.frame.origin = CGPoint(x: 0, y: 0)
    })
}
func loadingStop() {
    loaderGlo.frame.origin = CGPoint(x: 0, y: 0)
    loaderGlo.animation.moveY(heightGlo-44).makeOpacity(0.3).animateWithCompletion(0.5, {
        loaderGlo.frame.origin = CGPoint(x: 0, y: heightGlo-44)
    })
}



let BlueColor = UIColor(red: 10/255, green: 124/255, blue: 161/255, alpha: 1)
let PinkColor = UIColor(red: 238/255, green: 74/255, blue: 155/255, alpha: 1)
let rest = RestApi();

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

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
        
        players.append(Player(name: "Navneet Gautam", achieve: "Pro-kabaddi (2014)- 1st Position, Arjun Awardee - (2007), Asian Games (2006-10-14) - 1st Position, World Cup (2004) (2007) - 1st Position, Indoor Asian Game (2007)(2009) - 1st Position", tour: "Pro-Kabaddi (2015-2014), Asian Games (2006 -10 -14), WorldCup (2004)(2007), Indoor Asian Games (2007))(2009) ", age: "32", type: "Defender", nativePlace: "Jaipur", jerseyNo: "07", image: "navneet.jpg"))
        
        players.append(Player(name: "Raju Lal Choudhary", achieve: "Pro-kabaddi (2014)- 1st Position,National Games (2011)-1st Position, Senior National (2015) - 3rd Position", tour: "Pro-Kabaddi (2015-2014)National Games (2011), Senior National Games (2015), All India Police Games (2008-15)", age: "26", type: "Defender", nativePlace: "Jaipur", jerseyNo: "12", image: "raju.jpg"))
        
        players.append(Player(name: "Jasvir Singh", achieve: "Pro-kabaddi (2014)- 1st Position,Senior National (2013) - 1st Position, National Game (2011)- 1st Position, Indoor Asian Game (2013) - 1st Position, Asian Game (2014) - 1st Position.", tour: "Pro-Kabaddi (2015-2014),Senior National (2013), National Game (2011), Indoor Asian Game (2013), Asian Game (2014)", age: "31", type: "Raider", nativePlace: "Panipat", jerseyNo: "02", image: "jasvir.jpg"))
        
        players.append(Player(name: "Rajesh Narwal", achieve: "Pro-kabaddi (2014)- 1st Position,Beach Asian Games (2014) - 3rd Position, National Games (2015) - 1st Position, (2011) - 3rd Position, Senior National (2013-15) - 2nd Position", tour: "Pro-Kabaddi (2015-2014),Beach Asian Game (2014), National Games (2011) (2015), Senior National (2008-15), ", age: "25", type: "All Rounder", nativePlace: "Sonipat", jerseyNo: "11", image: "rajesh.jpg"))
        
        players.append(Player(name: "Ran Singh", achieve: "Pro-kabaddi (2014)- 1st Position,Senior National (2007) - 2nd Position, Senior National (2006) - 3rd Position, All India Police Tournament (2008) (2011) - 1st Position, All India Police Tournament (2009-10) - 3rd Position, Dept. National Tournament (2014) - 2nd Position", tour: "Pro-Kabaddi (2015-2014),Senior National (2002-08), Senior National (2014), Dept. National Tournament  (2014), All India Police Tournanment (2008-11)", age: "28", type: "All Rounder", nativePlace: "Sangrur", jerseyNo: "33", image: "ran_singh.jpg"))
        
        players.append(Player(name: "Gangadhari Mallesh", achieve: "Pro-kabaddi (2014)- 1st Position,School Nationals(2008) -3rd Position", tour: "Pro-Kabaddi (2015-2014),Senior National (2015-2012),Junior National Championship (2012-2009), School Nationals(2009-2009)", age: "22", type: "All Rounder", nativePlace: "Choutapally", jerseyNo: "10", image: "gangadhari.jpg"))
        
        players.append(Player(name: "Rohit Rana", achieve: "Pro-kabaddi (2014)- 1st Position,National Games (2014) - 3rd Position, Dept. National (2011-14) - 1st Postion", tour: "Pro-Kabaddi (2015-2014), National Games (2010-15), Senior National  (2010-14), Dept National (2011-14)", age: "27", type: "Defender", nativePlace: "Dharmshala", jerseyNo: "05", image: "rohit_rana.jpg"))
        
        players.append(Player(name: "Samarjeet Singh", achieve: "Pro-kabaddi (2014)- 1st Position,Asian Games (2010) - 1st Position , Indoor Asian Games (2010) - 1st Postion, Safe Games (2010) -1st Position, Indoor Asian Games (2013)", tour: "Pro-Kabaddi (2015-2014),Asian Games (2010),Indoor Asian Games (2010), Safe Games (2010), Indoor Asian Games (2013)", age: "29", type: "All Rounder", nativePlace: "Khedi Daulatpur", jerseyNo: "77", image: "samarjeet.jpg"))
        
        players.append(Player(name: "Sanjay Shrestha", achieve: "Pro-kabaddi (2014)- 1st Position", tour: "Pro-Kabaddi (2015-2014),World Cup ( , 9th Safe game, 10th Safe Game, 11th Safe Game ", age: "31", type: "All Rounder", nativePlace: "Dhanusha", jerseyNo: "04", image: ""))
        
        players.append(Player(name: "Sonu Narwal", achieve: "All India Police (2009) - 1st Position, Asian Championship (2005) - 1st Position , Asian Games (2010)- 1st Position, Beach Asian Games (2011) - 2nd Position.", tour: "Pro-Kabaddi (2015),Senior National Game (2008-09), Asian Championship(2005), Asian Game (2010), Beach Asian Game(2011), All India Police Kabaddi (2009-10-11)", age: "29", type: "Raider", nativePlace: "Sonipat", jerseyNo: "22", image: "sonu.jpg"))
        
        players.append(Player(name: "Kuldeep Singh", achieve: "National (2012-13) - 1st Position, National Game (2011) - 3rd Position, Dept. National (2008)- 2nd Position, (2009)- 1st Position.", tour: "Pro-Kabaddi (2015),National Game (2011), National (2008-15), Dept. National (2008-09)", age: "23", type: "All Rounder", nativePlace: "Sonipat", jerseyNo: "08", image: "kuldeep.jpg"))
        
        players.append(Player(name: "C. Arun", achieve: "All India University (2012) - 1st Position.", tour: "Pro-Kabaddi (2015),All India University (2012), Senior National (2015)", age: "22", type: "Defender", nativePlace: "Thiruvarur", jerseyNo: "03", image: "carun.jpg"))
        
        players.append(Player(name: "Anil Patil", achieve: "Senior National(2007)-1st Position,Senior National (2011, 2012)- 3rd Position ,Departmental National (2014)- 3rd Position,", tour: "Senior National- (2007-2009,2011-2012), Departmental National (2006,2010,2013-2015)", age: "33", type: "All Rounder", nativePlace: "Mumbai", jerseyNo: "01", image: "anil.jpg"))
        
        players.append(Player(name: "Rohit Kumar Prajapat", achieve: "Sub Junior National Under 16  (2012) - 2nd Position, Under 19 School national (2012)- 3rd PositionJunior National Federation Cup (2014)- 3rd Position, Senior West Zone (2015) - 3rd Position", tour: "Pro-Kabaddi (2015), Under 20 Junior National (2012-14), All India University kabbadi tournament(2014), Under 19 School National(2012), Under 16 Sub Juniour National(2011), Junior National Federation cup (2014), Senior West Zone (2015)", age: "19", type: "Raider", nativePlace: "Jaipur", jerseyNo: "14", image: "rohit_kumar.jpg"))
        
        players.append(Player(name: "Jagdeesha K.K", achieve: "Departmental National Campionship (2014-2012) - 2nd Position, Departmental National Campionship (2006-2002)- 1st Position, Asian Cup (2002)- 1st Position, Senior National (2005-2003) -1st Position, Senior Federation Cup (2003)- 1st Position", tour: "Departmental National Campionship- (2015-1999),Senior National (2013-1999),National Games (2003-1999), Senior Federation Cup (2006-2003), Asian Cup(2002)", age: "", type: "Defender", nativePlace: "Koipaddy", jerseyNo: "09", image: "jagdeesha.jpg"))
        
        players.append(Player(name: "Satish kumar", achieve: "Senior National (2007,2008,2011)- 1st Positon, Senior National (2015)- 2nd Position,Senior Federation (2006) - 3rd Position, Beach Kabaddi National Campionship (2008) - 1st Position", tour: "Senior National -(2007,2008,2011,2015),Senior Federation Cup (2006), Beach Kabaddi National Campionship(2008)", age: "31", type: "Raider", nativePlace: "Rohera", jerseyNo: "06", image: "satish.jpg"))
        
        players.append(Player(name: "Mohammad Maghsoudlou", achieve: "Asian Indoor Kabaddi Games Incheon (2014)-2nd Position, Asian Beach Kabaddi Games China (2012)-1st Position, National Kabaddi Championship (2008,2009,2010,2011,2012)-1st Position, National Kabaddi Premier League (2006,2007)-1st Position", tour: "", age: "25", type: "All Rounder", nativePlace: "Gorgan", jerseyNo: "23", image: "mohammad.jpg"))
        
        players.append(Player(name: "Hwangi Ahn", achieve: "Incheon indoor game- Bronze Medal, National Championship (2011,2012,2013)-2nd Position, Asian Games (2014)- Bronze Medal", tour: "", age: "32", type: "", nativePlace: "Gyoung Ju", jerseyNo: "17", image: "hwangi.jpg"))
        
       
        
        
        return true
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

