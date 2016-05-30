//
//  seasonOpener.swift
//  JPP
//
//  Created by Harsh Thakkar on 30/05/16.
//  Copyright © 2016 Wohlig Technology. All rights reserved.
//

import UIKit

@IBDesignable class seasonOpener: UIView {
    
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
        let nib = UINib(nibName: "seasonOpener", bundle: bundle)
        let seasonOpener = nib.instantiateWithOwner(self, options: nil)[0] as! UIView
        seasonOpener.frame = bounds
        seasonOpener.autoresizingMask = [.FlexibleWidth, .FlexibleHeight]
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
