//
//  FacebookController.swift
//  JPP
//
//  Created by Pranay Joshi on 10/08/17.
//  Copyright © 2017 Wohlig Technology. All rights reserved.
//

import UIKit

class FacebookController: UIViewController {

    @IBOutlet weak var webView: UIWebView!
    var url: URL?
    override func viewDidLoad() {
        setNavigationBarItem1()
        super.viewDidLoad()

        // Do any additional setup after loading the view.
//        url = URL(string: "https://www.facebook.com/JaipurPinkPanthers/")
        let requestObj = URLRequest(url: url!);
        webView.loadRequest(requestObj);

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
