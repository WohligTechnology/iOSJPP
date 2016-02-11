//
//  schedule.swift
//  JPP
//
//  Created by Chintan Shah on 25/01/16.
//  Copyright © 2016 Wohlig Technology. All rights reserved.
//

import UIKit
import SwiftyJSON

@IBDesignable class fanCorner: UIView {
   
    @IBOutlet var firstName: UITextField!
    @IBOutlet var lastName: UITextField!
    @IBOutlet var mobile: UITextField!
    @IBOutlet var email: UITextField!
    
    @IBAction func submitForm(sender: AnyObject) {
        
        if(firstName.text == "" || lastName.text == "" || mobile.text == "" || email.text == "") {
            let alertE = UIAlertController(title: "Please enter all details", message:"", preferredStyle: .Alert)
            alertE.addAction(UIAlertAction(title: "OK", style: .Default) { _ in })
            fanControllerGlobal.presentViewController(alertE, animated: true){}
        } else {
            rest.sendFanCorner(firstName.text!, lastname: lastName.text!, mobile: mobile.text!, email: email.text!) {
                (json:JSON) -> Void in
                print(json)
            }
            
            let alert = UIAlertController(title: "Thank You", message:"", preferredStyle: .Alert)
            alert.addAction(UIAlertAction(title: "OK", style: .Default) { _ in })
            fanControllerGlobal.presentViewController(alert, animated: true){}
        }
        
        self.firstName.text = ""
        self.lastName.text = ""
        self.mobile.text = ""
        self.email.text = ""
        
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
        let nib = UINib(nibName: "fanCorner", bundle: bundle)
        let sortnewview = nib.instantiateWithOwner(self, options: nil)[0] as! UIView
        sortnewview.frame = bounds
        sortnewview.autoresizingMask = [.FlexibleWidth, .FlexibleHeight]
        self.addSubview(sortnewview);
        
        let borderWidth:CGFloat = 1.0
        
        // BORDER
        firstName.layer.borderWidth = borderWidth
        firstName.layer.borderColor = BlueColor.CGColor
        self.lastName.layer.borderWidth = borderWidth
        self.lastName.layer.borderColor = BlueColor.CGColor
        self.mobile.layer.borderWidth = borderWidth
        self.mobile.layer.borderColor = BlueColor.CGColor
        self.email.layer.borderWidth = borderWidth
        self.email.layer.borderColor = BlueColor.CGColor
        
        // PADDING
        let firstPad = UIView(frame: CGRectMake(0, 0, 10, self.firstName.frame.height))
        firstName.leftView = firstPad
        firstName.leftViewMode = UITextFieldViewMode.Always
        let lastPad = UIView(frame: CGRectMake(0, 0, 10, self.lastName.frame.height))
        lastName.leftView = lastPad
        lastName.leftViewMode = UITextFieldViewMode.Always
        let mobilePad = UIView(frame: CGRectMake(0, 0, 10, self.mobile.frame.height))
        mobile.leftView = mobilePad
        mobile.leftViewMode = UITextFieldViewMode.Always
        let emailPad = UIView(frame: CGRectMake(0, 0, 10, self.email.frame.height))
        email.leftView = emailPad
        email.leftViewMode = UITextFieldViewMode.Always
        
        self.firstName.text = ""
        self.lastName.text = ""
        self.mobile.text = ""
        self.email.text = ""
        
    }
}

class TextField: UITextField {
    
    let padding = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)
    
    private func newBounds(bounds: CGRect) -> CGRect {
        var newBounds = bounds
        newBounds.origin.x += padding.left
        newBounds.origin.y += padding.top
        newBounds.size.height -= padding.top + padding.bottom
        newBounds.size.width -= padding.left + padding.right
        return newBounds
    }
    
}
