//
//  TicketsViewController.swift
//  JPP
//
//  Created by Pranay Joshi on 23/08/17.
//  Copyright © 2017 Wohlig Technology. All rights reserved.
//

import UIKit

class TicketsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var tickets: JSON = []
    
    @IBOutlet weak var ticketsTable: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        loadingInit()
        self.view.addSubview(loaderGlo)
        self.setNavigationBarItemText("TICKETS")
        rest.tickets({(json:JSON) -> () in
            DispatchQueue.main.sync(execute: {
                if json == 401 {
                    print("No Data Found")
                }else{
                    
                    
                    self.tickets = json
                    print("showTickets\(self.tickets)")
                    DispatchQueue.main.async(execute: {
                        self.ticketsTable.reloadData()
                    });
                    
                    DispatchQueue.main.async(execute: {
                        loadingStop()
                    });
                    
                    
                }
                
            })
            
            
        })
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tickets["queryresult"].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ticketsTableView", for: indexPath) as! TicketTableViewCell
        cell.ticketImage.hnk_setImageFromURL(rest.getImageSizeCache(self.tickets["queryresult"][indexPath.row]["image"].stringValue))
        
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedCell:UITableViewCell = tableView.cellForRow(at: indexPath)!
        selectedCell.contentView.backgroundColor = UIColor(red: 123/255, green: 217/255, blue: 250/255, alpha: 1)
        let WebController =
                    self.storyboard?.instantiateViewController(withIdentifier: "WebController")
                        as! BookTicketController
                 WebController.url = URL(string: tickets["queryresult"][indexPath.row]["link"].stringValue)
        
        //        WebController.url = theUrl
                // pass the relevant data to the new sub-ViewController
                // tell the new controller to present itself
                self.navigationController?.pushViewController(WebController, animated: true)
                

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

class TicketTableViewCell: UITableViewCell{
    @IBOutlet weak var ticketImage: UIImageView!
    
}
