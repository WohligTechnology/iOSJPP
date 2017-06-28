//
//  seasonOpener.swift
//  JPP
//
//  Created by Harsh Thakkar on 30/05/16.
//  Copyright © 2016 Wohlig Technology. All rights reserved.
//

import UIKit

@IBDesignable class seasonOpener: UIView {
    
    @IBOutlet weak var trapLabel: UILabel!
    @IBOutlet weak var team1Image: UIImageView!
    @IBOutlet weak var team2Image: UIImageView!
    @IBOutlet weak var matchVenue: UILabel!
    @IBOutlet weak var matchTime: UILabel!
    @IBOutlet weak var remainingMonths: UILabel!
    @IBOutlet weak var remainingDays: UILabel!
    @IBOutlet weak var remainingHours: UILabel!
    @IBOutlet weak var remainingMins: UILabel!
    
    var EventTimeTop = Date();
    var EventNameTop:String!;
    
    
    
    
    
    
    
    @IBOutlet weak var addToCalender: UIButton!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        loadViewFromNib ()
    }
    
    @IBAction func addToCalender(_ sender: AnyObject) {
    
//       createEvent(EventNameTop,EventTime: EventTimeTop)
        
        let alertController = UIAlertController(title: "Match added to your Calender", message:
            "", preferredStyle: UIAlertControllerStyle.alert)
        alertController.addAction(UIAlertAction(title: "Continue", style: UIAlertActionStyle.default,handler: nil))
        
        GHomeController.present(alertController, animated: true, completion: nil)
        
    }
    
//    @IBAction func bookTicket(sender: AnyObject) {
//        GlobalBookTicketURL = "";
//        GHomeController.performSegueWithIdentifier("homeBook", sender: self)
//
//    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        loadViewFromNib ()
        
    }
    func loadViewFromNib() {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: "seasonOpener", bundle: bundle)
        let seasonOpener = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
        seasonOpener.frame = bounds
        seasonOpener.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.addSubview(seasonOpener)
    }

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

}
