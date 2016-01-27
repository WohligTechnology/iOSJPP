//
//  GalleryController.swift
//  JPP
//
//  Created by Chintan Shah on 26/01/16.
//  Copyright © 2016 Wohlig Technology. All rights reserved.
//

import UIKit

class GalleryController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    var activeGal = 0;
    
    @IBOutlet weak var photosButton: UIButton!
    @IBOutlet weak var videosButton: UIButton!
    
    var pinkBar:UIView!
    
    @IBAction func videoButtonTap(sender: AnyObject) {
        
        pinkBar.frame.origin.x = self.view.frame.width/2;
        
    }
    @IBAction func photoButtonTap(sender: AnyObject) {
        
        pinkBar.frame.origin.x = 0;
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setNavigationBarItemText("GALLERY")
        
        pinkBar = UIView(frame: CGRectMake(0,photosButton.frame.height,self.view.frame.width/2,2));
        pinkBar.backgroundColor = PinkColor;
        
        
        self.view.addSubview(pinkBar)
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        tableView.rowHeight = 230.0
        tableView.separatorStyle = UITableViewCellSeparatorStyle.None
        tableView.tableFooterView = UIView()
        let cell = tableView.dequeueReusableCellWithIdentifier("galCell", forIndexPath: indexPath)
        
        let mediaBox = galleryAlbum(frame: CGRectMake(8,16,self.view.frame.width-16,230));
        
        cell.addSubview(mediaBox)
        
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
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
