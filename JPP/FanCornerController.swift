//
//  FanCornerController.swift
//  JPP
//
//  Created by Chintan Shah on 08/02/16.
//  Copyright © 2016 Wohlig Technology. All rights reserved.
//

import UIKit
import SwiftyJSON
class FanCornerController: UIViewController {
    var verticalLayout : VerticalLayout!
    @IBOutlet var scrollView: UIScrollView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setNavigationBarItemText("FAN CORNER")
        
        self.verticalLayout = VerticalLayout(width: self.view.frame.width);
        self.scrollView.insertSubview(self.verticalLayout, atIndex: 0)
        var height:CGFloat = 525;
        print(self.view.frame.height);
        if(self.view.frame.height > height)
        {
            height = self.scrollView.frame.height + 20
        }
        
        let fan = fanCorner(frame: CGRectMake(8,8,self.verticalLayout.frame.width-16,height));
        self.verticalLayout.addSubview(fan);
        
        
        
        resizeView(8)
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
