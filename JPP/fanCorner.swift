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
    @IBOutlet weak var city: UITextField!
    
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button4: UIButton!
    @IBOutlet weak var button5: UIButton!
    @IBOutlet weak var button6: UIButton!
    @IBOutlet weak var button7: UIButton!
    @IBOutlet weak var button8: UIButton!
    @IBOutlet weak var button9: UIButton!
    
    @IBOutlet weak var button10: UIButton!
    @IBOutlet weak var button11: UIButton!
    @IBOutlet weak var button12: UIButton!
    @IBOutlet weak var button13: UIButton!
    @IBOutlet weak var button14: UIButton!
    @IBOutlet weak var button15: UIButton!
    @IBOutlet weak var button16: UIButton!
    @IBOutlet weak var button17: UIButton!
    
    var favouriteplayer = ""
    
    var borderColor = UIColor(red: 0, green: 176/255, blue: 174/255, alpha: 1)
    
    @IBAction func submitForm(sender: AnyObject) {
        
        if(firstName.text == "" || lastName.text == "" || mobile.text == "" || email.text == "" || city.text == "") {
            let alertE = UIAlertController(title: "Please enter all details", message:"", preferredStyle: .Alert)
            alertE.addAction(UIAlertAction(title: "OK", style: .Default) { _ in })
            fanControllerGlobal.presentViewController(alertE, animated: true){}
        } else {
            rest.sendFanCorner(firstName.text!, lastname: lastName.text!, mobile: mobile.text!, email: email.text!, city: city.text!, favouriteplayer: favouriteplayer) {
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
        self.city.text = ""
        
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
        
        let borderWidth:CGFloat = 0.5
        
        // BORDER
        firstName.layer.borderWidth = borderWidth
        firstName.layer.borderColor = borderColor.CGColor
        self.lastName.layer.borderWidth = borderWidth
        self.lastName.layer.borderColor = borderColor.CGColor
        self.mobile.layer.borderWidth = borderWidth
        self.mobile.layer.borderColor = borderColor.CGColor
        self.email.layer.borderWidth = borderWidth
        self.email.layer.borderColor = borderColor.CGColor
        city.layer.borderWidth = borderWidth
        city.layer.borderColor = borderColor.CGColor
        
        // BUTTON BORDER
        button1.layer.borderWidth = borderWidth
        button1.layer.borderColor = borderColor.CGColor
        button2.layer.borderWidth = borderWidth
        button2.layer.borderColor = borderColor.CGColor
        button3.layer.borderWidth = borderWidth
        button3.layer.borderColor = borderColor.CGColor
        button4.layer.borderWidth = borderWidth
        button4.layer.borderColor = borderColor.CGColor
        button5.layer.borderWidth = borderWidth
        button5.layer.borderColor = borderColor.CGColor
        button6.layer.borderWidth = borderWidth
        button6.layer.borderColor = borderColor.CGColor
        button7.layer.borderWidth = borderWidth
        button7.layer.borderColor = borderColor.CGColor
        button8.layer.borderWidth = borderWidth
        button8.layer.borderColor = borderColor.CGColor
        button9.layer.borderWidth = borderWidth
        button9.layer.borderColor = borderColor.CGColor
        button10.layer.borderWidth = borderWidth
        button10.layer.borderColor = borderColor.CGColor
        button11.layer.borderWidth = borderWidth
        button11.layer.borderColor = borderColor.CGColor
        button12.layer.borderWidth = borderWidth
        button12.layer.borderColor = borderColor.CGColor
        button13.layer.borderWidth = borderWidth
        button13.layer.borderColor = borderColor.CGColor
        button14.layer.borderWidth = borderWidth
        button14.layer.borderColor = borderColor.CGColor
        button15.layer.borderWidth = borderWidth
        button15.layer.borderColor = borderColor.CGColor
        button16.layer.borderWidth = borderWidth
        button16.layer.borderColor = borderColor.CGColor
        button17.layer.borderWidth = borderWidth
        button17.layer.borderColor = borderColor.CGColor
        
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
        let cityPad = UIView(frame: CGRectMake(0, 0, 10, self.email.frame.height))
        city.leftView = cityPad
        city.leftViewMode = UITextFieldViewMode.Always
        
        self.firstName.text = ""
        self.lastName.text = ""
        self.mobile.text = ""
        self.email.text = ""
        
    }
    
    var checkb1 = 0
    
    @IBAction func checkbutton1(sender: AnyObject) {
        if (checkb1 == 0) {
            button1.backgroundColor = UIColor.whiteColor()
            checkb1 = 1
        } else {
            button1.backgroundColor = borderColor
            checkb1 = 0
        }
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
