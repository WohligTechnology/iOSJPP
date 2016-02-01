//
//  NewsController.swift
//  JPP
//
//  Created by Chintan Shah on 26/01/16.
//  Copyright © 2016 Wohlig Technology. All rights reserved.
//

import UIKit
import SwiftyJSON
class NewsController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var newsTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setNavigationBarItemText("NEWS & MEDIA")
        
        loadingInit()
        self.view.addSubview(loaderGlo)
        
        rest.getNews(newsLoaded)
        
    }
    
    var newsJSON = JSON([])
    
    func newsLoaded (json:JSON) {
     
        if(json == 1)
        {
            let alertController = UIAlertController(title: "No Connection", message:
                "Please check your internet connection", preferredStyle: UIAlertControllerStyle.Alert)
            alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.Default,handler: nil))
            
            self.presentViewController(alertController, animated: true, completion: nil)
        }
        else
        {
            newsJSON = json;
            dispatch_async(dispatch_get_main_queue(),{
                self.newsTableView.reloadData()
            });
           
        }
        dispatch_async(dispatch_get_main_queue(), {
            loadingStop()
        });
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newsJSON.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        tableView.rowHeight = 240.0
        tableView.separatorStyle = UITableViewCellSeparatorStyle.None
        tableView.tableFooterView = UIView()
        let cell = tableView.dequeueReusableCellWithIdentifier("mediaCell", forIndexPath: indexPath)
        
        
        
        if((newsJSON[indexPath.row]["name"].string) != nil) {
            let mediaBox = media(frame: CGRectMake(0,8,self.view.frame.width-16,230));
//            mediaBox.mediaTitle.text = newsJSON[indexPath.row]["name"].string
            mediaBox.mediaDesc.text = newsJSON[indexPath.row]["name"].string
            mediaBox.mediaDate.text = newsJSON[indexPath.row]["timestamp"].string
            mediaBox.mediaImage.hnk_setImageFromURL(rest.getImageThumbCache(newsJSON[indexPath.row]["image"].string!))
            cell.addSubview(mediaBox)
        }
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        newsImage = newsJSON[indexPath.row]["image"].string!
        newsTitle = newsJSON[indexPath.row]["name"].string!
        newsDate = newsJSON[indexPath.row]["timestamp"].string!
        newsContent = newsJSON[indexPath.row]["content"].string!
        
        mediaUrl = newsJSON[indexPath.row]["content"].string!
        
         performSegueWithIdentifier("newsExternal", sender: nil)
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
