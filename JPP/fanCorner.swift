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
    
    var checkb1 = 0, checkb2 = 0, checkb3 = 0, checkb4 = 0,
    checkb5 = 0, checkb6 = 0, checkb7 = 0, checkb8 = 0,
    checkb9 = 0, checkb10 = 0, checkb11 = 0, checkb12 = 0,
    checkb13 = 0, checkb14 = 0, checkb15 = 0, checkb16 = 0, checkb17 = 0
    
    var favouriteplayer = ""
    
    var borderColor = UIColor(red: 0, green: 176/255, blue: 174/255, alpha: 1)
    
    @IBAction func submitForm(sender: AnyObject) {
        
        favouriteplayer = String(favouriteplayer.characters.dropLast())
        favouriteplayer = favouriteplayer.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceCharacterSet())
        print("submit \(favouriteplayer)")
        
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
        favouriteplayer = ""
        
        button1.backgroundColor = UIColor.whiteColor(); checkb1 = 0
        button2.backgroundColor = UIColor.whiteColor(); checkb2 = 0
        button3.backgroundColor = UIColor.whiteColor(); checkb3 = 0
        button4.backgroundColor = UIColor.whiteColor(); checkb4 = 0
        button5.backgroundColor = UIColor.whiteColor(); checkb5 = 0
        button6.backgroundColor = UIColor.whiteColor(); checkb6 = 0
        button7.backgroundColor = UIColor.whiteColor(); checkb7 = 0
        button8.backgroundColor = UIColor.whiteColor(); checkb8 = 0
        button9.backgroundColor = UIColor.whiteColor(); checkb9 = 0
        button10.backgroundColor = UIColor.whiteColor(); checkb10 = 0
        button11.backgroundColor = UIColor.whiteColor(); checkb11 = 0
        button12.backgroundColor = UIColor.whiteColor(); checkb12 = 0
        button13.backgroundColor = UIColor.whiteColor(); checkb13 = 0
        button14.backgroundColor = UIColor.whiteColor(); checkb14 = 0
        button15.backgroundColor = UIColor.whiteColor(); checkb15 = 0
        button16.backgroundColor = UIColor.whiteColor(); checkb16 = 0
        button17.backgroundColor = UIColor.whiteColor(); checkb17 = 0
        
    }
    
    @IBAction func checkbutton1(sender: AnyObject) { // Anil Patil
        if (checkb1 == 0) {
            button1.backgroundColor = borderColor
            favouriteplayer += " Anil Patil ,"
            print("checkbox: \(favouriteplayer)")
            checkb1 = 1
        } else {
            button1.backgroundColor = UIColor.whiteColor()
            favouriteplayer = favouriteplayer.stringByReplacingOccurrencesOfString(" Anil Patil ,", withString: "")
            checkb1 = 0
        }
    }
    
    @IBAction func checkbutton2(sender: AnyObject) {
        if (checkb2 == 0) {
            button2.backgroundColor = borderColor
            favouriteplayer += " C. Arun ,"
            print("checkbox: \(favouriteplayer)")
            checkb2 = 1
        } else {
            button2.backgroundColor = UIColor.whiteColor()
            favouriteplayer = favouriteplayer.stringByReplacingOccurrencesOfString(" C. Arun ,", withString: "")
            checkb2 = 0
        }
    }
    
    @IBAction func checkbutton3(sender: AnyObject) {
        if (checkb3 == 0) {
            button3.backgroundColor = borderColor
            favouriteplayer += " Gangadhari Mallesh ,"
            print("checkbox: \(favouriteplayer)")
            checkb3 = 1
        } else {
            button3.backgroundColor = UIColor.whiteColor()
            favouriteplayer = favouriteplayer.stringByReplacingOccurrencesOfString(" Gangadhari Mallesh ,", withString: "")
            checkb3 = 0
        }
    }
    
    @IBAction func checkbutton4(sender: AnyObject) {
        if (checkb4 == 0) {
            button4.backgroundColor = borderColor
            favouriteplayer += " Jagdeesha K.K ,"
            print("checkbox: \(favouriteplayer)")
            checkb4 = 1
        } else {
            button4.backgroundColor = UIColor.whiteColor()
            favouriteplayer = favouriteplayer.stringByReplacingOccurrencesOfString(" Jagdeesha K.K ,", withString: "")
            checkb4 = 0
        }
    }
    
    @IBAction func checkbutton5(sender: AnyObject) {
        if (checkb5 == 0) {
            button5.backgroundColor = borderColor
            favouriteplayer += " Jasvir Singh ,"
            print("checkbox: \(favouriteplayer)")
            checkb5 = 1
        } else {
            button5.backgroundColor = UIColor.whiteColor()
            favouriteplayer = favouriteplayer.stringByReplacingOccurrencesOfString(" Jasvir Singh ,", withString: "")
            checkb5 = 0
        }
    }
    
    @IBAction func checkbutton6(sender: AnyObject) {
        if (checkb6 == 0) {
            button6.backgroundColor = borderColor
            favouriteplayer += " Kuldeep Singh ,"
            print("checkbox: \(favouriteplayer)")
            checkb6 = 1
        } else {
            button6.backgroundColor = UIColor.whiteColor()
            favouriteplayer = favouriteplayer.stringByReplacingOccurrencesOfString(" Kuldeep Singh ,", withString: "")
            checkb6 = 0
        }
    }
    
    @IBAction func checkbutton7(sender: AnyObject) {
        if (checkb7 == 0) {
            button7.backgroundColor = borderColor
            favouriteplayer += " Mohammad Maghsodlou ,"
            print("checkbox: \(favouriteplayer)")
            checkb7 = 1
        } else {
            button7.backgroundColor = UIColor.whiteColor()
            favouriteplayer = favouriteplayer.stringByReplacingOccurrencesOfString(" Mohammad Maghsodlou ,", withString: "")
            checkb7 = 0
        }
    }
    
    @IBAction func checkbutton8(sender: AnyObject) {
        if (checkb8 == 0) {
            button8.backgroundColor = borderColor
            favouriteplayer += " Navneet Gautham ,"
            print("checkbox: \(favouriteplayer)")
            checkb8 = 1
        } else {
            button8.backgroundColor = UIColor.whiteColor()
            favouriteplayer = favouriteplayer.stringByReplacingOccurrencesOfString(" Navneet Gautham ,", withString: "")
            checkb8 = 0
        }
    }
    
    @IBAction func checkbutton9(sender: AnyObject) {
        if (checkb9 == 0) {
            button9.backgroundColor = borderColor
            favouriteplayer += " Rajesh Narwal ,"
            print("checkbox: \(favouriteplayer)")
            checkb9 = 1
        } else {
            button9.backgroundColor = UIColor.whiteColor()
            favouriteplayer = favouriteplayer.stringByReplacingOccurrencesOfString(" Rajesh Narwal ,", withString: "")
            checkb9 = 0
        }
    }
    
    @IBAction func checkbutton10(sender: AnyObject) {
        if (checkb10 == 0) {
            button10.backgroundColor = borderColor
            favouriteplayer += " Raju Lal Choudhary ,"
            print("checkbox: \(favouriteplayer)")
            checkb10 = 1
        } else {
            button10.backgroundColor = UIColor.whiteColor()
            favouriteplayer = favouriteplayer.stringByReplacingOccurrencesOfString(" Raju Lal Choudhary ,", withString: "")
            checkb10 = 0
        }
    }
    
    @IBAction func checkbutton11(sender: AnyObject) {
        if (checkb11 == 0) {
            button11.backgroundColor = borderColor
            favouriteplayer += " Ran Singh ,"
            print("checkbox: \(favouriteplayer)")
            checkb11 = 1
        } else {
            button11.backgroundColor = UIColor.whiteColor()
            favouriteplayer = favouriteplayer.stringByReplacingOccurrencesOfString(" Ran Singh ,", withString: "")
            checkb11 = 0
        }
    }
    
    @IBAction func checkbutton12(sender: AnyObject) {
        if (checkb12 == 0) {
            button12.backgroundColor = borderColor
            favouriteplayer += " Rohit Kumar Prajapati ,"
            print("checkbox: \(favouriteplayer)")
            checkb12 = 1
        } else {
            button12.backgroundColor = UIColor.whiteColor()
            favouriteplayer = favouriteplayer.stringByReplacingOccurrencesOfString(" Rohit Kumar Prajapati ,", withString: "")
            checkb12 = 0
        }
    }
    
    @IBAction func checkbutton13(sender: AnyObject) {
        if (checkb13 == 0) {
            button13.backgroundColor = borderColor
            favouriteplayer += " Rohit Rana ,"
            print("checkbox: \(favouriteplayer)")
            checkb13 = 1
        } else {
            button13.backgroundColor = UIColor.whiteColor()
            favouriteplayer = favouriteplayer.stringByReplacingOccurrencesOfString(" Rohit Rana ,", withString: "")
            checkb13 = 0
        }
    }
    
    @IBAction func checkbutton14(sender: AnyObject) {
        if (checkb14 == 0) {
            button14.backgroundColor = borderColor
            favouriteplayer += " Sanjay Shrestha ,"
            print("checkbox: \(favouriteplayer)")
            checkb14 = 1
        } else {
            button14.backgroundColor = UIColor.whiteColor()
            favouriteplayer = favouriteplayer.stringByReplacingOccurrencesOfString(" Sanjay Shrestha ,", withString: "")
            checkb14 = 0
        }
    }
    
    @IBAction func checkbutton15(sender: AnyObject) {
        if (checkb15 == 0) {
            button15.backgroundColor = borderColor
            favouriteplayer += " Samarjeet Singh ,"
            print("checkbox: \(favouriteplayer)")
            checkb15 = 1
        } else {
            button15.backgroundColor = UIColor.whiteColor()
            favouriteplayer = favouriteplayer.stringByReplacingOccurrencesOfString(" Samarjeet Singh ,", withString: "")
            checkb15 = 0
        }
    }
    
    @IBAction func checkbutton16(sender: AnyObject) {
        if (checkb16 == 0) {
            button16.backgroundColor = borderColor
            favouriteplayer += " Sonu Narwal ,"
            print("checkbox: \(favouriteplayer)")
            checkb16 = 1
        } else {
            button16.backgroundColor = UIColor.whiteColor()
            favouriteplayer = favouriteplayer.stringByReplacingOccurrencesOfString(" Sonu Narwal ,", withString: "")
            checkb16 = 0
        }
    }
    
    @IBAction func checkbutton17(sender: AnyObject) {
        if (checkb17 == 0) {
            button17.backgroundColor = borderColor
            favouriteplayer += " Wei Yang Tsai ,"
            print("checkbox: \(favouriteplayer)")
            checkb17 = 1
        } else {
            button17.backgroundColor = UIColor.whiteColor()
            favouriteplayer = favouriteplayer.stringByReplacingOccurrencesOfString(" Wei Yang Tsai ,", withString: "")
            checkb17 = 0
        }
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
