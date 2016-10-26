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
    var EventTimeTop = Date()
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        checkCalendarAuthorizationStatus()
    }
    
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
            (accessGranted: Bool, error: NSError?) in
            
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
        } as! EKEventStoreRequestAccessCompletionHandler)
    }
    
    
    func createEventTop(_ sender:UIButton) {
        createEvent(EventNameTop,EventTime: EventTimeTop)
        
        let alertController = UIAlertController(title: "Match added to your Calender", message:
            "", preferredStyle: UIAlertControllerStyle.alert)
        alertController.addAction(UIAlertAction(title: "Continue", style: UIAlertActionStyle.default,handler: nil))
        
        self.present(alertController, animated: true, completion: nil)
        
    }
    
    func scheduleComplete (_ json:JSON) {
		
        if(json == 1)
        {
            let alertController = UIAlertController(title: "No Connection", message:
                "Please check your internet connection", preferredStyle: UIAlertControllerStyle.alert)
            alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.default,handler: nil))
            
            self.present(alertController, animated: true, completion: nil)
        }
        else
        {
            print(json[0]);
            
            DispatchQueue.main.async(execute: {

                self.verticalLayout = VerticalFitLayout(width: self.view.frame.width);
                self.scrollView.insertSubview(self.verticalLayout, at: 0)
                var height2 = CGFloat(512.0);
                if(heightGlo-56 > 512)
                {
                    height2 = heightGlo-56-25;
                }
                
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "dd MMM yyyy, HH:mm"
                
                if(json[0]["level"].stringValue == "semifinal" )
                {
                    let updates = semiFinal(frame: CGRect(x: 8,y: 8,width: self.verticalLayout.frame.width-16,height: height2))
                    self.verticalLayout.addSubview(updates)
                    
                    //                updates.addToCalender.hidden = true
                    updates.team1Image.image = UIImage(named: "t" + json[0]["team1id"].string! + ".png")
                    updates.team2Image.image = UIImage(named: "t" + json[0]["team2id"].string! + ".png")
                    updates.matchTime.text = json[0]["starttimedate"].string
                    updates.matchVenue.text = json[0]["stadium"].string
                    
                    
                    updates.EventTimeTop = dateFormatter.date(from: json[0]["starttimedate"].string!)!
                    updates.EventNameTop = json[0]["team1"].string! + " VS " + json[0]["team2"].string!;
                }
                else if(json[0]["level"].stringValue == "final" )
                {
                    let updates = semiFinal(frame: CGRect(x: 8,y: 8,width: self.verticalLayout.frame.width-16,height: height2))
                    self.verticalLayout.addSubview(updates)
                    
                    if(json[0]["id"]).boolValue {
                        self.verticalLayout.addSubview(updates)
                        
                        //                updates.addToCalender.hidden = true
                        updates.team1Image.image = UIImage(named: "t" + json[0]["team1id"].string! + ".png")
                        updates.team2Image.image = UIImage(named: "t" + json[0]["team2id"].string! + ".png")
                        updates.matchTime.text = json[0]["starttimedate"].string
                        updates.matchVenue.text = json[0]["stadium"].string
                        
                        updates.semiImage.image = UIImage(named: "finals")
                        
                        
                        updates.EventTimeTop = dateFormatter.date(from: json[0]["starttimedate"].string!)!
                        updates.EventNameTop = json[0]["team1"].string! + " VS " + json[0]["team2"].string!;
                    }
                }
                else {
                    let updates = seasonOpener(frame: CGRect(x: 8,y: 8,width: self.verticalLayout.frame.width-16,height: 385))
                    self.verticalLayout.addSubview(updates)
                    
                    if(json[0]["id"]).boolValue {
                        self.verticalLayout.addSubview(updates)
                        
                                       updates.addToCalender.isHidden = true
                        if(json[0]["team1id"]).boolValue {
                            updates.team1Image.image = UIImage(named: "t" + json[0]["team1id"].string! + ".png")
                        }
                        if(json[0]["team2id"]).boolValue {
                            updates.team2Image.image = UIImage(named: "t" + json[0]["team2id"].string! + ".png")
                        }
                        updates.matchTime.text = json[0]["starttimedate"].string
                        
                        if(json[0]["stadium"]).boolValue {
                            updates.matchVenue.text = json[0]["stadium"].string
                        }
                        
                        
                        updates.EventTimeTop = dateFormatter.date(from: json[0]["starttimedate"].string!)!
                        if((json[0]["team1"].string != nil) && (json[0]["team2"].string != nil)) {
                        updates.EventNameTop = json[0]["team1"].string! + " VS " + json[0]["team2"].string!;
                        }
                    }
                }
                
                
                
                
                
        
                
                var whiteView:UIView!
                whiteView = UIView(frame:CGRect(x: 0,y: 8,width: self.verticalLayout.frame.width,height: 1000));
                whiteView.backgroundColor = UIColor.white
                if(json[0]["starttimedate"]).boolValue {
                    
                self.EventTimeTop = dateFormatter.date(from: json[0]["starttimedate"].string!)!
                    if((json[0]["team1"].string != nil) && (json[0]["team2"].string != nil)) {
                        self.EventNameTop = json[0]["team1"].string! + " VS " + json[0]["team2"].string!;
                    }
                    
                }
                
                let trap = trapezium(frame: CGRect(x: 8,y: 0,width: self.verticalLayout.frame.width-16,height: 34));
                self.resizeView(8);
                whiteView.addSubview(trap);
                trap.trapeziumTitle.text="OTHER MATCHES";
                
//                self.verticalLayout.addSubview(whiteView);
                
                for i in 1...json.count
                {
                    
                    let topDistance = self.topSpacing+self.spacingPink+((100+self.spacingPink)*(i-1));
                    let insideTable = matches(frame: CGRect(x: 8,y: CGFloat(topDistance),width: self.verticalLayout.frame.width-16,height: 100));
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
            
            DispatchQueue.main.async(execute: {
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
    
    func BookButtonTap(_ sender: UIButton) {
        GlobalBookTicketURL = "";
        self.performSegue(withIdentifier: "bookWeb", sender: nil)
    }
    
    func resizeView(_ offset:CGFloat)
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
