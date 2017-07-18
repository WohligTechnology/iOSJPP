//
//  SideMenuController.swift
//  JPP
//
//  Created by Chintan Shah on 26/01/16.
//  Copyright © 2016 Wohlig Technology. All rights reserved.
//

import UIKit

class SideMenuController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    var matchupdateJSON = JSON([])
    var mainViewController: UIViewController!
    var homeController:UIViewController!
    var scheduleController:UIViewController!
    var galleryController:UIViewController!
    var jpptvController:UIViewController!
    var newsController:UIViewController!
    var knowTeamController:UIViewController!
    var merchandiseController:UIViewController!
    var wallpaperController:UIViewController!
    var pointController:UIViewController!
    var matchupdateController:UIViewController!
    var worldcupController:UIViewController!
    var fancornerController:UIViewController!
    var aboutsController:UIViewController!
//    var playersInsideController:UIViewController!
    
    override func viewDidLoad() {
        
        
        
//        rest.getMatchUpdate({(json:JSON) -> () in
//            DispatchQueue.main.sync(execute: {
//                if json == 401 {
//                    print("No Data Found")
//                }else{
//                    
//                    print("hellojson\(json)")
//                    self.matchupdateJSON = json
//                    
//                    
//                      
//                }
//            })
//            
//        })

        
        super.viewDidLoad()
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        let homeController = storyboard.instantiateViewController(withIdentifier: "home") as! HomeController
        self.homeController = UINavigationController(rootViewController: homeController)
        
        let scheduleController = storyboard.instantiateViewController(withIdentifier: "schedule") as! ScheduleController
        self.scheduleController = UINavigationController(rootViewController: scheduleController)
        
        let galleryController = storyboard.instantiateViewController(withIdentifier: "gallery") as! GalleryController
        self.galleryController = UINavigationController(rootViewController: galleryController)
        
        let jpptvController = storyboard.instantiateViewController(withIdentifier: "gallery") as! GalleryController
        self.jpptvController = UINavigationController(rootViewController: jpptvController)
        jpptvController.activeGal = 1
        
        let newsController = storyboard.instantiateViewController(withIdentifier: "news") as! NewsController
        self.newsController = UINavigationController(rootViewController: newsController)
        
        let knowTeamController = storyboard.instantiateViewController(withIdentifier: "knowteam") as! KnowTeamController
        self.knowTeamController = UINavigationController(rootViewController: knowTeamController)
        
        let merchandiseController = storyboard.instantiateViewController(withIdentifier: "merchandiseST") as! MerchandiseViewController
        self.merchandiseController = UINavigationController(rootViewController: merchandiseController)
        
        let wallpaperController = storyboard.instantiateViewController(withIdentifier: "GalleryInside") as! GalleryInsideController
        self.wallpaperController = UINavigationController(rootViewController: wallpaperController)
        
        let pointController = storyboard.instantiateViewController(withIdentifier: "point") as! PointTableController
        self.pointController = UINavigationController(rootViewController: pointController)
        
        let matchupdateController = storyboard.instantiateViewController(withIdentifier: "matchupdate") as! MatchUpdateController
        self.matchupdateController = UINavigationController(rootViewController: matchupdateController)
        
        let worldcupController = storyboard.instantiateViewController(withIdentifier: "worldcup") as! WorldCupController
        self.worldcupController = UINavigationController(rootViewController: worldcupController)
        
        let fancornerController = storyboard.instantiateViewController(withIdentifier: "fanCorner") as! FanCornerController
        self.fancornerController = UINavigationController(rootViewController: fancornerController)
        
        let aboutsController = storyboard.instantiateViewController(withIdentifier: "about") as! AboutController
        self.aboutsController = UINavigationController(rootViewController: aboutsController)
        
//        let playersInsideController = storyboard.instantiateViewController(withIdentifier: "playersInside") as!
//        PlayerInsideViewController
//        self.playersInsideController = UINavigationController(rootViewController: playersInsideController)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    func numberOfSections(in tableView: UITableView) -> Int
    {
        return 1
    }
    
    var data = ["HOME", "SCHEDULE", "SEASON 4 REVIEW", "GALLERY", "JPP TV", "NEWS & MEDIA","KNOW YOUR PANTHERS","WALLPAPERS", "POINTS TABLE", "FAN CORNER","ABOUT"]
    var dataimage = ["home.png", "fixtures.png", "matchupdate.png", "gallery.png", "jpptv.png", "newsicon.png","know.png","galleryinside.png","point.png", "fan.png","about.png"]
    
    // MARK: - UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        tableView.separatorStyle = UITableViewCellSeparatorStyle.singleLine
        tableView.rowHeight = 56.0
        tableView.tableFooterView = UIView()
        let cell = tableView.dequeueReusableCell(withIdentifier: "menuCell", for: indexPath)
        cell.textLabel?.text = data[(indexPath as NSIndexPath).row]
        cell.imageView!.image = UIImage(named: dataimage[(indexPath as NSIndexPath).row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch((indexPath as NSIndexPath).row)
        {
        case 0:
            self.slideMenuController()?.changeMainViewController(self.homeController, close: true)
        case 1:
            self.slideMenuController()?.changeMainViewController(self.scheduleController, close: true)
            
//        case 1:
//            self.slideMenuController()?.changeMainViewController(self.worldcupController, close: true)
            
                  case 2:
////                    if matchupdateJSON.count != 0 {
                self.slideMenuController()?.changeMainViewController(self.matchupdateController, close: true)
 
//            }else{
//                print("stuckhere")
//            }
        //        case 3:
//            self.slideMenuController()?.changeMainViewController(self.merchandiseController, close: true)
        case 3:
            isGalWal = 0
            self.slideMenuController()?.changeMainViewController(self.galleryController, close: true)
        case 4:
            isGalWal = 1
            self.slideMenuController()?.changeMainViewController(self.jpptvController, close: true)
        case 5:
            self.slideMenuController()?.changeMainViewController(self.newsController, close: true)
        case 6:
            self.slideMenuController()?.changeMainViewController(self.knowTeamController, close: true)
        case 7:
            isGalWal = 1
            self.slideMenuController()?.changeMainViewController(self.wallpaperController, close: true)
        case 8:
            self.slideMenuController()?.changeMainViewController(self.pointController, close: true)
        case 9:
            self.slideMenuController()?.changeMainViewController(self.fancornerController, close: true)
        case 10:
            self.slideMenuController()?.changeMainViewController(self.aboutsController, close: true)
        default:
            self.slideMenuController()?.changeMainViewController(self.homeController, close: true)
        }
    }
}
