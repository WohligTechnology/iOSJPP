//
//  MatchUpdateController.swift
//  JPP
//
//  Created by Harsh Thakkar on 04/07/16.
//  Copyright © 2016 Wohlig Technology. All rights reserved.
//

import UIKit
var match:MatchUpdateController!
class MatchUpdateController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var matchupdateTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.setNavigationBarItemText("MATCH UPDATES")
        loadingInit()
        self.view.addSubview(loaderGlo)
        
        if scheduleType == "kabaddi" {
            rest.getMatchUpdate(matchupdateLoaded)
        } else if scheduleType == "worldcup" {
            rest.getWorldCup(matchupdateLoaded)
        }
        
    }
    
    var matchupdateJSON = JSON([])
    
    func matchupdateLoaded (_ json:JSON) {
        print(json);
        if json == 1 {
            let alertController = UIAlertController(title: "No Connection", message:
                "Please check your internet connection", preferredStyle: UIAlertControllerStyle.alert)
            alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.default,handler: nil))
            self.present(alertController, animated: true, completion: nil)
        }
        else {
            matchupdateJSON = json
            print("showmematchupdate\(matchupdateJSON)")
            DispatchQueue.main.async(execute: {
                self.matchupdateTableView.reloadData()
            });
        }
        DispatchQueue.main.async(execute: {
            loadingStop()
        });
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return matchupdateJSON.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        tableView.rowHeight = 330.0
        tableView.separatorStyle = UITableViewCellSeparatorStyle.none
        tableView.tableFooterView = UIView()
        let cell = tableView.dequeueReusableCell(withIdentifier: "matchupdateCell", for: indexPath)
        cell.selectionStyle = UITableViewCellSelectionStyle.none
        
        if((matchupdateJSON[indexPath.row]["matchtime"].string) != nil) {
            let matchupdateView = matchupdate(frame: CGRect(x: 0,y: 0,width: self.view.frame.width-16,height: 322));
//            if indexPath.row == 0 {
//                matchupdateView.matchTitle.text = "FINAL"
//
//            }else if indexPath.row == 1 {
//                matchupdateView.matchTitle.text = "SEMI-FINAL"
//
//            }else{
            matchupdateView.matchTitle.text = matchupdateJSON[indexPath.row]["level"].string
//            }
            matchupdateView.teamoneImage.hnk_setImageFromURL(rest.getImageSizeCache(matchupdateJSON[indexPath.row]["appteamimage1"].stringValue))
            matchupdateView.teamtwoImage.hnk_setImageFromURL(rest.getImageSizeCache(matchupdateJSON[indexPath.row]["appteamimage2"].stringValue))
            matchupdateView.stadiumName.text = matchupdateJSON[indexPath.row]["stadium"].string
            matchupdateView.matchTime.text = matchupdateJSON[indexPath.row]["starttimedate"].string
            matchupdateView.matchTotalTime.text = matchupdateJSON[indexPath.row]["matchtime"].string
            matchupdateView.teamoneScore.text = matchupdateJSON[indexPath.row]["score1"].string
            matchupdateView.teamtwoScore.text = matchupdateJSON[indexPath.row]["score2"].string
            
            switch matchupdateJSON[indexPath.row]["team1"].string! {
            case "Jaipur Pink Panthers":
                matchupdateView.teamoneScore.textColor = UIColor(red: 231/255, green: 45/255, blue: 137/255, alpha: 1) //E72D89
            case "Bengaluru Bulls":
                matchupdateView.teamoneScore.textColor = UIColor(red: 176/255, green: 29/255, blue: 33/255, alpha: 1) //b01d21
            case "Bengal Warriors":
                matchupdateView.teamoneScore.textColor = UIColor(red: 242/255, green: 103/255, blue: 36/255, alpha: 1) //f26724
            case "Dabang Delhi":
                matchupdateView.teamoneScore.textColor = UIColor(red: 217/255, green: 31/255, blue: 45/255, alpha: 1) //d91f2d
            case "Patna Pirates":
                matchupdateView.teamoneScore.textColor = UIColor(red: 10/255, green: 68/255, blue: 54/255, alpha: 1) //0a4436
            case "Puneri Paltan":
                matchupdateView.teamoneScore.textColor = UIColor(red: 240/255, green: 78/255, blue: 35/255, alpha: 1) //f04e23
            case "Telugu Titans":
                matchupdateView.teamoneScore.textColor = UIColor(red: 218/255, green: 33/255, blue: 49/255, alpha: 1) //da2131
            case "U Mumba":
                matchupdateView.teamoneScore.textColor = UIColor(red: 241/255, green: 89/255, blue: 34/255, alpha: 1) //f15922
            default:
                matchupdateView.teamoneScore.textColor = UIColor(red: 231/255, green: 45/255, blue: 137/255, alpha: 1) //E72D89
            }
            
            switch matchupdateJSON[indexPath.row]["team2"].string! {
            case "Jaipur Pink Panthers":
                matchupdateView.teamtwoScore.textColor = UIColor(red: 231/255, green: 45/255, blue: 137/255, alpha: 1) //E72D89
            case "Bengaluru Bulls":
                matchupdateView.teamtwoScore.textColor = UIColor(red: 176/255, green: 29/255, blue: 33/255, alpha: 1) //b01d21
            case "Bengal Warriors":
                matchupdateView.teamtwoScore.textColor = UIColor(red: 242/255, green: 103/255, blue: 36/255, alpha: 1) //f26724
            case "Dabang Delhi":
                matchupdateView.teamtwoScore.textColor = UIColor(red: 217/255, green: 31/255, blue: 45/255, alpha: 1) //d91f2d
            case "Patna Pirates":
                matchupdateView.teamtwoScore.textColor = UIColor(red: 10/255, green: 68/255, blue: 54/255, alpha: 1) //0a4436
            case "Puneri Paltan":
                matchupdateView.teamtwoScore.textColor = UIColor(red: 240/255, green: 78/255, blue: 35/255, alpha: 1) //f04e23
            case "Telugu Titans":
                matchupdateView.teamtwoScore.textColor = UIColor(red: 218/255, green: 33/255, blue: 49/255, alpha: 1) //da2131
            case "U Mumba":
                matchupdateView.teamtwoScore.textColor = UIColor(red: 241/255, green: 89/255, blue: 34/255, alpha: 1) //f15922
            default:
                matchupdateView.teamtwoScore.textColor = UIColor(red: 231/255, green: 45/255, blue: 137/255, alpha: 1) //E72D89
            }

            
            
            cell.addSubview(matchupdateView)
        }
        
        
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
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
