//
//  SponsorsViewController.swift
//  JPP
//
//  Created by Pranay Joshi on 02/08/17.
//  Copyright © 2017 Wohlig Technology. All rights reserved.
//

import UIKit

class SponsorsViewController: UIViewController {
    var sponsorImage: JSON = []
    
    @IBOutlet weak var sponsorsImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setNavigationBarItem()
        rest.getSponsorImage({(json:JSON) -> () in
            DispatchQueue.main.sync(execute: {
                if json == 401 {
                    print("No Data Found")
                }else{
                    
                    print("hellojson\(json)")
                    self.sponsorImage = json
                    self.sponsorsImage.hnk_setImageFromURL(rest.getImageSizeCache(self.sponsorImage["image"].stringValue))
                    print("demodemodemo",self.sponsorsImage.frame.size.height)
                    
                }
            })
            
        })


        // Do any additional setup after loading the view.
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
