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
    
    @IBOutlet weak var bookTickets: UIButton!
    @IBOutlet weak var buttonHolder: UIStackView!
    @IBOutlet weak var bookTicket: UIButton!
    @IBOutlet weak var addCalender: UIButton!
    var bookURL:String!;
    
    @IBOutlet weak var addCalender2: UIButton!
    @IBOutlet weak var addCalenderConstrain: NSLayoutConstraint!
    @IBAction func addCalenderTap(_ sender: AnyObject) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMM yyyy, HH:mm"
        let event2Time = dateFormatter.date(from: matchesDate.text!)!
        createEvent(matchesTeams.text!, EventTime: event2Time)
        let alertController = UIAlertController(title: "Match added to your Calender", message:
            "", preferredStyle: UIAlertControllerStyle.alert)
        alertController.addAction(UIAlertAction(title: "Continue", style: UIAlertActionStyle.default,handler: nil))
        SchduleCtrlGlo.present(alertController, animated: true, completion: nil)
    }
    @IBAction func bookTicketTap(_ sender: AnyObject) {

        GlobalBookTicketURL = bookURL;
        SchduleCtrlGlo.performSegue(withIdentifier: "bookWeb", sender: nil)
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
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: "matches", bundle: bundle)
        let sortnewview = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
        sortnewview.frame = bounds
        sortnewview.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.addSubview(sortnewview);
    }
    
    
    
}
