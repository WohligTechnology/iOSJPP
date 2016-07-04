//
//  matchupdate.swift
//  JPP
//
//  Created by Harsh Thakkar on 04/07/16.
//  Copyright © 2016 Wohlig Technology. All rights reserved.
//

import UIKit

class macthupdate: UIView {
    
    @IBOutlet weak var matchTitle: UILabel!
    @IBOutlet weak var teamoneImage: UIImageView!
    @IBOutlet weak var teamtwoImage: UIImageView!
    @IBOutlet weak var stadiumName: UILabel!
    @IBOutlet weak var matchTime: UILabel!
    @IBOutlet weak var matchTotalTime: UILabel!
    @IBOutlet weak var teamoneScore: UILabel!
    @IBOutlet weak var teamtwoScore: UILabel!
    
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
        let nib = UINib(nibName: "macthupdate", bundle: bundle)
        let macthupdate = nib.instantiateWithOwner(self, options: nil)[0] as! UIView
        macthupdate.frame = bounds
        macthupdate.autoresizingMask = [.FlexibleWidth, .FlexibleHeight]
        self.addSubview(macthupdate);
    }
}
