//
//  NewsInsideController.swift
//  JPP
//
//  Created by Chintan Shah on 26/01/16.
//  Copyright © 2016 Wohlig Technology. All rights reserved.
//

import UIKit
import SwiftyJSON
class NewsInsideController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    
    var verticalLayout : VerticalLayout!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.verticalLayout = VerticalLayout(width: self.view.frame.width);
        self.scrollView.insertSubview(self.verticalLayout, atIndex: 0)
        
        
        let insideView = newsDetail(frame: CGRectMake(8,8,self.view.frame.width-16,700));
        
        insideView.newsTitle.text = newsTitle;
        insideView.newImgae.image = rest.getImage(newsImage);
        insideView.newsDate.text = newsDate;
        insideView.newsContent.text = newsContent;
        insideView.frame.size.height = insideView.newsContent.frame.size.height + insideView.newImgae.frame.size.height - 100
        
        self.verticalLayout.addSubview(insideView)
        
        // Do any additional setup after
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
