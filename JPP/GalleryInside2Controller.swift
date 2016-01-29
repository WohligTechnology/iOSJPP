//
//  GalleryInside2Controller.swift
//  JPP
//
//  Created by Chintan Shah on 26/01/16.
//  Copyright © 2016 Wohlig Technology. All rights reserved.
//

import UIKit
import SwiftyJSON
var gal2Global:GalleryInside2Controller!;

class GalleryInside2Controller: UIViewController {

    @IBOutlet weak var fullView: singleThumbnailImage!
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        gal2Global = self;
        
        fullView.openImage.hnk_setImageFromURL(rest.getImageCache(galleryImage))
        
//        self.setNavigationBarItemText("GALLERY INSIDE 2")
        // Do any additional setup after loading the view.
        loadingStop()
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
