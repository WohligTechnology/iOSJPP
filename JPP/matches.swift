//
//  schedule.swift
//  JPP
//
//  Created by Chintan Shah on 25/01/16.
//  Copyright © 2016 Wohlig Technology. All rights reserved.
//

import UIKit
var GlobalBookTicketURL = "";
@IBDesignable class matches: UIView {
    
    @IBOutlet weak var matchesTeams: UILabel!
    @IBOutlet weak var matchesDate: UILabel!
    
    @IBOutlet weak var buttonHolder: UIStackView!
    @IBOutlet weak var bookTicket: UIButton!
    @IBOutlet weak var addCalender: UIButton!
    var bookURL:String!;
    
    @IBOutlet weak var addCalender2: UIButton!
    @IBOutlet weak var addCalenderConstrain: NSLayoutConstraint!
    @IBAction func addCalenderTap(sender: AnyObject) {
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "dd MMM yyyy, HH:mm"
        let event2Time = dateFormatter.dateFromString(matchesDate.text!)!
        createEvent(matchesTeams.text!, EventTime: event2Time)
        let alertController = UIAlertController(title: "Match added to your Calender", message:
            "", preferredStyle: UIAlertControllerStyle.Alert)
        alertController.addAction(UIAlertAction(title: "Continue", style: UIAlertActionStyle.Default,handler: nil))
        SchduleCtrlGlo.presentViewController(alertController, animated: true, completion: nil)
    }
    @IBAction func bookTicketTap(sender: AnyObject) {

        GlobalBookTicketURL = bookURL;
        SchduleCtrlGlo.performSegueWithIdentifier("bookWeb", sender: nil)
    }
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        loadViewFromNib ()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        loadViewFromNib ()
        
    }
    
    
    
    func loadViewFromNib() {
        let bundle = NSBundle(forClass: self.dynamicType)
        let nib = UINib(nibName: "matches", bundle: bundle)
        let sortnewview = nib.instantiateWithOwner(self, options: nil)[0] as! UIView
        sortnewview.frame = bounds
        sortnewview.autoresizingMask = [.FlexibleWidth, .FlexibleHeight]
        self.addSubview(sortnewview);
    }
    
    
    
}