//
//  matchupdate.swift
//  JPP
//
//  Created by Harsh Thakkar on 04/07/16.
//  Copyright © 2016 Wohlig Technology. All rights reserved.
//

import UIKit

@IBDesignable class matchupdate: UIView {
    
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
        let nib = UINib(nibName: "matchupdate", bundle: bundle)
        let matchupdate = nib.instantiateWithOwner(self, options: nil)[0] as! UIView
        matchupdate.frame = bounds
        matchupdate.autoresizingMask = [.FlexibleWidth, .FlexibleHeight]
        self.addSubview(matchupdate);
    }
}
