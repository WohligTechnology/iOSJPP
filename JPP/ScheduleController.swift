//
//  ScheduleController.swift
//  JPP
//
//  Created by Chintan Shah on 26/01/16.
//  Copyright © 2016 Wohlig Technology. All rights reserved.
//

import UIKit

class ScheduleController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    var verticalLayout : VerticalLayout!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setNavigationBarItemText("SCHEDULE")
        
        self.verticalLayout = VerticalLayout(width: self.view.frame.width);
        self.scrollView.insertSubview(self.verticalLayout, atIndex: 0)
        
        let upcoming = schedule(frame: CGRectMake(8,8,verticalLayout.frame.width-16,370));
        self.verticalLayout.addSubview(upcoming);

        
        upcoming.trapLabel.text="UPCOMING MATCH";
        
        
        let whiteView = UIView(frame:CGRectMake(0,8,verticalLayout.frame.width,1000));
        
        whiteView.backgroundColor = UIColor.whiteColor()
        
        let trap = trapezium(frame: CGRectMake(8,0,verticalLayout.frame.width-16,34));
        resizeView(8);
        whiteView.addSubview(trap);
        trap.trapeziumTitle.text="OTHER MATCHES";
        
        self.verticalLayout.addSubview(whiteView);
        
        
        let topSpacing = 32;
        let spacingPink = 8;
        
        
        for(var i=0;i<3;i++)
        {
            
            let topDistance = topSpacing+spacingPink+((65+spacingPink)*(i));
            let insideTable = matches(frame: CGRectMake(8,CGFloat(topDistance),verticalLayout.frame.width-16,65));
            whiteView.frame.size.height = CGFloat(topDistance+65+8);
            whiteView.addSubview(insideTable);
        }
        
        
        

        resizeView(8);
        
        
        
       
        
    }
    
    func resizeView(offset:CGFloat)
    {
        self.verticalLayout.layoutSubviews()
        self.scrollView.contentSize = CGSize(width: self.verticalLayout.frame.width, height: self.verticalLayout.frame.height + offset)
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
