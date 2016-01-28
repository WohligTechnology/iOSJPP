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
    override func viewDidLoad() {
        super.viewDidLoad()
        
        rest.getPointTable(pointLoaded)
        self.setNavigationBarItemText("POINT TABLE")
        tableHeader.tableNo.font = UIFont(name:"Oswald-Bold", size: 14.0)
        tableHeader.tableNo.text = "No."
        
        
        tableHeader.tableTeam.font = UIFont(name:"Oswald-Bold", size: 14.0)
        tableHeader.tableTeam.text = "Team"
        
        
        tableHeader.tablePlayed.font = UIFont(name:"Oswald-Bold", size: 14.0)
        tableHeader.tablePlayed.text = "P"
        
        tableHeader.tableWon.font = UIFont(name:"Oswald-Bold", size: 14.0)
        tableHeader.tableWon.text = "W"
        
        tableHeader.tableLost.font = UIFont(name:"Oswald-Bold", size: 14.0)
        tableHeader.tableLost.text = "L"
        
        tableHeader.tablePoint.font = UIFont(name:"Oswald-Bold", size: 14.0)
        tableHeader.tablePoint.text = "PTS"
        
        
        // Do any additional setup after loading the view.
    }

    var pointJson = JSON([])
    
    func pointLoaded (json:JSON) {
        pointJson = json;
        dispatch_async(dispatch_get_main_queue(),{
            self.pointTable.reloadData()
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
        tableView.tableFooterView = UIView()
        let cell = tableView.dequeueReusableCellWithIdentifier("pointTableCell", forIndexPath: indexPath)
        
        
        if((pointJson[indexPath.row]["name"].string) != nil) {
            let mediaBox = table(frame: CGRectMake(0,8,self.view.frame.width-32,230));
            mediaBox.tableTeam.text = pointJson[indexPath.row]["name"].string
            mediaBox.tableNo.text = pointJson[indexPath.row]["id"].string
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
