//
//  SideMenuController.swift
//  JPP
//
//  Created by Chintan Shah on 26/01/16.
//  Copyright © 2016 Wohlig Technology. All rights reserved.
//

import UIKit

class SideMenuController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    var mainViewController: UIViewController!
    
    var homeController:UIViewController!
    var scheduleController:UIViewController!
    var galleryController:UIViewController!
    var newsController:UIViewController!
    var knowTeamController:UIViewController!
    var merchandiseController:UIViewController!
    var wallpaperController:UIViewController!
    var pointController:UIViewController!
    var aboutsController:UIViewController!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        let homeController = storyboard.instantiateViewControllerWithIdentifier("home") as! HomeController
        self.homeController = UINavigationController(rootViewController: homeController)
        
        let scheduleController = storyboard.instantiateViewControllerWithIdentifier("schedule") as! ScheduleController
        self.scheduleController = UINavigationController(rootViewController: scheduleController)
        
        let galleryController = storyboard.instantiateViewControllerWithIdentifier("gallery") as! GalleryController
        self.galleryController = UINavigationController(rootViewController: galleryController)
        
        let newsController = storyboard.instantiateViewControllerWithIdentifier("news") as! NewsController
        self.newsController = UINavigationController(rootViewController: newsController)
        
        let knowTeamController = storyboard.instantiateViewControllerWithIdentifier("knowteam") as! KnowTeamController
        self.knowTeamController = UINavigationController(rootViewController: knowTeamController)
        
        let merchandiseController = storyboard.instantiateViewControllerWithIdentifier("merchandise") as! MerchandiseController
        self.merchandiseController = UINavigationController(rootViewController: merchandiseController)
        
        let wallpaperController = storyboard.instantiateViewControllerWithIdentifier("wallpaper") as! WallpaperController
        self.wallpaperController = UINavigationController(rootViewController: wallpaperController)
        
        let pointController = storyboard.instantiateViewControllerWithIdentifier("point") as! PointTableController
        self.pointController = UINavigationController(rootViewController: pointController)
        
        let aboutsController = storyboard.instantiateViewControllerWithIdentifier("about") as! AboutController
        self.aboutsController = UINavigationController(rootViewController: aboutsController)
        
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int
    {
        return 1
    }
    
    var data = ["HOME", "SCHEDULE", "GALLERY","KNOW YOUR TEAM","NEWS & MEDIA","MERCHANDISE","POINTS TABLE","ABOUT US"]
    
    // MARK: - UITableViewDataSource
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        tableView.separatorStyle = UITableViewCellSeparatorStyle.SingleLine
        tableView.rowHeight = 56.0
        tableView.tableFooterView = UIView()
        let cell = tableView.dequeueReusableCellWithIdentifier("menuCell", forIndexPath: indexPath)
        cell.textLabel?.text = data[indexPath.row]
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        switch(indexPath.row)
        {
        case 0:
            self.slideMenuController()?.changeMainViewController(self.homeController, close: true)
            
        case 1:
            self.slideMenuController()?.changeMainViewController(self.scheduleController, close: true)
            
        case 2:
            self.slideMenuController()?.changeMainViewController(self.galleryController, close: true)
            
        case 3:
            self.slideMenuController()?.changeMainViewController(self.knowTeamController, close: true)
            
        case 4:
            self.slideMenuController()?.changeMainViewController(self.newsController, close: true)
            
        case 5:
            self.slideMenuController()?.changeMainViewController(self.merchandiseController, close: true)
            
        case 6:
            self.slideMenuController()?.changeMainViewController(self.wallpaperController, close: true)
            
        case 7:
            self.slideMenuController()?.changeMainViewController(self.pointController, close: true)
            
        case 8:
            self.slideMenuController()?.changeMainViewController(self.aboutsController, close: true)
            
            
            
        default:
            self.slideMenuController()?.changeMainViewController(self.homeController, close: true)
            
        }
    }
    
    
    //
    //    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    //        let cell = tableView.dequeueReusableCellWithIdentifier("menuCell", forIndexPath: indexPath)
    //        print(data[indexPath.row]);
    //        cell.textLabel?.text = data[indexPath.row]
    //        return cell
    //    }
    
    /*
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath)
    
    // Configure the cell...
    
    return cell
    }
    */
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
    // Return false if you do not want the specified item to be editable.
    return true
    }
    */
    
    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
    if editingStyle == .Delete {
    // Delete the row from the data source
    tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
    } else if editingStyle == .Insert {
    // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }
    }
    */
    
    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {
    
    }
    */
    
    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
    // Return false if you do not want the item to be re-orderable.
    return true
    }
    */
    
    /*
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
    }
    */
    
}
