//
//  MerchandiseViewController.swift
//  JPP
//
//  Created by Harsh Thakkar on 04/07/16.
//  Copyright © 2016 Wohlig Technology. All rights reserved.
//

import UIKit

class MerchandiseViewController: UIViewController {

    @IBOutlet weak var merchandiseKit: UIImageView!
    @IBOutlet weak var merchandiseText: UIImageView!
    @IBOutlet weak var merchandiseButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setNavigationBarItemText("MERCHANDISE")
        
        merchandiseKit.layer.zPosition = 10000
        merchandiseText.layer.zPosition = 10000
        merchandiseButton.layer.zPosition = 10000
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "bookMerchandise" {
            let WebController:BookTicketController = segue.destination as! BookTicketController
            let theUrl = URL(string: "http://www.didasportswear.com/jaipur-pink-panthers.html")
            WebController.url = theUrl
        }
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
