//
//  GalleryController.swift
//  JPP
//
//  Created by Chintan Shah on 26/01/16.
//  Copyright © 2016 Wohlig Technology. All rights reserved.
//

import UIKit
import SwiftyJSON
import Haneke

class GalleryController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    var activeGal = 0;
    
    @IBOutlet weak var photoTableView: UITableView!
    @IBOutlet weak var photosButton: UIButton!
    @IBOutlet weak var videosButton: UIButton!
    
    var pinkBar:UIView!
    
    @IBAction func videoButtonTap(sender: AnyObject) {
        if(activeGal != 1) {
            loadingStart()
            activeGal = 1;
            pinkBar.frame.origin.x = self.view.frame.width/2;
            rest.getVideo(GalleryLoaded)
        }
    }
    @IBAction func photoButtonTap(sender: AnyObject) {
        if(activeGal != 0) {
            loadingStart()
            activeGal = 0;
            pinkBar.frame.origin.x = 0;
            rest.getGallery(GalleryLoaded)
        }
        
    }
    
    var photosJson = JSON([])
    
    func GalleryLoaded (json:JSON) {
        if(json == 1)
        {
            let alertController = UIAlertController(title: "No Connection", message:
                "Please check your internet connection", preferredStyle: UIAlertControllerStyle.Alert)
            alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.Default,handler: nil))
            
            self.presentViewController(alertController, animated: true, completion: nil)
        }
        else
        {
            photosJson = json;
            dispatch_async(dispatch_get_main_queue(),{
                self.photoTableView.reloadData()
            });
           
        }
        dispatch_async(dispatch_get_main_queue(), {
            loadingStop()
        });
    }
    override func viewDidAppear(animated: Bool) {
        
        self.view.addSubview(loaderGlo)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setNavigationBarItemText("GALLERY")
        
        pinkBar = UIView(frame: CGRectMake(0,photosButton.frame.height,self.view.frame.width/2,3));
        pinkBar.backgroundColor = PinkColor;
        
        
        self.view.addSubview(pinkBar)
        
        loadingInit()
        self.view.addSubview(loaderGlo)
        
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
        if(activeGal == 0 ) {
            if((photosJson[indexPath.row]["image"].string) != nil) {
                let mediaBox = galleryAlbum(frame: CGRectMake(8,16,self.view.frame.width-16,200));
                mediaBox.galleryTitle.text = photosJson[indexPath.row]["name"].stringValue
                mediaBox.galleryBanner.hnk_setImageFromURL(rest.getImageCache(photosJson[indexPath.row]["image"].string!))
                cell.addSubview(mediaBox)
            }
        }
        if(activeGal == 1 ) {
            if((photosJson[indexPath.row]["image"].string) != nil) {
                let mediaBox = galleryAlbum(frame: CGRectMake(8,16,self.view.frame.width-16,200));
                mediaBox.galleryTitle.text = photosJson[indexPath.row]["name"].stringValue
                let image = photosJson[indexPath.row]["url"].stringValue;
                mediaBox.galleryBanner.hnk_setImageFromURL(rest.getImageExternalCacheURL(rest.getYoutubeImage(image)) )
                cell.addSubview(mediaBox)
            }
        }
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if(activeGal == 0)
        {
            GalleryInsideTitle = photosJson[indexPath.row]["name"].string!
            galleryID = photosJson[indexPath.row]["id"].string!
            performSegueWithIdentifier("galleryDetail", sender: nil)
        }
        if(activeGal == 1)
        {
            videoIDGlo = photosJson[indexPath.row]["url"].string!
            performSegueWithIdentifier("videoOpen", sender: nil)
        }
    }
}
