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
    
    let font = UIFont(name: "Oswald-Regular", size: 14.0)
    let lightBlueColor = UIColor(red: 196/255, green: 240/255, blue: 255/255, alpha: 1)
    
    override func viewDidAppear(_ animated: Bool) {
        
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
        
        tableHeader.tableDraw.font = font
        tableHeader.tableDraw.text = "D"
        
        tableHeader.tablePoint.font = font
        tableHeader.tablePoint.text = "PTS"
        
        
        // Do any additional setup after loading the view.
    }

    var pointJson = JSON([])
    
    func pointLoaded (_ json:JSON) {
        
        print(json);
        
        if(json == 1)
        {
            let alertController = UIAlertController(title: "No Connection", message:
                "Please check your internet connection", preferredStyle: UIAlertControllerStyle.alert)
            alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.default,handler: nil))
            
            self.present(alertController, animated: true, completion: nil)
        }
        else
        {
            pointJson = json;
            DispatchQueue.main.async(execute: {
                self.pointTable.reloadData()
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
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pointJson.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        tableView.separatorStyle = UITableViewCellSeparatorStyle.none
        tableView.allowsSelection = false
        tableView.tableFooterView = UIView()
        let cell = tableView.dequeueReusableCell(withIdentifier: "pointTableCell", for: indexPath)
        
        
        if((pointJson[indexPath.row]["name"].string) != nil) {
            let mediaBox = table(frame: CGRect(x: 0,y: 8,width: self.view.frame.width-32,height: 230));
            mediaBox.tableTeam.text = pointJson[indexPath.row]["name"].string
            if (pointJson[indexPath.row]["name"].string == "Jaipur Pink Panthers") {
                mediaBox.tableTeam.font = font
                mediaBox.tableNo.font = font
                mediaBox.tablePlayed.font = font
                mediaBox.tableLost.font = font
                mediaBox.tableWon.font = font
                mediaBox.tableDraw.font = font
                mediaBox.tablePoint.font = font
                
                mediaBox.tableNo.textColor = PinkColor
                mediaBox.tableTeam.textColor = PinkColor
                mediaBox.tablePlayed.textColor = PinkColor
                mediaBox.tableWon.textColor = PinkColor
                mediaBox.tableLost.textColor = PinkColor
                mediaBox.tableDraw.textColor = PinkColor
                mediaBox.tablePoint.textColor = PinkColor
                
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
            mediaBox.tableDraw.text = pointJson[indexPath.row]["draw"].string
            mediaBox.tablePoint.text = pointJson[indexPath.row]["point"].string
            cell.addSubview(mediaBox)
        }
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
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
