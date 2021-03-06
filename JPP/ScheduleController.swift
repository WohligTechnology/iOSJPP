//
//  ScheduleController.swift
//  JPP
//
//  Created by Chintan Shah on 26/01/16.
//  Copyright © 2016 Wohlig Technology. All rights reserved.
//
import Foundation
import UIKit
import EventKit
import SwiftyJSON

var SchduleCtrlGlo:ScheduleController!

class ScheduleController: UIViewController {
    
    
    let topSpacing = 32;
    let spacingPink = 8;
    
    
    var EventNameTop = "Jaipur Pink Panther Event";
    var EventTimeTop = NSDate()
    
    
    
    override func viewWillAppear(animated: Bool) {
        checkCalendarAuthorizationStatus()
    }
    
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
    
    
    func createEventTop(sender:UIButton) {
        createEvent(EventNameTop,EventTime: EventTimeTop)
        
        let alertController = UIAlertController(title: "Match added to your Calender", message:
            "", preferredStyle: UIAlertControllerStyle.Alert)
        alertController.addAction(UIAlertAction(title: "Continue", style: UIAlertActionStyle.Default,handler: nil))
        
        self.presentViewController(alertController, animated: true, completion: nil)
        
    }
    
    func scheduleComplete (json:JSON) {
		
        if(json == 1)
        {
            let alertController = UIAlertController(title: "No Connection", message:
                "Please check your internet connection", preferredStyle: UIAlertControllerStyle.Alert)
            alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.Default,handler: nil))
            
            self.presentViewController(alertController, animated: true, completion: nil)
        }
        else
        {
            print(json[0]);
            
            dispatch_async(dispatch_get_main_queue(), {

                self.verticalLayout = VerticalFitLayout(width: self.view.frame.width);
                self.scrollView.insertSubview(self.verticalLayout, atIndex: 0)
                var height2 = CGFloat(512.0);
                if(heightGlo-56 > 512)
                {
                    height2 = heightGlo-56-25;
                }
                
                let dateFormatter = NSDateFormatter()
                dateFormatter.dateFormat = "dd MMM yyyy, HH:mm"
                
                if(json[0]["level"].stringValue == "semifinal" )
                {
                    let updates = semiFinal(frame: CGRectMake(8,8,self.verticalLayout.frame.width-16,height2))
                    self.verticalLayout.addSubview(updates)
                    
                    //                updates.addToCalender.hidden = true
                    updates.team1Image.image = UIImage(named: "t" + json[0]["team1id"].string! + ".png")
                    updates.team2Image.image = UIImage(named: "t" + json[0]["team2id"].string! + ".png")
                    updates.matchTime.text = json[0]["starttimedate"].string
                    updates.matchVenue.text = json[0]["stadium"].string
                    
                    
                    updates.EventTimeTop = dateFormatter.dateFromString(json[0]["starttimedate"].string!)!
                    updates.EventNameTop = json[0]["team1"].string! + " VS " + json[0]["team2"].string!;
                }
                else if(json[0]["level"].stringValue == "final" )
                {
                    let updates = semiFinal(frame: CGRectMake(8,8,self.verticalLayout.frame.width-16,height2))
                    self.verticalLayout.addSubview(updates)
                    
                    if(json[0]["id"]) {
                        self.verticalLayout.addSubview(updates)
                        
                        //                updates.addToCalender.hidden = true
                        updates.team1Image.image = UIImage(named: "t" + json[0]["team1id"].string! + ".png")
                        updates.team2Image.image = UIImage(named: "t" + json[0]["team2id"].string! + ".png")
                        updates.matchTime.text = json[0]["starttimedate"].string
                        updates.matchVenue.text = json[0]["stadium"].string
                        
                        updates.semiImage.image = UIImage(named: "finals")
                        
                        
                        updates.EventTimeTop = dateFormatter.dateFromString(json[0]["starttimedate"].string!)!
                        updates.EventNameTop = json[0]["team1"].string! + " VS " + json[0]["team2"].string!;
                    }
                }
                else {
                    let updates = seasonOpener(frame: CGRectMake(8,8,self.verticalLayout.frame.width-16,385))
                    self.verticalLayout.addSubview(updates)
                    
                    if(json[0]["id"]) {
                        self.verticalLayout.addSubview(updates)
                        
                                       updates.addToCalender.hidden = true
                        if(json[0]["team1id"]) {
                            updates.team1Image.image = UIImage(named: "t" + json[0]["team1id"].string! + ".png")
                        }
                        if(json[0]["team2id"]) {
                            updates.team2Image.image = UIImage(named: "t" + json[0]["team2id"].string! + ".png")
                        }
                        updates.matchTime.text = json[0]["starttimedate"].string
                        
                        if(json[0]["stadium"]) {
                            updates.matchVenue.text = json[0]["stadium"].string
                        }
                        
                        
                        updates.EventTimeTop = dateFormatter.dateFromString(json[0]["starttimedate"].string!)!
                        if(json[0]["team1"] && json[0]["team2"]) {
                        updates.EventNameTop = json[0]["team1"].string! + " VS " + json[0]["team2"].string!;
                        }
                    }
                }
                
                
                
                
                
        
                
                var whiteView:UIView!
                whiteView = UIView(frame:CGRectMake(0,8,self.verticalLayout.frame.width,1000));
                whiteView.backgroundColor = UIColor.whiteColor()
                if(json[0]["starttimedate"]) {
                    
                self.EventTimeTop = dateFormatter.dateFromString(json[0]["starttimedate"].string!)!
                    if(json[0]["team1"] && json[0]["team2"]) {
                        self.EventNameTop = json[0]["team1"].string! + " VS " + json[0]["team2"].string!;
                    }
                    
                }
                
                let trap = trapezium(frame: CGRectMake(8,0,self.verticalLayout.frame.width-16,34));
                self.resizeView(8);
                whiteView.addSubview(trap);
                trap.trapeziumTitle.text="OTHER MATCHES";
                
//                self.verticalLayout.addSubview(whiteView);
                
                for(var i=1;i<json.count;i++)
                {
                    
                    let topDistance = self.topSpacing+self.spacingPink+((100+self.spacingPink)*(i-1));
                    let insideTable = matches(frame: CGRectMake(8,CGFloat(topDistance),self.verticalLayout.frame.width-16,100));
                    insideTable.matchesTeams.text = json[i]["team1"].string! + " VS " + json[i]["team2"].string!
                    insideTable.bookURL = json[i]["bookticket"].string!
                    
//                    if(json[i]["team1id"].string != "5")
//                    {
  insideTable.buttonHolder.alpha = 0;
//                        
//                    }
//                    else
                 //   {
                       // insideTable.addCalender2.alpha = 0;
                   // }
                    
                    insideTable.matchesDate.text = json[i]["starttimedate"].string
                    
                    
                    whiteView.frame.size.height = CGFloat(topDistance+100+8);
                    whiteView.addSubview(insideTable);
                }
                
               // let bookTic = bookTicket(frame:CGRectMake(8,8,self.verticalLayout.frame.width-16,44));
                
               // self.verticalLayout.addSubview(bookTic);
                
                self.resizeView(8);
                
               // bookTic.bookButton.addTarget(self, action: "BookButtonTap:", forControlEvents: UIControlEvents.TouchUpInside)
                
            })
            
            dispatch_async(dispatch_get_main_queue(), {
                loadingStop()
            });
        }
        
    }
    
    
    
    @IBOutlet weak var scrollView: UIScrollView!
    var verticalLayout : VerticalLayout!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        SchduleCtrlGlo = self;
        self.setNavigationBarItemText("SEASON 4 SCHEDULE")
        
        loadingInit()
        self.view.addSubview(loaderGlo)
        
        rest.getSchedule(scheduleComplete)
    }
    
    func BookButtonTap(sender: UIButton) {
        GlobalBookTicketURL = "";
        self.performSegueWithIdentifier("bookWeb", sender: nil)
    }
    
    func resizeView(offset:CGFloat)
    {
        self.verticalLayout.layoutSubviews()
        self.scrollView.contentSize = CGSize(width: self.verticalLayout.frame.width, height: self.verticalLayout.frame.height + offset)
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
