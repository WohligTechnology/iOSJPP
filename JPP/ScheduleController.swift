//
//  ScheduleController.swift
//  JPP
//
//  Created by Chintan Shah on 26/01/16.
//  Copyright © 2016 Wohlig Technology. All rights reserved.
//

import UIKit
import EventKit

class ScheduleController: UIViewController {
    
    
    
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


    @IBOutlet weak var scrollView: UIScrollView!
    var verticalLayout : VerticalLayout!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.setNavigationBarItemText("SCHEDULE")
        
        self.verticalLayout = VerticalLayout(width: self.view.frame.width);
        self.scrollView.insertSubview(self.verticalLayout, atIndex: 0)
        
        let upcoming = schedule(frame: CGRectMake(8,8,verticalLayout.frame.width-16,355));
        self.verticalLayout.addSubview(upcoming);

        
        upcoming.trapLabel.text="UPCOMING MATCH";
        
        upcoming.addToCalendar.addTarget(self, action: "eventInit:", forControlEvents: UIControlEvents.TouchUpInside)
        
        
        let whiteView = UIView(frame:CGRectMake(0,8,verticalLayout.frame.width,1000));
        
        whiteView.backgroundColor = UIColor.whiteColor()
        
        let trap = trapezium(frame: CGRectMake(8,0,verticalLayout.frame.width-16,34));
        resizeView(8);
        whiteView.addSubview(trap);
        trap.trapeziumTitle.text="OTHER MATCHES";
        
        self.verticalLayout.addSubview(whiteView);
        
        
        let topSpacing = 32;
        let spacingPink = 8;
        
        
        for(var i=0;i<3;i++)
        {
            
            let topDistance = topSpacing+spacingPink+((65+spacingPink)*(i));
            let insideTable = matches(frame: CGRectMake(8,CGFloat(topDistance),verticalLayout.frame.width-16,65));
            whiteView.frame.size.height = CGFloat(topDistance+65+8);
            whiteView.addSubview(insideTable);
        }
        
        
        let bookTic = bookTicket(frame:CGRectMake(8,8,verticalLayout.frame.width-16,44));
        
        
        self.verticalLayout.addSubview(bookTic);

        

        resizeView(8);
        
        bookTic.bookButton.addTarget(self, action: "BookButtonTap:", forControlEvents: UIControlEvents.TouchUpInside)
        
        
        
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
