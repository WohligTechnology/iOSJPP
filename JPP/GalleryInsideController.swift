//
//  GalleryInsideController.swift
//  JPP
//
//  Created by Chintan Shah on 26/01/16.
//  Copyright © 2016 Wohlig Technology. All rights reserved.
//

import UIKit
import SwiftyJSON

class GalleryInsideController: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate {

    
    override func viewDidAppear(animated: Bool) {
        
        self.view.addSubview(loaderGlo)
    }
    
    override func viewDidLoad() {
        
        loadingInit()
        self.view.addSubview(loaderGlo)
        super.viewDidLoad()
        if(isGalWal == 0)
        {
            self.title =  GalleryInsideTitle
            rest.getGalleryById(galleryID,completion: newsLoaded)
        }
        else
        {
            self.view.addSubview(loaderGlo)
            rest.getWallPaper(newsLoaded)
            self.setNavigationBarItemText("WALLPAPER")
        }
        navigationItem.leftBarButtonItem?.setTitleTextAttributes([NSFontAttributeName: UIFont(name: "Oswald-Light", size: 20)!], forState: UIControlState.Normal)
        
        
//        self.setNavigationBarItemText("GALLERY INSIDE")
        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var galleryTable: UICollectionView!
    
    var jsonData = JSON([])
    
    func newsLoaded (json:JSON) {
        jsonData = json;
        dispatch_async(dispatch_get_main_queue(),{
           self.galleryTable.reloadData()
        });
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return jsonData.count;
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("thumbnail", forIndexPath: indexPath) as UICollectionViewCell
//        cell.addSubview(thumbnailImage(frame: CGRectMake(8,8,cell.frame.width - 8,cell.frame.height - 8)));
        
        
        if((jsonData[indexPath.row]["name"].string) != nil) {
            let mediaBox = thumbnailImage(frame: CGRectMake(8,8,cell.frame.width-8,230));
            mediaBox.thumbImage.image = rest.getThumb(jsonData[indexPath.row]["image"].string!)
            
            cell.addSubview(mediaBox)
        }
        
        if(indexPath.row == jsonData.count-1)
        {
            loadingStop()
        }
        
        return cell
    }
    
    func collectionView(collectionView : UICollectionView,layout collectionViewLayout:UICollectionViewLayout,sizeForItemAtIndexPath indexPath:NSIndexPath) -> CGSize
    {
        
        return CGSizeMake(self.view.frame.width/2 - 4 ,self.view.frame.width/2)
    }
    
    func collectionView(collectionView: UICollectionView,
        didSelectItemAtIndexPath indexPath: NSIndexPath) {
            
            galleryImage = jsonData[indexPath.row]["image"].string!
        
            
            performSegueWithIdentifier("galleryImageDetail", sender: nil)
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
