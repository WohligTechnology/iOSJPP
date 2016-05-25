//
//  FanCornerController.swift
//  JPP
//
//  Created by Chintan Shah on 08/02/16.
//  Copyright © 2016 Wohlig Technology. All rights reserved.
//

import UIKit
import SwiftyJSON

var fanControllerGlobal:FanCornerController!

class FanCornerController: UIViewController {
    var verticalLayout : VerticalLayout!
    @IBOutlet var scrollView: UIScrollView!
    //@IBOutlet var submitButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        fanControllerGlobal = self;
        self.setNavigationBarItemText("FAN CORNER")
        
        self.verticalLayout = VerticalLayout(width: self.view.frame.width);
        self.scrollView.insertSubview(self.verticalLayout, atIndex: 0)
        //var height:CGFloat = 525
        var height:CGFloat = 910
        print(self.view.frame.height);
        if(self.view.frame.height > height)
        {
            height = self.scrollView.frame.height + 20
        }
        
        let fan = fanCorner(frame: CGRectMake(8,8,self.verticalLayout.frame.width-16,height));
        self.verticalLayout.addSubview(fan);
        
        //submitButton.addTarget(self, action: "submitFormButton:", forControlEvents: .TouchUpInside)
        
        resizeView(8)
    }
    
    func submitFormButton(sender: UIButton) {
        let alert = UIAlertController(title: "Thank You", message: "", preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default,handler: nil))
        self.presentViewController(alert, animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func resizeView(offset:CGFloat)
    {
        self.verticalLayout.layoutSubviews()
        self.scrollView.contentSize = CGSize(width: self.verticalLayout.frame.width, height: self.verticalLayout.frame.height + offset)
    }
    
}
