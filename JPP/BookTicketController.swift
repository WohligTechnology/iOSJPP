//
//  BookTicketController.swift
//  JPP
//
//  Created by Chintan Shah on 27/01/16.
//  Copyright © 2016 Wohlig Technology. All rights reserved.
//

import UIKit

class BookTicketController: UIViewController {

    @IBOutlet weak var webView: UIWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = NSURL (string:  "http://in.bookmyshow.com/sports/kabaddi/jaipur-pink-panthers/?utm_source=web_prokabaddi&utm_medium=referral&utm_campaign=web_prokabaddi_011816");
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
