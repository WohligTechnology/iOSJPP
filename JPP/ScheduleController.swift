//
//  ScheduleController.swift
//  JPP
//
//  Created by Chintan Shah on 26/01/16.
//  Copyright © 2016 Wohlig Technology. All rights reserved.
//

import UIKit
import EventKit
import SwiftyJSON

class ScheduleController: UIViewController {
    
    let topSpacing = 32;
    let spacingPink = 8;
    
    
    
    func eventInit(sender: UIImage) {
        
        
        let eventStore = EKEventStore()
        
        if(EKEventStore.authorizationStatusForEntityType(EKEntityType.Event) != EKAuthorizationStatus.Authorized)
        {
            eventStore.requestAccessToEntityType(.Event, completion: { granted,err -> Void in
                print(granted);
            })
        }
        // Create an Event Store instance
        
        
//        // Use Event Store to create a new calendar instance
//        // Configure its title
//        let newCalendar = EKCalendar(forEntityType: EKEntityType.Event, eventStore: eventStore)
//        newCalendar.title = "Some New Calendar Title"
//        
//        // Access list of available sources from the Event Store
//        let sourcesInEventStore = eventStore.sources 
//        
//        // Filter the available sources and select the "Local" source to assign to the new calendar's
//        // source property
//        print("ALl is well2");
//        print(sourcesInEventStore);
//        newCalendar.source = sourcesInEventStore.filter {
//            (source: EKSource) -> Bool in
//            source.sourceType == EKSourceType.CalDAV
//            }.first!
//        
//        print("ALl is well");
//        
//        try! eventStore.saveCalendar(newCalendar, commit: true)
//            
        
    }
    
    
    func createEvent(eventStore: EKEventStore, title: String, startDate: NSDate, endDate: NSDate) {
        let event = EKEvent(eventStore: eventStore)
        
        event.title = title
        event.startDate = startDate
        event.endDate = endDate
        event.calendar = eventStore.defaultCalendarForNewEvents
        do {
            try eventStore.saveEvent(event, span: .ThisEvent)
            let savedEventId = event.eventIdentifier
            print(savedEventId);
        } catch {
            print("Bad things happened")
        }
    }
    func scheduleComplete (json:JSON) {
        //        print(json);
        dispatch_async(dispatch_get_main_queue(), {
            
            self.verticalLayout = VerticalFitLayout(width: self.view.frame.width);
            self.scrollView.insertSubview(self.verticalLayout, atIndex: 0)
            
            let upcomingVar = upcoming(frame: CGRectMake(8,8,self.verticalLayout.frame.width-16,300));
            self.verticalLayout.addSubview(upcomingVar);
            
            upcomingVar.team1Image.image = UIImage(named: "t" + json[0]["team1id"].string! + ".png")
            upcomingVar.team2Image.image = UIImage(named: "t" + json[0]["team2id"].string! + ".png")
            
            upcomingVar.trapLabel.text="UPCOMING MATCH";
            upcomingVar.matchStadium.text = json[0]["stadium"].string
            upcomingVar.matchDate.text = json[0]["starttimedate"].string
            
            upcomingVar.addToCalendar.addTarget(self, action: "eventInit:", forControlEvents: UIControlEvents.TouchUpInside)
            
            var whiteView:UIView!
            whiteView = UIView(frame:CGRectMake(0,8,self.verticalLayout.frame.width,1000));
            
            whiteView.backgroundColor = UIColor.whiteColor()
            
            let trap = trapezium(frame: CGRectMake(8,0,self.verticalLayout.frame.width-16,34));
            self.resizeView(8);
            whiteView.addSubview(trap);
            trap.trapeziumTitle.text="OTHER MATCHES";
            
            self.verticalLayout.addSubview(whiteView);
            
            for(var i=1;i<json.count;i++)
            {
                
                let topDistance = self.topSpacing+self.spacingPink+((65+self.spacingPink)*(i-1));
                let insideTable = matches(frame: CGRectMake(8,CGFloat(topDistance),self.verticalLayout.frame.width-16,65));
                insideTable.matchesTeams.text = json[i]["team1"].string! + " VS " + json[i]["team2"].string!
                
                insideTable.matchesDate.text = json[i]["starttimedate"].string
                
                
                whiteView.frame.size.height = CGFloat(topDistance+65+8);
                whiteView.addSubview(insideTable);
            }
            
            
            let bookTic = bookTicket(frame:CGRectMake(8,8,self.verticalLayout.frame.width-16,44));
            
            
            self.verticalLayout.addSubview(bookTic);
            
            
            
            self.resizeView(8);
            
            bookTic.bookButton.addTarget(self, action: "BookButtonTap:", forControlEvents: UIControlEvents.TouchUpInside)
            
            
        })
        
        
        
        
    }


    @IBOutlet weak var scrollView: UIScrollView!
    var verticalLayout : VerticalLayout!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setNavigationBarItemText("SCHEDULE")
        rest.getSchedule(scheduleComplete)
        
    }
    
    func BookButtonTap(sender: UIButton) {
        self.performSegueWithIdentifier("bookWeb", sender: nil)
        print("click")
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
