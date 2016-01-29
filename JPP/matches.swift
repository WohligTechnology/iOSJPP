//
//  schedule.swift
//  JPP
//
//  Created by Chintan Shah on 25/01/16.
//  Copyright © 2016 Wohlig Technology. All rights reserved.
//

import UIKit

@IBDesignable class matches: UIView {
    
    @IBOutlet weak var matchesTeams: UILabel!
    @IBOutlet weak var matchesDate: UILabel!
    @IBAction func addCalenderTap(sender: AnyObject) {
        print(matchesDate.text!);
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "dd MMM yyyy, HH:mm"
        let event2Time = dateFormatter.dateFromString(matchesDate.text!)!
        print(event2Time);
        createEvent(matchesTeams.text!, EventTime: event2Time)
        
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