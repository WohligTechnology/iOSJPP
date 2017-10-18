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

var SchduleCtrlGlo:ScheduleController!

class ScheduleController: UIViewController {
    var schedule: JSON = []
    var update = upcoming()
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
            (accessGranted: Bool, error: Error?) in
            
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
        })
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
            print("showSchedule\(json)")
           
        }
       

    }
    
    
    func booktickets(_ sender: UIButton){
        print("hello")
        if( schedule[0]["bookticket"].stringValue != ""){
            let WebController =
                self.storyboard?.instantiateViewController(withIdentifier: "WebController")
                    as! BookTicketController
            WebController.url = URL(string: schedule[0]["bookticket"].stringValue)
            
            //        WebController.url = theUrl
            self.navigationController?.pushViewController(WebController, animated: true)
        }else{
            print("nolinkfound")
        }
    }
    
    
    
    func buyTickets(_ sender: UIButton){
        print("hello")
        if( schedule[sender.tag]["bookticket"].stringValue != ""){
            let WebController =
                self.storyboard?.instantiateViewController(withIdentifier: "WebController")
                    as! BookTicketController
            WebController.url = URL(string: schedule[sender.tag]["bookticket"].stringValue)
            
            //        WebController.url = theUrl
            self.navigationController?.pushViewController(WebController, animated: true)
        }else{
            print("nolinkfound")
        }
    }

    
    @IBOutlet weak var scrollView: UIScrollView!
    var verticalLayout : VerticalLayout!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        SchduleCtrlGlo = self;
        self.setNavigationBarItemText("SEASON 5 SCHEDULE")
        
        loadingInit()
        self.view.addSubview(loaderGlo)
        
        rest.getSchedule(scheduleComplete)
        rest.getSchedule({(json:JSON) -> () in
            DispatchQueue.main.sync(execute: {
                if json == 401 {
                    print("No Data Found")
                }else{
                    
                    
                    self.schedule = json
                    
                    print("schedule\(self.schedule)")
                    print("schedule\(self.schedule[0]["bookticket"].stringValue)")
                    self.verticalLayout = VerticalFitLayout(width: self.view.frame.width);
                    self.scrollView.insertSubview(self.verticalLayout, at: 0)
                    var height2 = CGFloat(350.0);
                    if(heightGlo-56 > 350)
                    {
                        height2 = heightGlo-56-25;
                    }
                    
                    
                    
                    let dateFormatter = DateFormatter()
                    dateFormatter.dateFormat = "dd MMM yyyy, HH:mm"
                    
                    if(self.schedule[0]["level"].stringValue == "semifinal" )
                    {
                        let updates = upcoming(frame: CGRect(x: 8,y: 8,width: self.verticalLayout.frame.width-16,height: height2))
                        self.verticalLayout.addSubview(updates)
                        
                        
                        //                updates.addToCalender.hidden = true
                        updates.team1Image.hnk_setImageFromURL(rest.getImageSizeCache(self.schedule[0]["appteamimage1"].stringValue))
                        updates.team2Image.hnk_setImageFromURL(rest.getImageSizeCache(self.schedule[0]["appteamimage2"].stringValue))
                        //                    updates.matchTime.text = json[0]["starttimedate"].string
                        //                    updates.matchVenue.text = json[0]["stadium"].string
                        //
                        //
                        //                    updates.EventTimeTop = dateFormatter.date(from: json[0]["starttimedate"].string!)!
                        //                    updates.EventNameTop = json[0]["team1"].string! + " VS " + json[0]["team2"].string!;
                    }
                    else if(self.schedule[0]["level"].stringValue == "final" )
                    {
                        let updates = upcoming(frame: CGRect(x: 8,y: 8,width: self.verticalLayout.frame.width-16,height: height2))
                        self.verticalLayout.addSubview(updates)
                        
                        if(self.schedule[0]["id"]).boolValue {
                            self.verticalLayout.addSubview(updates)
                            
                            //                updates.addToCalender.hidden = true
                            updates.team1Image.hnk_setImageFromURL(rest.getImageSizeCache(self.schedule[0]["appteamimage1"].stringValue))
                            updates.team2Image.hnk_setImageFromURL(rest.getImageSizeCache(self.schedule[0]["appteamimage2"].stringValue))
                            //                        updates.matchTime.text = json[0]["starttimedate"].string
                            //                        updates.matchVenue.text = json[0]["stadium"].string
                            //
                            //                        updates.semiImage.image = UIImage(named: "finals")
                            //
                            //
                            //                        updates.EventTimeTop = dateFormatter.date(from: json[0]["starttimedate"].string!)!
                            //                        updates.EventNameTop = json[0]["team1"].string! + " VS " + json[0]["team2"].string!;
                        }
                    }
                    else {
                        let updates = upcoming(frame: CGRect(x: 8,y: 8,width: self.verticalLayout.frame.width-16,height: 300))
                        self.verticalLayout.addSubview(updates)
                        updates.team1Image.hnk_setImageFromURL(rest.getImageSizeCache(self.schedule[0]["appteamimage1"].stringValue))
                        updates.team2Image.hnk_setImageFromURL(rest.getImageSizeCache(self.schedule[0]["appteamimage2"].stringValue))
                        updates.matchStadium.text = self.schedule[0]["stadium"].stringValue
                        updates.matchDate.text = self.schedule[0]["starttimedate"].stringValue
                        let dateFormatter = DateFormatter()
                        dateFormatter.dateFormat = "dd MMM yyyy, HH:mm"
                        
                        
                       

                        
                        updates.EventTimeTop = dateFormatter.date(from: json[0]["starttimedate"].stringValue)!
                        updates.EventNameTop = self.schedule[0]["team1"].stringValue + " VS " +  self.schedule[0]["team2"].stringValue
                        
                        if( self.schedule[0]["bookticket"].stringValue != ""){
                            updates.bookTickets.isHidden = false
                        }else{
                            updates.bookTickets.isHidden = true
                            
                        }
                        updates.bookTickets.addTarget(self, action: #selector(ScheduleController.booktickets(_:)), for: .touchUpInside)
                        
                        if(self.schedule[0]["id"]).boolValue {
                            self.verticalLayout.addSubview(updates)
                            
                            //                                       updates.addToCalender.isHidden = true
                            if(self.schedule[0]["team1id"]).boolValue {
                                updates.team1Image.hnk_setImageFromURL(rest.getImageSizeCache(self.schedule[0]["appteamimage1"].stringValue))
                            }
                            if(self.schedule[0]["team2id"]).boolValue {
                                updates.team2Image.hnk_setImageFromURL(rest.getImageSizeCache(self.schedule[0]["appteamimage2"].stringValue))
                            }
                            //                        updates.matchTime.text = json[0]["starttimedate"].string
                            
                            if(self.schedule[0]["stadium"]).boolValue {
                                //                            updates.matchVenue.text = json[0]["stadium"].string
                            }
                            
                            
                            //                        updates.EventTimeTop = dateFormatter.date(from: json[0]["starttimedate"].string!)!
                            if((self.schedule[0]["team1"].string != nil) && (self.schedule[0]["team2"].string != nil)) {
                                //                        updates.EventNameTop = json[0]["team1"].string! + " VS " + json[0]["team2"].string!;
                            }
                        }
                        
                        
                        
                    }
                    
                    var whiteView:UIView!
                    whiteView = UIView(frame:CGRect(x: 0,y: 8,width: self.verticalLayout.frame.width,height: 1000));
                    
                    whiteView.backgroundColor = UIColor.white
                    if(self.schedule[0]["starttimedate"]).boolValue {
                        
                        self.EventTimeTop = dateFormatter.date(from: self.schedule[0]["starttimedate"].string!)!
                        if((self.schedule[0]["team1"].string != nil) && (self.schedule[0]["team2"].string != nil)) {
                            self.EventNameTop = self.schedule[0]["team1"].string! + " VS " + self.schedule[0]["team2"].string!;
                        }
                        
                    }
                    
                    let trap = trapezium(frame: CGRect(x: 8,y: 0,width: self.verticalLayout.frame.width-16,height: 34));
                    self.resizeView(8);
                    whiteView.addSubview(trap);
                    trap.trapeziumTitle.text="OTHER MATCHES";
                    
                    //                self.verticalLayout.addSubview(whiteView);
                    
                    for i in 1..<json.count
                    {
                        
                        let topDistance = self.topSpacing+self.spacingPink+((100+self.spacingPink)*(i-1));
                        let insideTable = matches(frame: CGRect(x: 8,y: CGFloat(topDistance),width: self.verticalLayout.frame.width-16,height: 100));
                       
                        insideTable.matchesTeams.text = self.schedule[i]["team1"].stringValue + " VS " + self.schedule[i]["team2"].stringValue
                        if(self.schedule[i]["bookticket"].stringValue != ""){
                           insideTable.bookTickets.isHidden = false
                        }else{
                            insideTable.bookTickets.isHidden = true
                           
                        }
                        insideTable.bookTickets.tag = i
                        insideTable.bookTickets.addTarget(self, action: #selector(ScheduleController.buyTickets(_:)), for: .touchUpInside)
                        
                        //                    if(json[i]["team1id"].string != "5")
                        //                    {
                        insideTable.buttonHolder.alpha = 0;
                        //                        
                        //                    }
                        //                    else
                        //   {
                        // insideTable.addCalender2.alpha = 0;
                        // }
                        
                        insideTable.matchesDate.text = self.schedule[i]["starttimedate"].string
                        
                        
                        whiteView.frame.size.height = CGFloat(topDistance+100+8);
                        whiteView.addSubview(insideTable);
                        self.verticalLayout.addSubview(whiteView)
                    }
                    
                    self.resizeView(8);
                    

                    DispatchQueue.main.async(execute: {
                        loadingStop()
                    });
                    
                    
                }
                
            })
            
            
        })

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
