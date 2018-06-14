//
//  GalleryInsideController.swift
//  JPP
//
//  Created by Chintan Shah on 26/01/16.
//  Copyright © 2016 Wohlig Technology. All rights reserved.
//

import UIKit

class GalleryInsideController: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate {
    
    
    override func viewDidAppear(_ animated: Bool) {
        
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
        navigationItem.leftBarButtonItem?.setTitleTextAttributes([kCTFontAttributeName as NSAttributedStringKey: UIFont(name: "Oswald-Light", size: 20)!], for: UIControlState())
        
        
        //        self.setNavigationBarItemText("GALLERY INSIDE")
        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var galleryTable: UICollectionView!
    
    var jsonData = JSON([])
    
    func newsLoaded (_ json:JSON) {
        
        if(json == 1)
        {
            let alertController = UIAlertController(title: "No Connection", message:
                "Please check your internet connection", preferredStyle: UIAlertControllerStyle.alert)
            alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.default,handler: nil))
            
            self.present(alertController, animated: true, completion: nil)
        }
        else
        {
            
            jsonData = json;
            print("hellogallery\(jsonData)")
            DispatchQueue.main.async(execute: {
                self.galleryTable.reloadData()
            });
            
        }
        DispatchQueue.main.async(execute: {
            loadingStop()
        });
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return jsonData.count;
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "thumbnail", for: indexPath) as UICollectionViewCell
        //        cell.addSubview(thumbnailImage(frame: CGRectMake(8,8,cell.frame.width - 8,cell.frame.height - 8)));
//        cell.layer.transform = CATransform3DMakeScale(0.1,0.1,1)
        
        if((jsonData[indexPath.row]["name"].string) != nil) {
            let mediaBox = thumbnailImage(frame: CGRect(x: 8,y: 8,width: cell.frame.width-8,height: 230));
            mediaBox.thumbImage.hnk_setImageFromURL(rest.getImageThumbCache(jsonData[indexPath.row]["image"].string!))
            cell.addSubview(mediaBox)
        }
        return cell
    }
    
    func collectionView(_ collectionView : UICollectionView,layout collectionViewLayout:UICollectionViewLayout,sizeForItemAtIndexPath indexPath:IndexPath) -> CGSize
    {
        
        return CGSize(width: self.view.frame.width/2 - 4 ,height: self.view.frame.width/2)
    }
    
    func collectionView(_ collectionView: UICollectionView,
        didSelectItemAt indexPath: IndexPath) {
            
            galleryImage = jsonData[indexPath.row]["image"].string!
            
            
            performSegue(withIdentifier: "galleryImageDetail", sender: nil)
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
