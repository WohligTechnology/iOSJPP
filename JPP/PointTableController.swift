//
//  PointTableController.swift
//  JPP
//
//  Created by Chintan Shah on 26/01/16.
//  Copyright © 2016 Wohlig Technology. All rights reserved.
//

import UIKit

class PointTableController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var pointsScroll: UIScrollView!
    @IBOutlet weak var sponsorShipImage: UIImageView!
    @IBOutlet weak var pointTable: UITableView!
    @IBOutlet weak var tableHeader: table!
    var sponsorImage: JSON = []
    var sectionName: JSON = ["name": "Zone A", "name": "Zone B"]
    var inx: Int = 0
    
        let font = UIFont(name: "Oswald-Regular", size: 13.0)
   
        let fontOriginal = UIFont(name: "Oswald-Light", size: 13.0)
        let lightBlueColor = UIColor(red: 196/255, green: 240/255, blue: 255/255, alpha: 1)
        
        override func viewDidAppear(_ animated: Bool) {
            
            self.view.addSubview(loaderGlo)
        }
        
        override func viewDidLoad() {
            super.viewDidLoad()
        pointsScroll.contentSize = CGSize(width: 0, height: 1100)
            rest.getSponsorImage({(json:JSON) -> () in
                DispatchQueue.main.sync(execute: {
                    if json == 401 {
                        print("No Data Found")
                    }else{
                        
                        print("hellojson\(json)")
                        self.sponsorImage = json
                        self.sponsorShipImage.hnk_setImageFromURL(rest.getImageSizeCache(self.sponsorImage["image"].stringValue))
                        print("demodemodemo",self.sponsorShipImage.frame.size.height)
                        
                    }
                })
                
            })

            
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
            
//            tableHeader.tableDraw.font = font
//            tableHeader.tableDraw.text = "D"
            
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
                 self.pointTable.reloadData()
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
            return pointJson[0]["pointsTableA"].count
        }

        func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
         if section == 0 {
         var headerView = UIView()
          headerView = UIView(frame: CGRect(x: 8, y: 8, width: view.frame.size.width, height: 20))
        
         let label = UILabel(frame: CGRect(x: 8, y: 8, width: view.frame.size.width, height: 20))
         let fontHeader = UIFont(name: "Oswald-Regular", size: 20.0)
        label.font = fontHeader
        label.textColor = .white
        label.text = pointJson[0]["name"].stringValue
        headerView.addSubview(label)
        
        headerView.backgroundColor = UIColor(red: 78/255, green: 202/255, blue: 245/155, alpha: 1.0)
        return headerView
         }else{
            var headerView = UIView()
            headerView = UIView(frame: CGRect(x: 8, y: 8, width: view.frame.size.width, height: 20))
            let label = UILabel(frame: CGRect(x: 8, y: 8, width: view.frame.size.width, height: 20))
            let fontHeader = UIFont(name: "Oswald-Regular", size: 20.0)
            label.font = fontHeader
            label.textColor = .white
            label.text = pointJson[1]["name"].stringValue
            headerView.addSubview(label)
            
            headerView.backgroundColor = UIColor(red: 78/255, green: 202/255, blue: 245/155, alpha: 1.0)
            return headerView
        }
    }

    
        func numberOfSections(in tableView: UITableView) -> Int {
                return 2
        }
    
        func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
            return 32.0
        }
    
        func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
       
            if section == 0 {
                return pointJson[0]["name"].stringValue
            } else {
                return pointJson[1]["name"].stringValue
            }
        
        }
    
    
    
    
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            tableView.separatorStyle = UITableViewCellSeparatorStyle.none
            tableView.allowsSelection = false
            tableView.tableFooterView = UIView()
            let cell = tableView.dequeueReusableCell(withIdentifier: "pointTableCell", for: indexPath) as! PointTableCellClass
//            let point = CGPoint(x: 0, y: 50)
//            pointTable.setContentOffset(point, animated: true)
            
            
            if((pointJson[0]["name"].string) != nil) {
                if indexPath.section == 0 {
//                let mediaBox = table(frame: CGRect(x: 0,y: 8,width: self.view.frame.width-32,height: 50));
                cell.name.text = pointJson[0]["pointsTableA"][indexPath.row]["name"].stringValue
                cell.name.backgroundColor = UIColor.clear
                
                if (pointJson[0]["pointsTableA"][indexPath.row]["name"].string == "Jaipur Pink Panthers") {
                    cell.name.font = font
                    cell.no.font = font
                    cell.played.font = font
                    cell.lost.font = font
                    cell.wins.font = font
//                    cell.draw.font = font
                    cell.point.font = font
                    cell.name.backgroundColor = UIColor.clear
                    cell.no.textColor = PinkColor
                    cell.name.textColor = PinkColor
                    cell.played.textColor = PinkColor
                    cell.wins.textColor = PinkColor
                    cell.lost.textColor = PinkColor
//                    cell.draw.textColor = PinkColor
                    cell.point.textColor = PinkColor
                    
                    cell.backgroundColor = UIColor(red: 77/255, green: 203/255, blue: 244/255, alpha: 1)
                    
                }else{
                    cell.name.font = fontOriginal
                    cell.no.font = fontOriginal
                    cell.played.font = fontOriginal
                    cell.lost.font = fontOriginal
                    cell.wins.font = fontOriginal
//                    cell.draw.font = fontOriginal
                    cell.point.font = fontOriginal
                    cell.name.backgroundColor = UIColor.clear
                    cell.no.textColor = UIColor.black
                    cell.name.textColor = UIColor.black
                    cell.played.textColor = UIColor.black
                    cell.wins.textColor = UIColor.black
                    cell.lost.textColor = UIColor.black
//                    cell.draw.textColor = UIColor.black
                    cell.point.textColor = UIColor.black
                    
                    cell.backgroundColor = UIColor(red: 77/255, green: 203/255, blue: 244/255, alpha: 1)

                }
                cell.no.text = String((indexPath as NSIndexPath).row  + 1)
                cell.played.text = pointJson[0]["pointsTableA"][indexPath.row]["played"].string
                cell.lost.text = pointJson[0]["pointsTableA"][indexPath.row]["wins"].string
                cell.wins.text = pointJson[0]["pointsTableA"][indexPath.row]["lost"].string
//                cell.draw.text = pointJson[0]["pointsTableA"][indexPath.row]["draw"].string
                cell.point.text = pointJson[0]["pointsTableA"][indexPath.row]["point"].string

                
            }
            else{
                cell.name.text = pointJson[1]["pointsTableB"][indexPath.row]["name"].stringValue
                cell.name.backgroundColor = UIColor.clear
                
                if (pointJson[1]["pointsTableB"][indexPath.row]["name"].string == "Jaipur Pink Panthers") {
                    cell.name.font = font
                    cell.no.font = font
                    cell.played.font = font
                    cell.lost.font = font
                    cell.wins.font = font
//                    cell.draw.font = font
                    cell.point.font = font
                    cell.name.backgroundColor = UIColor.clear
                    cell.no.textColor = PinkColor
                    cell.name.textColor = PinkColor
                    cell.played.textColor = PinkColor
                    cell.wins.textColor = PinkColor
                    cell.lost.textColor = PinkColor
//                    cell.draw.textColor = PinkColor
                    cell.point.textColor = PinkColor
                    
                    cell.backgroundColor = UIColor(red: 77/255, green: 203/255, blue: 244/255, alpha: 1)
                    
                }else{
                    cell.name.font = fontOriginal
                    cell.no.font = fontOriginal
                    cell.played.font = fontOriginal
                    cell.lost.font = fontOriginal
                    cell.wins.font = fontOriginal
//                    cell.draw.font = fontOriginal
                    cell.point.font = fontOriginal
                    cell.name.backgroundColor = UIColor.clear
                    cell.no.textColor = UIColor.black
                    cell.name.textColor = UIColor.black
                    cell.played.textColor = UIColor.black
                    cell.wins.textColor = UIColor.black
                    cell.lost.textColor = UIColor.black
//                    cell.draw.textColor = UIColor.black
                    cell.point.textColor = UIColor.black
                    
                    cell.backgroundColor = UIColor(red: 77/255, green: 203/255, blue: 244/255, alpha: 1)
                    
                }
                cell.no.text = String((indexPath as NSIndexPath).row  + 1)
                cell.played.text = pointJson[1]["pointsTableB"][indexPath.row]["played"].string
                cell.lost.text = pointJson[1]["pointsTableB"][indexPath.row]["wins"].string
                cell.wins.text = pointJson[1]["pointsTableB"][indexPath.row]["lost"].string
//                cell.draw.text = pointJson[1]["pointsTableB"][indexPath.row]["draw"].string
                cell.point.text = pointJson[1]["pointsTableB"][indexPath.row]["point"].string
                
          
                
            }
            
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

class PointTableCellClass: UITableViewCell {
    
    @IBOutlet weak var played: UILabel!
    @IBOutlet weak var wins: UILabel!
    @IBOutlet weak var lost: UILabel!
    @IBOutlet weak var draw: UILabel!
    @IBOutlet weak var point: UILabel!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var no: UILabel!
}
