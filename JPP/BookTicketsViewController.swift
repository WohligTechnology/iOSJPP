//
//  BookTicketsViewController.swift
//  JPP
//
//  Created by Midhet Sulemani on 16/06/16.
//  Copyright © 2016 Wohlig Technology. All rights reserved.
//

import UIKit

class BookTicketsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    let allUrls = ["https://in.bookmyshow.com/sports/pro-kabaddi/jaipur-pink-panthers/seat-layout/ET00042335", "https://in.bookmyshow.com/sports/pro-kabaddi/jaipur-pink-panthers/seat-layout/ET00042336", "https://in.bookmyshow.com/sports/pro-kabaddi/jaipur-pink-panthers/seat-layout/ET00042338", "https://in.bookmyshow.com/sports/pro-kabaddi/jaipur-pink-panthers/seat-layout/ET00042337"]
    let images = ["t7", "t2", "t3", "t6"]
    let time = ["WED 29 JUN 2016, 20:00(IST)", "THU 30 JUN 2016, 20:00(IST)", "FRI 1 JUL 2016, 21:00(IST)", "SAT 2 JUL 2016, 21:00(IST)"]
    
    @IBOutlet weak var bookMyTicketTable: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setNavigationBarItemText("MERCHANDISE")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return allUrls.count + 1
        
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        if indexPath.row > allUrls.count - 1 {
           
            let cell = tableView.dequeueReusableCellWithIdentifier("merchandiseCell") as! MerchandiseTableViewCell
            return cell
            
        }
//        print("index: \(indexPath.row)")
        
        let cell = tableView.dequeueReusableCellWithIdentifier("bookTicketsCell") as! TicketEventTableViewCell
        cell.matchLabel.text = "MATCH - 0" + String(indexPath.row + 1)
        cell.AgainstTeamLogo.image = UIImage(named: images[indexPath.row])
        cell.schedule.text = time[indexPath.row]
        return cell
        
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        
        if indexPath.row > allUrls.count - 1 {
            
            return 150
        }
        
        return 268
        
    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        return 0
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "bookTickets" {
            
            let button = sender as! UIButton
            let view = button.superview
            let cell = view!.superview as! TicketEventTableViewCell
            
            let indexPath = bookMyTicketTable.indexPathForCell(cell)
            
            let WebController:BookTicketController = segue.destinationViewController as! BookTicketController
            let theUrl = NSURL(string: allUrls[indexPath!.row])
            WebController.url = theUrl
        } else if segue.identifier == "merchandise" {
            let WebController:BookTicketController = segue.destinationViewController as! BookTicketController
            let theUrl = NSURL(string: "http://www.didasportswear.com/jaipur-pink-panthers.html")
            WebController.url = theUrl
        }
        
        
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

class TicketEventTableViewCell: UITableViewCell {
    
    @IBOutlet weak var AgainstTeamLogo: UIImageView!
    @IBOutlet weak var Venue: UILabel!
    @IBOutlet weak var schedule: UILabel!
    @IBOutlet weak var matchLabel: UILabel!
    
}

class MerchandiseTableViewCell: UITableViewCell {
}

