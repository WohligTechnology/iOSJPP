//
//  signupSection.swift
//  JPP
//
//  Created by Harsh Thakkar on 26/05/16.
//  Copyright © 2016 Wohlig Technology. All rights reserved.
//

import UIKit

class signupSection: UIView {
    
    @IBOutlet var signupMainView: UIView!
    @IBOutlet weak var signupButton: UIButton!
    
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
        let nib = UINib(nibName: "signupSection", bundle: bundle)
        let signupSection = nib.instantiateWithOwner(self, options: nil)[0] as! UIView
        signupSection.frame = bounds
        signupSection.autoresizingMask = [.FlexibleWidth, .FlexibleHeight]
        self.addSubview(signupSection)
        
        signupMainView.layer.cornerRadius = 2
        signupMainView.clipsToBounds = true
        
    }

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

}
