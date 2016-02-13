//
//  PointTableController.swift
//  JPP
//
//  Created by Chintan Shah on 26/01/16.
//  Copyright © 2016 Wohlig Technology. All rights reserved.
//

import UIKit
import SwiftyJSON
class PointTableController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var pointTable: UITableView!
    @IBOutlet weak var tableHeader: table!
    
    let font = UIFont(name: "Oswald-Bold", size: 14.0)
    let lightBlueColor = UIColor(red: 196/255, green: 240/255, blue: 255/255, alpha: 1)
    
    override func viewDidAppear(animated: Bool) {
        
        self.view.addSubview(loaderGlo)
    }
     
    override func viewDidLoad() {
        super.viewDidLoad()
        

        loadingInit()
        self.view.addSubview(loaderGlo)
        
        rest.getPointTable(pointLoaded)
        self.setNavigationBarItemText("POINTS TABLE")
        tableHeader.tableNo.font = font
        tableHeader.tableNo.text = "No."
        
        
        tableHeader.tableTeam.font = font
        tableHeader.tableTeam.text = "Team"
        
        
        tableHeader.tablePlayed.font = font
        tableHeader.tablePlayed.text = "P"
        
        tableHeader.tableWon.font = font
        tableHeader.tableWon.text = "W"
        
        tableHeader.tableLost.font = font
        tableHeader.tableLost.text = "L"
        
        tableHeader.tablePoint.font = font
        tableHeader.tablePoint.text = "PTS"
        
        
        // Do any additional setup after loading the view.
    }

    var pointJson = JSON([])
    
    func pointLoaded (json:JSON) {
        
        print(json);
        
        if(json == 1)
        {
            let alertController = UIAlertController(title: "No Connection", message:
                "Please check your internet connection", preferredStyle: UIAlertControllerStyle.Alert)
            alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.Default,handler: nil))
            
            self.presentViewController(alertController, animated: true, completion: nil)
        }
        else
        {
            pointJson = json;
            dispatch_async(dispatch_get_main_queue(),{
                self.pointTable.reloadData()
            });
            
        }
        dispatch_async(dispatch_get_main_queue(), {
            loadingStop()
        });

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pointJson.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        tableView.separatorStyle = UITableViewCellSeparatorStyle.SingleLine
        tableView.allowsSelection = false
        tableView.tableFooterView = UIView()
        let cell = tableView.dequeueReusableCellWithIdentifier("pointTableCell", forIndexPath: indexPath)
        
        
        if((pointJson[indexPath.row]["name"].string) != nil) {
            let mediaBox = table(frame: CGRectMake(0,8,self.view.frame.width-32,230));
            mediaBox.tableTeam.text = pointJson[indexPath.row]["name"].string
            if (pointJson[indexPath.row]["name"].string == "Jaipur Pink Panthers") {
                mediaBox.tableTeam.font = font
                mediaBox.tableNo.font = font
                mediaBox.tablePlayed.font = font
                mediaBox.tableLost.font = font
                mediaBox.tableWon.font = font
                mediaBox.tablePoint.font = font
                
                mediaBox.backgroundColor = UIColor(red: 77/255, green: 203/255, blue: 244/255, alpha: 1)
                
//                mediaBox.tableTeam.textColor = lightBlueColor
//                mediaBox.tableNo.textColor = lightBlueColor
//                mediaBox.tablePlayed.textColor = lightBlueColor
//                mediaBox.tableLost.textColor = lightBlueColor
//                mediaBox.tableWon.textColor = lightBlueColor
//                mediaBox.tablePoint.textColor = lightBlueColor
            }
            mediaBox.tableNo.text = String(indexPath.row  + 1)
            mediaBox.tablePlayed.text = pointJson[indexPath.row]["played"].string
            mediaBox.tableLost.text = pointJson[indexPath.row]["lost"].string
            mediaBox.tableWon.text = pointJson[indexPath.row]["wins"].string
            mediaBox.tablePoint.text = pointJson[indexPath.row]["point"].string
            cell.addSubview(mediaBox)
        }
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
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
