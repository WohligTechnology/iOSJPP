//
//  WebController.swift
//  JPP
//
//  Created by Chintan Shah on 27/01/16.
//  Copyright © 2016 Wohlig Technology. All rights reserved.
//

import UIKit

class VideoPlayController: UIViewController {
    
    @IBOutlet weak var webView: UIWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = NSURL (string:  "https://www.youtube.com/embed/"+videoIDGlo+"?autoplay=1&modestbranding=1&showinfo=0&rel=0&loop=1");
        let requestObj = NSURLRequest(URL: url!);
        webView.loadRequest(requestObj);
        
        self.title = "Video";
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
