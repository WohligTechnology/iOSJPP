//
//  AboutController.swift
//  JPP
//
//  Created by Chintan Shah on 26/01/16.
//  Copyright © 2016 Wohlig Technology. All rights reserved.
//

import UIKit

class AboutController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    var verticalLayout : VerticalLayout!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setNavigationBarItemText("ABOUT US")
        
        
        self.verticalLayout = VerticalLayout(width: self.view.frame.width);
        self.scrollView.insertSubview(self.verticalLayout, atIndex: 0)
        
        self.verticalLayout.addSubview(about(frame: CGRectMake(8,8,verticalLayout.frame.width-16,300)));
        
        self.verticalLayout.addSubview(trapezium(frame: CGRectMake(8,8,verticalLayout.frame.width-16,34)))
        
        
        
        self.verticalLayout.addSubview(team(frame: CGRectMake(8,0,verticalLayout.frame.width-16,150)))
        
        self.verticalLayout.addSubview(team(frame: CGRectMake(8,0,verticalLayout.frame.width-16,150)))
        
        self.verticalLayout.addSubview(team(frame: CGRectMake(8,0,verticalLayout.frame.width-16,150)))
        
        self.verticalLayout.addSubview(team(frame: CGRectMake(8,0,verticalLayout.frame.width-16,150)))
        
        resizeView(8)
        
        
        
        
        // Do any additional setup after loading the view.
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
