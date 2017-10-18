//
//  GalleryController.swift
//  JPP
//
//  Created by Chintan Shah on 26/01/16.
//  Copyright © 2016 Wohlig Technology. All rights reserved.
//

import UIKit
import Haneke

class GalleryController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    var activeGal = 0
    
    @IBOutlet weak var photoTableView: UITableView!
    @IBOutlet weak var photosButton: UIButton!
    @IBOutlet weak var videosButton: UIButton!
    
    var pinkBar:UIView!
    
    @IBAction func videoButtonTap(_ sender: AnyObject) {
        if(activeGal != 1) {
            loadingStart()
            activeGal = 1;
            //pinkBar.frame.origin.x = self.view.frame.width/2;
            rest.getVideo(GalleryLoaded)
        }
    }
    @IBAction func photoButtonTap(_ sender: AnyObject) {
        if(activeGal != 0) {
            loadingStart()
            activeGal = 0;
            //pinkBar.frame.origin.x = 0;
            rest.getGallery(GalleryLoaded)
        }
        
    }
    
    var photosJson = JSON([])
    
    func GalleryLoaded (_ json:JSON) {
        if(json == 1)
        {
            let alertController = UIAlertController(title: "No Connection", message:
                "Please check your internet connection", preferredStyle: UIAlertControllerStyle.alert)
            alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.default,handler: nil))
            
            self.present(alertController, animated: true, completion: nil)
        }
        else
        {
            photosJson = json;
            print("gallery\(photosJson)")
            DispatchQueue.main.async(execute: {
                self.photoTableView.reloadData()
            });
           
        }
        DispatchQueue.main.async(execute: {
            loadingStop()
        });
    }
    override func viewDidAppear(_ animated: Bool) {
        
        self.view.addSubview(loaderGlo)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if(activeGal != 0) {
            self.setNavigationBarItemText("JPP TV")
        } else if(activeGal != 1) {
            self.setNavigationBarItemText("GALLERY")
        }
        
        pinkBar = UIView(frame: CGRect(x: 0,y: photosButton.frame.height,width: self.view.frame.width/2,height: 3));
        pinkBar.backgroundColor = PinkColor;
        
        //self.view.addSubview(pinkBar)
        
        loadingInit()
        self.view.addSubview(loaderGlo)
        
        rest.getGallery(GalleryLoaded)
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return photosJson.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        tableView.rowHeight = 208.0
        tableView.separatorStyle = UITableViewCellSeparatorStyle.none
        tableView.tableFooterView = UIView()
        let cell = tableView.dequeueReusableCell(withIdentifier: "galCell", for: indexPath)
        cell.selectionStyle = UITableViewCellSelectionStyle.none
        
        if(activeGal == 0 ) {
            if((photosJson[indexPath.row]["image"].string) != nil) {
                var mediaBox = galleryAlbum(frame: CGRect(x: 8,y: 0,width: self.view.frame.width-16,height: 200))
                 if(photosJson[0]).boolValue {
                    mediaBox = galleryAlbum(frame: CGRect(x: 8,y: 16,width: self.view.frame.width-16,height: 200))
                }
        
                mediaBox.galleryTitle.text = photosJson[indexPath.row]["name"].stringValue
                mediaBox.galleryBanner.hnk_setImageFromURL(rest.getImageCache(photosJson[indexPath.row]["image"].string!))
                mediaBox.galleryTitleBackView.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.70)
                
                cell.addSubview(mediaBox)
            }
        }
        if(activeGal == 1 ) {
            if((photosJson[indexPath.row]["image"].string) != nil) {
                var mediaBox = galleryAlbum(frame: CGRect(x: 8,y: 0,width: self.view.frame.width-16,height: 200))
                if(photosJson[0]).boolValue {
                    mediaBox = galleryAlbum(frame: CGRect(x: 8,y: 16,width: self.view.frame.width-16,height: 200))
                }
                rest.getVideo(GalleryLoaded)
                mediaBox.galleryTitle.text = photosJson[indexPath.row]["name"].stringValue
                let image = photosJson[indexPath.row]["url"].stringValue;
                
                mediaBox.galleryBanner.hnk_setImageFromURL(rest.getImageExternalCacheURL(rest.getYoutubeImage(image)) )
                
                cell.addSubview(mediaBox)
            }
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if(activeGal == 0)
        {
            GalleryInsideTitle = photosJson[indexPath.row]["name"].string!
            galleryID = photosJson[indexPath.row]["id"].string!
            performSegue(withIdentifier: "galleryDetail", sender: nil)
        }
        if(activeGal == 1)
        {
            rest.getVideo(GalleryLoaded)
            videoIDGlo = photosJson[indexPath.row]["url"].string!
            performSegue(withIdentifier: "videoOpen", sender: nil)
        }
    }
}
