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

class HomeController: UIViewController, UIGestureRecognizerDelegate {
    
    var newsController:UIViewController!
    var galleryController: UIViewController!
    var fancornerController: UIViewController!
    var i = 0;
    @IBOutlet weak var scrollView: UIScrollView!
    var verticalLayout : VerticalLayout!
    
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
     
    func homeLoaded(json:JSON) {
        if(json == 1)
        {
            let alertController = UIAlertController(title: "No Connection", message:
                "Please check your internet connection", preferredStyle: UIAlertControllerStyle.Alert)
            alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.Default,handler: nil))
            
            self.presentViewController(alertController, animated: true, completion: nil)
        }
        else
        {   self.i++
            HomeJSON = json;
            dispatch_async(dispatch_get_main_queue(), {
                if(self.i>1)
                {
                    self.verticalLayout.removeFromSuperview()
                }
                self.verticalLayout = VerticalLayout(width: self.view.frame.width);
                self.scrollView.insertSubview(self.verticalLayout, atIndex: 0)

                
                if((json["latestupdate"]["team1id"].string) != nil) {
                    
                    let updates = schedule(frame: CGRectMake(8,8,self.verticalLayout.frame.width-16,300));
                    self.verticalLayout.addSubview(updates);
                    updates.addToCalendar.hidden = true;
                    
                    updates.team1Image.image = UIImage(named: "t" + json["latestupdate"]["team1id"].string! + ".png")
                    updates.team2Image.image = UIImage(named: "t" + json["latestupdate"]["team2id"].string! + ".png")
                    updates.team1Score.text = json["latestupdate"]["score1"].string
                    updates.team2Score.text = json["latestupdate"]["score2"].string
                    updates.matchTime.text = json["latestupdate"]["matchtime"].string
                    updates.matchDate.text = json["latestupdate"]["starttimedate"].string
                    updates.matchStadium.text = json["latestupdate"]["stadium"].string
                    
                    updates.trapLabel.text = "LATEST UPDATE"
                    
                }
                
                if((json["news"]["id"].string) != nil) {
                    let newsBox = news(frame: CGRectMake(8,8,self.verticalLayout.frame.width-16,230) );
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
                let signupsection = signupSection(frame: CGRectMake(8, 8, self.verticalLayout.frame.size.width - 16, 80))
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
                
                
                for(var i=0;i<json["points"].count;i++)
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
        
        self.setNavigationBarItem()
        let refreshControl = UIRefreshControl()
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
