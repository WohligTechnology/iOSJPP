//
//  NewsController.swift
//  JPP
//
//  Created by Chintan Shah on 26/01/16.
//  Copyright © 2016 Wohlig Technology. All rights reserved.
//

import UIKit

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
    
    func newsLoaded (_ json:JSON) {
     
        print(json)
        if(json == 1)
        {
            let alertController = UIAlertController(title: "No Connection", message:
                "Please check your internet connection", preferredStyle: UIAlertControllerStyle.alert)
            alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.default,handler: nil))
            
            self.present(alertController, animated: true, completion: nil)
        }
        else
        {
            newsJSON = json;
            DispatchQueue.main.async(execute: {
                self.newsTableView.reloadData()
            });
           
        }
        DispatchQueue.main.async(execute: {
            loadingStop()
        });
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newsJSON.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        tableView.rowHeight = 420.0
        tableView.separatorStyle = UITableViewCellSeparatorStyle.none
        tableView.tableFooterView = UIView()
        let cell = tableView.dequeueReusableCell(withIdentifier: "mediaCell", for: indexPath)
        cell.selectionStyle = UITableViewCellSelectionStyle.none
        
        if((newsJSON[indexPath.row]["name"].string) != nil) {
            let mediaBox = media(frame: CGRect(x: 0,y: 8,width: self.view.frame.width-16,height: 410));
//            mediaBox.mediaTitle.text = newsJSON[indexPath.row]["name"].string
            mediaBox.mediaDesc.text = newsJSON[indexPath.row]["name"].string!
            mediaBox.mediaDate.text = newsJSON[indexPath.row]["timestamp"].string
            mediaBox.mediaImage.hnk_setImageFromURL(rest.getImageThumbCache(newsJSON[indexPath.row]["image"].string!))
             mediaBox.newsImage.hnk_setImageFromURL(rest.getImageThumbCache(newsJSON[indexPath.row]["logo"].string!))
            cell.addSubview(mediaBox)
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        newsImage = newsJSON[indexPath.row]["image"].string!
        newsTitle = newsJSON[indexPath.row]["name"].string!
        newsDate = newsJSON[indexPath.row]["timestamp"].string!
        newsContent = newsJSON[indexPath.row]["content"].string!
        
        mediaUrl = newsJSON[indexPath.row]["content"].string!
        
         performSegue(withIdentifier: "newsExternal", sender: nil)
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
