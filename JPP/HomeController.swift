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

class HomeController: UIViewController,UIGestureRecognizerDelegate {
    
    @IBOutlet weak var scrollView: UIScrollView!
    var verticalLayout : VerticalLayout!
    
    
    
    
    
    var HomeJSON = JSON(1)
    
    func handleTap(sender: UITapGestureRecognizer? = nil) {
        
        mediaUrl = HomeJSON["news"]["content"].string!
        
        performSegueWithIdentifier("homeNewsExternal", sender: nil)
        
        
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
        {
            HomeJSON = json;
            dispatch_async(dispatch_get_main_queue(), {
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
                    updates.matchDate.text = json["latestupdate"]["starttimedate"].string
                    updates.matchStadium.text = json["latestupdate"]["stadium"].string
                    
                    updates.trapLabel.text = "LATEST UPDATE"
                    
                }
                
                if((json["news"]["id"].string) != nil) {
                    let newsBox = news(frame: CGRectMake(8,8,self.verticalLayout.frame.width-16,230) );
                    newsBox.newsDate.text = json["news"]["timestamp"].string
                    newsBox.newsSubTitle.text = json["news"]["name"].string
                    newsBox.newsImage.image = rest.getThumb(json["news"]["image"].string!)
                    let tap = UITapGestureRecognizer(target: self, action: Selector("handleTap:"))
                    tap.delegate = self
                    newsBox.addGestureRecognizer(tap)
                    self.verticalLayout.addSubview(newsBox);
                }
                
                let teamTitle = team2(frame: CGRectMake(8,8,self.verticalLayout.frame.width-16,34) );
                self.verticalLayout.addSubview(teamTitle);
                
                let PinkBox = UIView(frame:CGRectMake(8,0,self.verticalLayout.frame.width-16,300));
                PinkBox.backgroundColor = PinkColor;
                self.verticalLayout.addSubview(PinkBox);
                
                let tableHeader = table(frame: CGRectMake(8,8,PinkBox.frame.width-16,44));
                
                tableHeader.tableNo.font = UIFont(name:"Oswald-Bold", size: 14.0)
                tableHeader.tableNo.text = "No."
                
                
                tableHeader.tableTeam.font = UIFont(name:"Oswald-Bold", size: 14.0)
                tableHeader.tableTeam.text = "Team"
                
                
                tableHeader.tablePlayed.font = UIFont(name:"Oswald-Bold", size: 14.0)
                tableHeader.tablePlayed.text = "P"
                
                tableHeader.tableWon.font = UIFont(name:"Oswald-Bold", size: 14.0)
                tableHeader.tableWon.text = "W"
                
                tableHeader.tableLost.font = UIFont(name:"Oswald-Bold", size: 14.0)
                tableHeader.tableLost.text = "L"
                
                tableHeader.tablePoint.font = UIFont(name:"Oswald-Bold", size: 14.0)
                tableHeader.tablePoint.text = "PTS"
                
                
                PinkBox.addSubview(tableHeader)
                
                let topSpaceinPink = 8;
                let spacingPink = 3;
                
                
                for(var i=0;i<json["points"].count;i++)
                {
                    
                    let topDistance = topSpaceinPink+spacingPink+((44+spacingPink)*(i+1));
                    
                    let insideTable = table(frame: CGRectMake(8,CGFloat(topDistance),PinkBox.frame.width-16,44));
                    
                    insideTable.tableNo.text = json["points"][i]["id"].string
                    
                    insideTable.tableTeam.text = json["points"][i]["name"].string
                    
                    insideTable.tablePlayed.text = json["points"][i]["played"].string
                    
                    insideTable.tableWon.text = json["points"][i]["wins"].string
                    
                    insideTable.tableLost.text = json["points"][i]["lost"].string
                    
                    insideTable.tablePoint.text = json["points"][i]["point"].string
                    
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
        
        loadingInit()
        self.view.addSubview(loaderGlo)
        
        rest.getHome(homeLoaded)
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
