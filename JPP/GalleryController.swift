//
//  GalleryController.swift
//  JPP
//
//  Created by Chintan Shah on 26/01/16.
//  Copyright © 2016 Wohlig Technology. All rights reserved.
//

import UIKit
import SwiftyJSON

class GalleryController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    var activeGal = 0;
    
    @IBOutlet weak var photoTableView: UITableView!
    @IBOutlet weak var photosButton: UIButton!
    @IBOutlet weak var videosButton: UIButton!
    
    var pinkBar:UIView!
    
    @IBAction func videoButtonTap(sender: AnyObject) {
        
        pinkBar.frame.origin.x = self.view.frame.width/2;
        
    }
    @IBAction func photoButtonTap(sender: AnyObject) {
        
        pinkBar.frame.origin.x = 0;
    }
    
    var photosJson = JSON([])
    
    func GalleryLoaded (json:JSON) {
        photosJson = json;
        dispatch_async(dispatch_get_main_queue(),{
            self.photoTableView.reloadData()
        });
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setNavigationBarItemText("GALLERY")
        
        pinkBar = UIView(frame: CGRectMake(0,photosButton.frame.height,self.view.frame.width/2,2));
        pinkBar.backgroundColor = PinkColor;
        
        
        self.view.addSubview(pinkBar)
        rest.getGallery(GalleryLoaded)
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return photosJson.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        tableView.rowHeight = 208.0
        tableView.separatorStyle = UITableViewCellSeparatorStyle.None
        tableView.tableFooterView = UIView()
        let cell = tableView.dequeueReusableCellWithIdentifier("galCell", forIndexPath: indexPath)
        
//        print(photosJson);
        if((photosJson[indexPath.row]["image"].string) != nil) {
            let mediaBox = galleryAlbum(frame: CGRectMake(8,16,self.view.frame.width-16,200));
            mediaBox.galleryTitle.text = photosJson[indexPath.row]["name"].stringValue
            mediaBox.galleryBanner.image = rest.getThumb(photosJson[indexPath.row]["image"].string!)
            cell.addSubview(mediaBox)
        }
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        galleryID = photosJson[indexPath.row]["id"].string!
        performSegueWithIdentifier("galleryDetail", sender: nil)
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
