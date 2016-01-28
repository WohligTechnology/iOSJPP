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

    override func viewDidLoad() {
        super.viewDidLoad()
        if(isGalWal == 0)
        {
            rest.getGalleryById(galleryID,completion: newsLoaded)
        }
        else
        {
            self.setNavigationBarItemText("WALLPAPER")
            rest.getWallPaper(newsLoaded)
        }
        
        
        
        navigationItem.leftBarButtonItem?.setTitleTextAttributes([NSFontAttributeName: UIFont(name: "Oswald-Light", size: 20)!], forState: UIControlState.Normal)
        
        
//        self.setNavigationBarItemText("GALLERY INSIDE")
        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var galleryTable: UICollectionView!
    
    var jsonData = JSON([])
    
    func newsLoaded (json:JSON) {
        jsonData = json;
        print(json);
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
            mediaBox.thumbImage.image = rest.getImage(jsonData[indexPath.row]["image"].string!)
            
            cell.addSubview(mediaBox)
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
