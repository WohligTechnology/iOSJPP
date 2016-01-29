//
//  AllWebViewController.swift
//  JPP
//
//  Created by Chintan Shah on 29/01/16.
//  Copyright © 2016 Wohlig Technology. All rights reserved.
//

import UIKit

class AllWebViewController: UIViewController {

    @IBOutlet weak var webView: UIWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(mediaUrl);
        let url = NSURL (string:  mediaUrl);
        let requestObj = NSURLRequest(URL: url!);
        webView.loadRequest(requestObj);


        // Do any additional setup after loading the view.
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
