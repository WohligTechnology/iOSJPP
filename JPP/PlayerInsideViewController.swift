//
//  PlayerInsideViewController.swift
//  JPP
//
//  Created by Pranay Joshi on 12/06/17.
//  Copyright © 2017 Wohlig Technology. All rights reserved.
//

import UIKit

class PlayerInsideViewController: UIViewController {

    @IBOutlet weak var playersScroll: UIScrollView!
    var players: String!
//    var playersInsideindex: String!
    var playersInsideJSON: JSON = []
    var tournamentAchievement: String = ""
    var acheiveTournament: String = ""
    var tourny: String = ""
    var player: playersInside!
    var i = 0
    
    var verticalLayout : VerticalLayout!
    var homeAcheivement = NSAttributedString()
    override func viewDidLoad() {
        super.viewDidLoad()
//        playersInsideindex = "\(players)"
        print("finalindex\(players)")
        setNavigationBarItem1()
        
        
        
self.verticalLayout = VerticalLayout(width: self.view.frame.width);
        
      player = playersInside(frame: CGRect(x: 0, y: 20, width: view.frame.width, height:983))
      self.verticalLayout.addSubview(player)
      playersScroll.insertSubview(verticalLayout, at: 0)
        
        let offset: CGFloat = player.descriptionTextView.bounds.size.height
         self.playersScroll.contentSize = CGSize(width: 0, height: self.player.frame.height + offset)
    
        // Do any additional setup after loading the view.
        
        rest.getSinglePlayer(players, completion: {(json:JSON) -> () in
            DispatchQueue.main.sync(execute: {
                if json == 401 {
                    print("No Data Found")
                }else{
                    
                    print("hellojson\(json)")
                    self.playersInsideJSON = json["data"]
                   
                    print("lagggyihyaar\(self.tournamentAchievement)")
                    print("guessing\(self.playersInsideJSON)")
                    self.player.playerName.text = self.playersInsideJSON["player"]["name"].stringValue
                     print("nameplease\(self.player.playerName)")
                    self.player.playerImage.hnk_setImageFromURL(rest.getImageCache(self.playersInsideJSON["player"]["bigimage"].string!))
                    self.player.playerNumber.text = self.playersInsideJSON["player"]["jerseyno"].stringValue
                    self.player.playerType.text = self.playersInsideJSON["player"]["type"].stringValue
                    self.player.Nationality.text = self.playersInsideJSON["player"]["hnationality"].stringValue
                    self.player.nativePlace.text = self.playersInsideJSON["player"]["nativeplacehindi"].stringValue
                    self.player.dob.text = self.playersInsideJSON["player"]["dob"].stringValue
                    self.player.playerHeight.text = self.playersInsideJSON["player"]["height"].stringValue
                    self.player.playerWeight.text = self.playersInsideJSON["player"]["weight"].stringValue
                    
                    if self.playersInsideJSON["player"]["current"]["status"].stringValue == "2" {
                        self.player.currentSeason.isHidden = true
                    }else {
                        self.player.currentSeason.isHidden = false
                    }
                    
                    if self.playersInsideJSON["player"]["lastseason"]["status"].stringValue == "2" {
                        self.player.lastSeason.isHidden = true
                    }else {
                        self.player.lastSeason.isHidden = false
                    }
                    
                    if self.playersInsideJSON["player"]["career"]["status"].stringValue == "2" {
                        self.player.playerCareer.isHidden = true
                    }else {
                        self.player.playerCareer.isHidden = false
                    }
            
                    for i in 0..<self.playersInsideJSON["achievmant"].count{
                        if self.playersInsideJSON["achievmant"][i]["name"].stringValue == "N/A" && self.playersInsideJSON["tournamentplayed"][i]["year"].stringValue == "N/A"{
                            self.player.acheivements.isHidden = true
                            self.player.descriptionTextView.isHidden = true
                            self.tournamentAchievement.append("")
                        }else{
                            self.tournamentAchievement.append(self.playersInsideJSON["achievmant"][i]["name"].stringValue + "(" +  self.playersInsideJSON["achievmant"][i]["year"].stringValue + ")  ")
                            self.player.acheivements.isHidden = false
                            self.player.descriptionTextView.isHidden = false
                            print("showme json \(String(describing: self.playersInsideJSON["achievmant"]["id"].string))")
                           
                            
                            //        player.frame = CGRect(x: 0, y: 0, width: playersScroll.frame.width, height:())
                        }
                        
                    }

                    
                    
                    for i in 0..<self.playersInsideJSON["tournamentplayed"].count{
                        if self.playersInsideJSON["tournamentplayed"][i]["name"].stringValue == "N/A" && self.playersInsideJSON["tournamentplayed"][self.i]["year"].stringValue == "N/A"{
                            self.acheiveTournament.append("")
                             self.player.tournamentsPlayed.isHidden = true
                            self.player.descriptionTextView.isHidden = true
                        }else{
                            print( "players inside json \(self.playersInsideJSON["tournamentplayed"]):::\(self.playersInsideJSON["tournamentplayed"][i]["name"].stringValue)")

                            self.acheiveTournament.append(self.playersInsideJSON["tournamentplayed"][i]["name"].stringValue + "(" +  self.playersInsideJSON["tournamentplayed"][i]["year"].stringValue + ")  ")
                             self.player.tournamentsPlayed.isHidden = false
                            self.player.descriptionTextView.isHidden = false
                        }
                        
                    }

                }
            })
            
        })
        self.player.lastSeason.addTarget(self, action: #selector(self.lastSeason(_:)), for: .touchUpInside)
        self.player.playerCareer.addTarget(self, action: #selector(self.playerCareer(_:)), for: .touchUpInside)
        
        self.player.currentSeason.addTarget(self, action: #selector(self.currentCareer(_:)), for: .touchUpInside)
        
        player.tournamentsPlayed.addTarget(self, action: #selector(self.tournamentsPlayed(_:)), for: .touchUpInside)
         player.acheivements.addTarget(self, action: #selector(self.acheivements(_:)), for: .touchUpInside)
        
    }
    
    
    func tournamentsPlayed(_ sender: UIButton){
        print("seethis\(self.playersInsideJSON["tournamentplayed"][0]["id"].stringValue)")
       
        player.descriptionTextView.text = tournamentAchievement
        player.tournamentsPlayed.alpha = 1.0
        player.acheivements.alpha = 0.5
    }
    
    func acheivements(_ sender: UIButton){
        player.tournamentsPlayed.alpha = 0.5
        player.acheivements.alpha = 1.0
        player.descriptionTextView.text = acheiveTournament
    }

    
   
    
    func lastSeason(_ sender: UIButton){
        
        
        self.player.matchesPlayed.text = self.playersInsideJSON["player"]["lastseason"]["matchplayed"].stringValue
        self.player.totalPoints.text = self.playersInsideJSON["player"]["lastseason"]["totalpoints"].stringValue
        self.player.totalRaidPoints.text = self.playersInsideJSON["player"]["lastseason"]["totalraidpoints"].stringValue
        self.player.totalDefencePoints.text = self.playersInsideJSON["player"]["lastseason"]["totaldefencepoints"].stringValue
        self.player.GreenCards.text = self.playersInsideJSON["player"]["lastseason"]["greencards"].stringValue
        self.player.RedCards.text = self.playersInsideJSON["player"]["lastseason"]["redcards"].stringValue
        self.player.YellowCards.text = self.playersInsideJSON["player"]["lastseason"]["yellowcards"].stringValue
        self.player.raids.text = self.playersInsideJSON["player"]["lastseason"]["raids"].stringValue
        self.player.successfulRaids.text = self.playersInsideJSON["player"]["lastseason"]["successfulraids"].stringValue
        self.player.unsuccessfulRaids.text = self.playersInsideJSON["player"]["lastseason"]["unsuccessfulraids"].stringValue
        self.player.emptyRaids.text = self.playersInsideJSON["player"]["lastseason"]["emptyraids"].stringValue
        self.player.tackles.text = self.playersInsideJSON["player"]["lastseason"]["tackles"].stringValue
        self.player.totalPoints.text = self.playersInsideJSON["player"]["lastseason"]["successfultackles"].stringValue
        self.player.successfulTackles.text = self.playersInsideJSON["player"]["lastseason"]["unsuccessfultackles"].stringValue
        player.lastSeason.alpha = 1.0
        player.playerCareer.alpha = 0.5
        player.currentSeason.alpha = 0.5
    }
    
    func playerCareer(_ sender: UIButton){
        
        self.player.matchesPlayed.text = self.playersInsideJSON["player"]["career"]["matchplayed"].stringValue
        self.player.totalPoints.text = self.playersInsideJSON["player"]["career"]["totalpoints"].stringValue
        self.player.totalRaidPoints.text = self.playersInsideJSON["player"]["career"]["totalraidpoints"].stringValue
        self.player.totalDefencePoints.text = self.playersInsideJSON["player"]["career"]["totaldefencepoints"].stringValue
        self.player.GreenCards.text = self.playersInsideJSON["player"]["career"]["greencards"].stringValue
        self.player.RedCards.text = self.playersInsideJSON["player"]["career"]["redcards"].stringValue
        self.player.YellowCards.text = self.playersInsideJSON["player"]["career"]["yellowcards"].stringValue
        self.player.raids.text = self.playersInsideJSON["player"]["career"]["raids"].stringValue
        self.player.successfulRaids.text = self.playersInsideJSON["player"]["career"]["successfulraids"].stringValue
        self.player.unsuccessfulRaids.text = self.playersInsideJSON["player"]["career"]["unsuccessfulraids"].stringValue
        self.player.emptyRaids.text = self.playersInsideJSON["player"]["career"]["emptyraids"].stringValue
        self.player.tackles.text = self.playersInsideJSON["player"]["career"]["tackles"].stringValue
        self.player.successfulTackles.text = self.playersInsideJSON["player"]["career"]["successfultackles"].stringValue
        self.player.unsuccessfulTackles.text = self.playersInsideJSON["player"]["career"]["unsuccessfultackles"].stringValue
        player.lastSeason.alpha = 0.5
        player.playerCareer.alpha = 1.0
        player.currentSeason.alpha = 0.5
    }

    func currentCareer(_ sender: UIButton){
        
        self.player.matchesPlayed.text = self.playersInsideJSON["player"]["current"]["matchplayed"].stringValue
        self.player.totalPoints.text = self.playersInsideJSON["player"]["current"]["totalpoints"].stringValue
        self.player.totalRaidPoints.text = self.playersInsideJSON["player"]["current"]["totalraidpoints"].stringValue
        self.player.totalDefencePoints.text = self.playersInsideJSON["player"]["current"]["totaldefencepoints"].stringValue
        self.player.GreenCards.text = self.playersInsideJSON["player"]["current"]["greencards"].stringValue
        self.player.RedCards.text = self.playersInsideJSON["player"]["current"]["redcards"].stringValue
        self.player.YellowCards.text = self.playersInsideJSON["player"]["current"]["yellowcards"].stringValue
        self.player.raids.text = self.playersInsideJSON["player"]["current"]["raids"].stringValue
        self.player.successfulRaids.text = self.playersInsideJSON["player"]["current"]["successfulraids"].stringValue
        self.player.unsuccessfulRaids.text = self.playersInsideJSON["player"]["current"]["unsuccessfulraids"].stringValue
        self.player.emptyRaids.text = self.playersInsideJSON["player"]["current"]["emptyraids"].stringValue
        self.player.tackles.text = self.playersInsideJSON["player"]["current"]["tackles"].stringValue
        self.player.successfulTackles.text = self.playersInsideJSON["player"]["current"]["successfultackles"].stringValue
        self.player.unsuccessfulTackles.text = self.playersInsideJSON["player"]["current"]["unsuccessfultackles"].stringValue
        player.lastSeason.alpha = 0.5
        player.playerCareer.alpha = 0.5
        player.currentSeason.alpha = 1.0
    }

    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(_ animated: Bool) {
//         setNavigationBarItem()
        super.viewDidAppear(animated)
        player.frame = CGRect(x: 0, y: 0, width: playersScroll.frame.width, height: 667)
        print("")
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
