//
//  MatchUpdateController.swift
//  JPP
//
//  Created by Harsh Thakkar on 04/07/16.
//  Copyright © 2016 Wohlig Technology. All rights reserved.
//

import UIKit
import SwiftyJSON

class MatchUpdateController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var matchupdateTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.setNavigationBarItemText("MATCH UPDATE")
        loadingInit()
        self.view.addSubview(loaderGlo)
        
        rest.getMatchUpdate(matchupdateLoaded)
    }
    
    var matchupdateJSON = JSON([])
    
    func matchupdateLoaded (json:JSON) {
        if json == 1 {
            let alertController = UIAlertController(title: "No Connection", message:
                "Please check your internet connection", preferredStyle: UIAlertControllerStyle.Alert)
            alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.Default,handler: nil))
            self.presentViewController(alertController, animated: true, completion: nil)
        }
        else {
            matchupdateJSON = json
            dispatch_async(dispatch_get_main_queue(),{
                self.matchupdateTableView.reloadData()
            });
        }
        dispatch_async(dispatch_get_main_queue(), {
            loadingStop()
        });
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return matchupdateJSON.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        tableView.rowHeight = 330.0
        tableView.separatorStyle = UITableViewCellSeparatorStyle.None
        tableView.tableFooterView = UIView()
        let cell = tableView.dequeueReusableCellWithIdentifier("matchupdateCell", forIndexPath: indexPath)
        cell.selectionStyle = UITableViewCellSelectionStyle.None
        
        if((matchupdateJSON[indexPath.row]["matchtime"].string) != nil) {
            let matchupdateView = matchupdate(frame: CGRectMake(0,0,self.view.frame.width-16,322));
            matchupdateView.matchTitle.text = "MATCH - " + String(indexPath.row + 1)
            matchupdateView.teamoneImage.image = UIImage(named: "t" + matchupdateJSON[indexPath.row]["team1id"].string! + ".png")
            matchupdateView.teamtwoImage.image = UIImage(named: "t" + matchupdateJSON[indexPath.row]["team2id"].string! + ".png")
            matchupdateView.stadiumName.text = matchupdateJSON[indexPath.row]["stadium"].string
            matchupdateView.matchTime.text = matchupdateJSON[indexPath.row]["starttimedate"].string
            matchupdateView.matchTotalTime.text = matchupdateJSON[indexPath.row]["matchtime"].string
            matchupdateView.teamoneScore.text = matchupdateJSON[indexPath.row]["score1"].string
            matchupdateView.teamtwoScore.text = matchupdateJSON[indexPath.row]["score2"].string
            cell.addSubview(matchupdateView)
        }
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
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
