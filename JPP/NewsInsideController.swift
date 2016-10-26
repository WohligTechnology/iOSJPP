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
        self.scrollView.insertSubview(self.verticalLayout, at: 0)
        
        
        let insideView = newsDetail(frame: CGRect(x: 8,y: 8,width: self.view.frame.width-16,height: 700));
        self.title = newsTitle
        insideView.newsTitle.text = newsTitle;
        insideView.newImgae.hnk_setImageFromURL(rest.getImageThumbCache(newsImage))
        insideView.newsDate.text = newsDate;
        insideView.newsContent.text = newsContent;
        insideView.frame.size.height = insideView.newsContent.frame.size.height + insideView.newImgae.frame.size.height - 100
        
        self.verticalLayout.addSubview(insideView)
        
        // Do any additional setup after
        resizeView(8);
        
    }
    
    func resizeView(_ offset:CGFloat)
    {
        self.verticalLayout.layoutSubviews()
        self.scrollView.contentSize = CGSize(width: self.verticalLayout.frame.width, height: self.verticalLayout.frame.height + offset)
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
