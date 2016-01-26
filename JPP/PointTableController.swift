//
//  PointTableController.swift
//  JPP
//
//  Created by Chintan Shah on 26/01/16.
//  Copyright © 2016 Wohlig Technology. All rights reserved.
//

import UIKit

class PointTableController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var tableHeader: table!
    override func viewDidLoad() {
        super.viewDidLoad()
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

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        tableView.separatorStyle = UITableViewCellSeparatorStyle.SingleLine
        tableView.tableFooterView = UIView()
        let cell = tableView.dequeueReusableCellWithIdentifier("pointTableCell", forIndexPath: indexPath)
        cell.addSubview(table(frame: CGRectMake(0,5,cell.frame.width,cell.frame.height)))
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
