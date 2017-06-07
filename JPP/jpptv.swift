//
//  jpptv.swift
//  JPP
//
//  Created by Harsh Thakkar on 26/05/16.
//  Copyright © 2016 Wohlig Technology. All rights reserved.
//

import UIKit

@IBDesignable class jpptv: UIView {
    
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
        let nib = UINib(nibName: "jpptv", bundle: bundle)
        let jpptv = nib.instantiateWithOwner(self, options: nil)[0] as! UIView
        jpptv.frame = bounds
        jpptv.autoresizingMask = [.FlexibleWidth, .FlexibleHeight]
        self.addSubview(jpptv)
    }

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

}
