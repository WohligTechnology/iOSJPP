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
    @IBOutlet weak var city: UITextField!
    @IBOutlet weak var facbook: UIButton!
    @IBOutlet weak var twitter: UIButton!
    @IBOutlet weak var instagram: UIButton!
    
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
    @IBOutlet weak var button18: UIButton!
    @IBOutlet weak var button19: UIButton!
    @IBOutlet weak var button20: UIButton!
    
    
    
    @IBOutlet weak var teamname1: UILabel!
    @IBOutlet weak var teamname2: UILabel!
    @IBOutlet weak var teamname3: UILabel!
    @IBOutlet weak var teamname4: UILabel!
    @IBOutlet weak var teamname5: UILabel!
    @IBOutlet weak var teamname6: UILabel!
    @IBOutlet weak var teamname7: UILabel!
    @IBOutlet weak var teamname8: UILabel!
    @IBOutlet weak var teamname9: UILabel!
    @IBOutlet weak var teamname10: UILabel!
    @IBOutlet weak var teamname11: UILabel!
    @IBOutlet weak var teamname12: UILabel!
    @IBOutlet weak var teamname13: UILabel!
    @IBOutlet weak var teamname14: UILabel!
    @IBOutlet weak var teamname15: UILabel!
    @IBOutlet weak var teamName16: UILabel!
    @IBOutlet weak var teamName17: UILabel!
    @IBOutlet weak var teamName18: UILabel!
    @IBOutlet weak var teamName19: UILabel!
    @IBOutlet weak var teamName20: UILabel!
    
    
    
    
    
    var checkb1 = 0, checkb2 = 0, checkb3 = 0, checkb4 = 0,
    checkb5 = 0, checkb6 = 0, checkb7 = 0, checkb8 = 0,
    checkb9 = 0, checkb10 = 0, checkb11 = 0, checkb12 = 0,
    checkb13 = 0, checkb14 = 0, checkb15 = 0, checkb16 = 0, checkb17 = 0, checkb18 = 0, checkb19 = 0, checkb20 = 0
    
    var favouriteplayer = ""
    
    var borderColor = UIColor(red: 0, green: 176/255, blue: 174/255, alpha: 1)
    
    @IBAction func submitForm(_ sender: AnyObject) {
        
        favouriteplayer = String(favouriteplayer.characters.dropLast())
        favouriteplayer = favouriteplayer.trimmingCharacters(in: CharacterSet.whitespaces)
        print("submit \(favouriteplayer)")
        
        if(firstName.text == "" || lastName.text == "" || mobile.text == "" || email.text == "" || city.text == "") {
            let alertE = UIAlertController(title: "Please enter all details", message:"", preferredStyle: .alert)
            alertE.addAction(UIAlertAction(title: "OK", style: .default) { _ in })
            fanControllerGlobal.present(alertE, animated: true){}
        } else {
            rest.sendFanCorner(firstName.text!, lastname: lastName.text!, mobile: mobile.text!, email: email.text!, city: city.text!, favouriteplayer: favouriteplayer) {
                (json:JSON) -> Void in
                print(json)
            }
            
            let alert = UIAlertController(title: "Thank You", message:"", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default) { _ in })
            fanControllerGlobal.present(alert, animated: true){}
        }
        
        self.firstName.text = ""
        self.lastName.text = ""
        self.mobile.text = ""
        self.email.text = ""
        self.city.text = ""
        favouriteplayer = ""
        
        button1.backgroundColor = UIColor.white; checkb1 = 0
        button2.backgroundColor = UIColor.white; checkb2 = 0
        button3.backgroundColor = UIColor.white; checkb3 = 0
        button4.backgroundColor = UIColor.white; checkb4 = 0
        button5.backgroundColor = UIColor.white; checkb5 = 0
        button6.backgroundColor = UIColor.white; checkb6 = 0
        button7.backgroundColor = UIColor.white; checkb7 = 0
        button8.backgroundColor = UIColor.white; checkb8 = 0
        button9.backgroundColor = UIColor.white; checkb9 = 0
        button10.backgroundColor = UIColor.white; checkb10 = 0
        button11.backgroundColor = UIColor.white; checkb11 = 0
        button12.backgroundColor = UIColor.white; checkb12 = 0
        button13.backgroundColor = UIColor.white; checkb13 = 0
        button14.backgroundColor = UIColor.white; checkb14 = 0
        button15.backgroundColor = UIColor.white; checkb15 = 0
        button16.backgroundColor = UIColor.white; checkb16 = 0
        button17.backgroundColor = UIColor.white; checkb17 = 0
        button18.backgroundColor = UIColor.white; checkb18 = 0
        button19.backgroundColor = UIColor.white; checkb19 = 0
//        button20.backgroundColor = UIColor.white; checkb20 = 0
        
    }
    
    @IBAction func checkbutton1(_ sender: AnyObject) { // Anil Patil
        
        if (checkb1 == 0) {
            button1.backgroundColor = borderColor
            favouriteplayer += players[0].name + ","
            print("checkbox: \(favouriteplayer)")
            checkb1 = 1
        } else {
            button1.backgroundColor = UIColor.white
            favouriteplayer = favouriteplayer.replacingOccurrences(of: players[0].name + ",", with: "")
            checkb1 = 0
        }
    }
    
    @IBAction func checkbutton2(_ sender: AnyObject) {
        if (checkb2 == 0) {
            button2.backgroundColor = borderColor
            favouriteplayer += players[1].name + ","
            print("checkbox: \(favouriteplayer)")
            checkb2 = 1
        } else {
            button2.backgroundColor = UIColor.white
            favouriteplayer = favouriteplayer.replacingOccurrences(of: players[1].name + ",", with: "")
            checkb2 = 0
        }
    }
    
    @IBAction func checkbutton3(_ sender: AnyObject) {
        if (checkb3 == 0) {
            button3.backgroundColor = borderColor
            favouriteplayer += players[2].name + ","
            print("checkbox: \(favouriteplayer)")
            checkb3 = 1
        } else {
            button3.backgroundColor = UIColor.white
            favouriteplayer = favouriteplayer.replacingOccurrences(of: players[2].name + ",", with: "")
            checkb3 = 0
        }
    }
    
    @IBAction func checkbutton4(_ sender: AnyObject) {
        if (checkb4 == 0) {
            button4.backgroundColor = borderColor
            favouriteplayer += players[3].name + ","
            print("checkbox: \(favouriteplayer)")
            checkb4 = 1
        } else {
            button4.backgroundColor = UIColor.white
            favouriteplayer = favouriteplayer.replacingOccurrences(of: players[3].name + ",", with: "")
            checkb4 = 0
        }
    }
    
    @IBAction func checkbutton5(_ sender: AnyObject) {
        if (checkb5 == 0) {
            button5.backgroundColor = borderColor
            favouriteplayer += players[4].name + ","
            print("checkbox: \(favouriteplayer)")
            checkb5 = 1
        } else {
            button5.backgroundColor = UIColor.white
            favouriteplayer = favouriteplayer.replacingOccurrences(of: players[4].name + ",", with: "")
            checkb5 = 0
        }
    }
    
    @IBAction func checkbutton6(_ sender: AnyObject) {
        if (checkb6 == 0) {
            button6.backgroundColor = borderColor
            favouriteplayer += players[5].name + ","
            print("checkbox: \(favouriteplayer)")
            checkb6 = 1
        } else {
            button6.backgroundColor = UIColor.white
            favouriteplayer = favouriteplayer.replacingOccurrences(of: players[5].name + ",", with: "")
            checkb6 = 0
        }
    }
    
    @IBAction func checkbutton7(_ sender: AnyObject) {
        if (checkb7 == 0) {
            button7.backgroundColor = borderColor
            favouriteplayer += players[6].name + ","
            print("checkbox: \(favouriteplayer)")
            checkb7 = 1
        } else {
            button7.backgroundColor = UIColor.white
            favouriteplayer = favouriteplayer.replacingOccurrences(of: players[6].name + ",", with: "")
            checkb7 = 0
        }
    }
    
    @IBAction func checkbutton8(_ sender: AnyObject) {
        if (checkb8 == 0) {
            button8.backgroundColor = borderColor
            favouriteplayer += players[7].name + ","
            print("checkbox: \(favouriteplayer)")
            checkb8 = 1
        } else {
            button8.backgroundColor = UIColor.white
            favouriteplayer = favouriteplayer.replacingOccurrences(of: players[7].name + ",", with: "")
            checkb8 = 0
        }
    }
    
//    @IBAction func checkbutton9(sender: AnyObject) {
//        if (checkb9 == 0) {
//            button9.backgroundColor = borderColor
//            favouriteplayer += players[8].name + ","
//            print("checkbox: \(favouriteplayer)")
//            checkb9 = 1
//        } else {
//            button9.backgroundColor = UIColor.whiteColor()
//            favouriteplayer = favouriteplayer.stringByReplacingOccurrencesOfString(players[8].name + ",", withString: "")
//            checkb9 = 0
//        }
//    }
    
    @IBAction func checkbutton9(_ sender: AnyObject) {
        if (checkb9 == 0) {
            button9.backgroundColor = borderColor
            favouriteplayer += players[8].name + ","
            print("checkbox: \(favouriteplayer)")
            checkb9 = 1
        } else {
            button9.backgroundColor = UIColor.white
            favouriteplayer = favouriteplayer.replacingOccurrences(of: players[8].name + ",", with: "")
            checkb9 = 0
        }
    }
    
    @IBAction func checkbutton10(_ sender: AnyObject) {
        if (checkb10 == 0) {
            button10.backgroundColor = borderColor
            favouriteplayer += players[9].name + ","
            print("checkbox: \(favouriteplayer)")
            checkb10 = 1
        } else {
            button10.backgroundColor = UIColor.white
            favouriteplayer = favouriteplayer.replacingOccurrences(of: players[9].name + ",", with: "")
            checkb10 = 0
        }
    }
    
    @IBAction func checkbutton11(_ sender: AnyObject) {
        if (checkb11 == 0) {
            button11.backgroundColor = borderColor
            favouriteplayer += players[10].name + ","
            print("checkbox: \(favouriteplayer)")
            checkb11 = 1
        } else {
            button11.backgroundColor = UIColor.white
            favouriteplayer = favouriteplayer.replacingOccurrences(of: players[10].name + ",", with: "")
            checkb11 = 0
        }
    }
    
    @IBAction func checkbutton12(_ sender: AnyObject) {
        if (checkb12 == 0) {
            button12.backgroundColor = borderColor
            favouriteplayer += players[11].name + ","
            print("checkbox: \(favouriteplayer)")
            checkb12 = 1
        } else {
            button12.backgroundColor = UIColor.white
            favouriteplayer = favouriteplayer.replacingOccurrences(of: players[11].name + ",", with: "")
            checkb12 = 0
        }
    }
    
    @IBAction func checkbutton13(_ sender: AnyObject) {
        if (checkb13 == 0) {
            button13.backgroundColor = borderColor
            favouriteplayer += players[12].name + ","
            print("checkbox: \(favouriteplayer)")
            checkb13 = 1
        } else {
            button13.backgroundColor = UIColor.white
            favouriteplayer = favouriteplayer.replacingOccurrences(of: players[12].name + ",", with: "")
            checkb13 = 0
        }
    }
    
    @IBAction func checkbutton14(_ sender: AnyObject) {
        if (checkb14 == 0) {
            button14.backgroundColor = borderColor
            favouriteplayer += players[13].name + ","
            print("checkbox: \(favouriteplayer)")
            checkb14 = 1
        } else {
            button14.backgroundColor = UIColor.white
            favouriteplayer = favouriteplayer.replacingOccurrences(of: players[13].name + ",", with: "")
            checkb14 = 0
        }
    }
    
    @IBAction func checkbutton15(_ sender: AnyObject) {
        if (checkb15 == 0) {
            button15.backgroundColor = borderColor
            favouriteplayer += players[14].name + ","
            print("checkbox: \(favouriteplayer)")
            checkb15 = 1
        } else {
            button15.backgroundColor = UIColor.white
            favouriteplayer = favouriteplayer.replacingOccurrences(of: players[14].name + ",", with: "")
            checkb15 = 0
        }
    }

    @IBAction func checkButton16(_ sender: Any) {
        if (checkb16 == 0) {
            button16.backgroundColor = borderColor
            favouriteplayer += players[15].name + ","
            print("checkbox: \(favouriteplayer)")
            checkb16 = 1
        } else {
            button16.backgroundColor = UIColor.white
            favouriteplayer = favouriteplayer.replacingOccurrences(of: players[15].name + ",", with: "")
            checkb16 = 0
        }

    }
    
    @IBAction func checkButton17(_ sender: Any) {
        if (checkb17 == 0) {
            button17.backgroundColor = borderColor
            favouriteplayer += players[16].name + ","
            print("checkbox: \(favouriteplayer)")
            checkb17 = 1
        } else {
            button17.backgroundColor = UIColor.white
            favouriteplayer = favouriteplayer.replacingOccurrences(of: players[16].name + ",", with: "")
            checkb17 = 0
        }
    }
    
    @IBAction func checkButton18(_ sender: Any) {
        if (checkb18 == 0) {
            button18.backgroundColor = borderColor
            favouriteplayer += players[17].name + ","
            print("checkbox: \(favouriteplayer)")
            checkb18 = 1
        } else {
            button18.backgroundColor = UIColor.white
            favouriteplayer = favouriteplayer.replacingOccurrences(of: players[17].name + ",", with: "")
            checkb18 = 0
        }
 
    }
    @IBAction func checkButton19(_ sender: Any) {
        if (checkb19 == 0) {
            button19.backgroundColor = borderColor
            favouriteplayer += players[18].name + ","
            print("checkbox: \(favouriteplayer)")
            checkb19 = 1
        } else {
            button19.backgroundColor = UIColor.white
            favouriteplayer = favouriteplayer.replacingOccurrences(of: players[18].name + ",", with: "")
            checkb19 = 0
        }

    }
    @IBAction func checkButton20(_ sender: Any) {
//        if (checkb20 == 0) {
//            button20.backgroundColor = borderColor
//            favouriteplayer += players[19].name + ","
//            print("checkbox: \(favouriteplayer)")
//            checkb20 = 1
//        } else {
//            button20.backgroundColor = UIColor.white
//            favouriteplayer = favouriteplayer.replacingOccurrences(of: players[19].name + ",", with: "")
//            checkb20 = 0
//        }
    }
//    @IBAction func checkbutton17(sender: AnyObject) {
//        if (checkb17 == 0) {
//            button17.backgroundColor = borderColor
//            favouriteplayer += " Wei Yang Tsai ,"
//            print("checkbox: \(favouriteplayer)")
//            checkb17 = 1
//        } else {
//            button17.backgroundColor = UIColor.whiteColor()
//            favouriteplayer = favouriteplayer.stringByReplacingOccurrencesOfString(" Wei Yang Tsai ,", withString: "")
//            checkb17 = 0
//        }
//    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        loadViewFromNib ()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        loadViewFromNib ()
        
    }
    
    
    
    
    func loadViewFromNib() {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: "fanCorner", bundle: bundle)
        let sortnewview = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
        sortnewview.frame = bounds
        sortnewview.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.addSubview(sortnewview);
        
        let borderWidth:CGFloat = 0.5
        
        //team name
        teamname1.text = players[0].name
        teamname2.text = players[1].name
        teamname3.text = players[2].name
        teamname4.text = players[3].name
        teamname5.text = players[4].name
        teamname6.text = players[5].name
        teamname7.text = players[6].name
        teamname8.text = players[7].name
        teamname9.text = players[8].name
        teamname10.text = players[9].name
        teamname11.text = players[10].name
        teamname12.text = players[11].name
        teamname13.text = players[12].name
        teamname14.text = players[13].name
        teamname15.text = players[14].name
        teamName16.text = players[15].name
        teamName17.text = players[16].name
        teamName18.text = players[17].name
        teamName19.text = players[18].name
//        teamName20.text = players[19].name
        
        // BORDER
        firstName.layer.borderWidth = borderWidth
        firstName.layer.borderColor = borderColor.cgColor
        self.lastName.layer.borderWidth = borderWidth
        self.lastName.layer.borderColor = borderColor.cgColor
        self.mobile.layer.borderWidth = borderWidth
        self.mobile.layer.borderColor = borderColor.cgColor
        self.email.layer.borderWidth = borderWidth
        self.email.layer.borderColor = borderColor.cgColor
        city.layer.borderWidth = borderWidth
        city.layer.borderColor = borderColor.cgColor
        
        // BUTTON BORDER
        button1.layer.borderWidth = borderWidth
        button1.layer.borderColor = borderColor.cgColor
        button2.layer.borderWidth = borderWidth
        button2.layer.borderColor = borderColor.cgColor
        button3.layer.borderWidth = borderWidth
        button3.layer.borderColor = borderColor.cgColor
        button4.layer.borderWidth = borderWidth
        button4.layer.borderColor = borderColor.cgColor
        button5.layer.borderWidth = borderWidth
        button5.layer.borderColor = borderColor.cgColor
        button6.layer.borderWidth = borderWidth
        button6.layer.borderColor = borderColor.cgColor
        button7.layer.borderWidth = borderWidth
        button7.layer.borderColor = borderColor.cgColor
        button8.layer.borderWidth = borderWidth
        button8.layer.borderColor = borderColor.cgColor
        button9.layer.borderWidth = borderWidth
        button9.layer.borderColor = borderColor.cgColor
        button10.layer.borderWidth = borderWidth
        button10.layer.borderColor = borderColor.cgColor
        button11.layer.borderWidth = borderWidth
        button11.layer.borderColor = borderColor.cgColor
        button12.layer.borderWidth = borderWidth
        button12.layer.borderColor = borderColor.cgColor
        button13.layer.borderWidth = borderWidth
        button13.layer.borderColor = borderColor.cgColor
        button14.layer.borderWidth = borderWidth
        button14.layer.borderColor = borderColor.cgColor
        button15.layer.borderWidth = borderWidth
        button15.layer.borderColor = borderColor.cgColor
        button16.layer.borderWidth = borderWidth
        button16.layer.borderColor = borderColor.cgColor
        button17.layer.borderWidth = borderWidth
        button17.layer.borderColor = borderColor.cgColor
        button18.layer.borderWidth = borderWidth
        button18.layer.borderColor = borderColor.cgColor
        button19.layer.borderWidth = borderWidth
        button19.layer.borderColor = borderColor.cgColor
//        button20.layer.borderWidth = borderWidth
//        button20.layer.borderColor = borderColor.cgColor
        
        // PADDING
        let firstPad = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: self.firstName.frame.height))
        firstName.leftView = firstPad
        firstName.leftViewMode = UITextFieldViewMode.always
        let lastPad = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: self.lastName.frame.height))
        lastName.leftView = lastPad
        lastName.leftViewMode = UITextFieldViewMode.always
        let mobilePad = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: self.mobile.frame.height))
        mobile.leftView = mobilePad
        mobile.leftViewMode = UITextFieldViewMode.always
        let emailPad = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: self.email.frame.height))
        email.leftView = emailPad
        email.leftViewMode = UITextFieldViewMode.always
        let cityPad = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: self.email.frame.height))
        city.leftView = cityPad
        city.leftViewMode = UITextFieldViewMode.always
        
        self.firstName.text = ""
        self.lastName.text = ""
        self.mobile.text = ""
        self.email.text = ""
        
    }
    
}

class TextField: UITextField {
    
    let padding = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)
    
    fileprivate func newBounds(_ bounds: CGRect) -> CGRect {
        var newBounds = bounds
        newBounds.origin.x += padding.left
        newBounds.origin.y += padding.top
        newBounds.size.height -= padding.top + padding.bottom
        newBounds.size.width -= padding.left + padding.right
        return newBounds
    }
    
}
