//
//  ZoneUI.swift
//  JPP
//
//  Created by Pranay Joshi on 02/08/17.
//  Copyright © 2017 Wohlig Technology. All rights reserved.
//

import UIKit

class ZoneUI: UIView {

    @IBOutlet weak var zoneView: UIView!
    @IBOutlet weak var zoneLabel: UILabel!
    override init(frame: CGRect) {
        super.init(frame: frame)
        loadViewFromNib ()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func loadViewFromNib() {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: "ZoneUI", bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
        view.frame = bounds
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.addSubview(view);
    }
    

}
