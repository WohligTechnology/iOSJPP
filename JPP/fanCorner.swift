//
//  schedule.swift
//  JPP
//
//  Created by Chintan Shah on 25/01/16.
//  Copyright © 2016 Wohlig Technology. All rights reserved.
//

import UIKit

@IBDesignable class fanCorner: UIView {
   
    @IBOutlet var firstName: UITextField!
    @IBOutlet var lastName: UITextField!
    @IBOutlet var mobile: UITextField!
    @IBOutlet var email: UITextField!
    
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
        let nib = UINib(nibName: "fanCorner", bundle: bundle)
        let sortnewview = nib.instantiateWithOwner(self, options: nil)[0] as! UIView
        sortnewview.frame = bounds
        sortnewview.autoresizingMask = [.FlexibleWidth, .FlexibleHeight]
        self.addSubview(sortnewview);
        
        let borderWidth:CGFloat = 1.0
        
        firstName.layer.borderWidth = borderWidth
        firstName.layer.borderColor = BlueColor.CGColor
        self.lastName.layer.borderWidth = borderWidth
        self.lastName.layer.borderColor = BlueColor.CGColor
        self.mobile.layer.borderWidth = borderWidth
        self.mobile.layer.borderColor = BlueColor.CGColor
        self.email.layer.borderWidth = borderWidth
        self.email.layer.borderColor = BlueColor.CGColor
        
    }
}
