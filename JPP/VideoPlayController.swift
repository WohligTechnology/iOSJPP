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
        
        let url = NSURL (string:  "https://www.youtube.com/embed/"+videoIDGlo);
        let requestObj = NSURLRequest(URL: url!);
        webView.loadRequest(requestObj);
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
