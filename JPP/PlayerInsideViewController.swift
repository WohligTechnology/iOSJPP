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
    var player: playersInside!
    var verticalLayout : VerticalLayout!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        playersInsideindex = "\(players)"
        print("finalindex\(players)")
        setNavigationBarItem1()
        
       
self.verticalLayout = VerticalLayout(width: self.view.frame.width);
        
      player = playersInside(frame: CGRect(x: 0, y: 20, width: view.frame.width, height:983))
//        player = playersInside()
//        frame: CGRect(x: 0, y: 0, width: playersScroll.frame.width, height:view.frame.maxY)
//        playersScroll.addSubview(player)
//        let point = CGPoint(x: 0, y: (self.playersScroll.contentSize.height - self.playersScroll.bounds.size.height))
//        self.playersScroll.setContentOffset(point, animated: true)
//        self.playersScroll.scrollRectToVisible(player.frame, animated: true)
       self.verticalLayout.addSubview(player)
        playersScroll.insertSubview(verticalLayout, at: 0)
//       playersScroll.contentSize = CGSize(width: 0, height: 1200)
        
        let offset: CGFloat = player.descriptionTextView.bounds.size.height
         self.playersScroll.contentSize = CGSize(width: 0, height: self.player.frame.height + offset)
        
//        func resizeView(_ offset:CGFloat)
//        {
//            self.verticalLayout.layoutSubviews()
//            self.playersScroll.contentSize = CGSize(width: self.verticalLayout.frame.width, height: self.verticalLayout.frame.height + offset)
//        }
    
        // Do any additional setup after loading the view.
        
        rest.getSinglePlayer(players, completion: {(json:JSON) -> () in
            DispatchQueue.main.sync(execute: {
                if json == 401 {
                    print("No Data Found")
                }else{
                    
                    print(json)
                    self.playersInsideJSON = json["data"]["player"]
                    print("guessing\(self.playersInsideJSON)")
                    self.player.playerName.text = self.playersInsideJSON["name"].stringValue
                     print("nameplease\(self.player.playerName)")
                    self.player.playerImage.hnk_setImageFromURL(rest.getImageCache(self.playersInsideJSON["bigimage"].string!))
                    self.player.playerNumber.text = self.playersInsideJSON["jerseyno"].stringValue
                    self.player.playerType.text = self.playersInsideJSON["type"].stringValue
                    self.player.Nationality.text = self.playersInsideJSON["hnationality"].stringValue
                    self.player.nativePlace.text = self.playersInsideJSON["nativeplacehindi"].stringValue
                    self.player.dob.text = self.playersInsideJSON["dob"].stringValue
                    self.player.playerHeight.text = self.playersInsideJSON["height"].stringValue
                    self.player.playerWeight.text = self.playersInsideJSON["weight"].stringValue
                    
                    
                    

//                    self.getPlayers = json["queryresult"]
//                    print("i want this\(self.getPlayers)")
//                    print("givecount\(self.getPlayers.count)")
//                    self.playersCollection.reloadData()
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
       player.descriptionTextView.text = self.playersInsideJSON["lastseason"]["tournamentplayed"].stringValue
        player.tournamentsPlayed.alpha = 1.0
        player.acheivements.alpha = 0.6
//        player.frame = CGRect(x: 0, y: 0, width: playersScroll.frame.width, height:())

           }
    
    func acheivements(_ sender: UIButton){
        player.descriptionTextView.text = self.playersInsideJSON["lastseason"]["achievmant"].stringValue
        player.acheivements.alpha = 1.0
        player.tournamentsPlayed.alpha = 0.6
    }

    
   
    
    func lastSeason(_ sender: UIButton){
        
        self.player.matchesPlayed.text = self.playersInsideJSON["lastseason"]["matchplayed"].stringValue
        self.player.totalPoints.text = self.playersInsideJSON["lastseason"]["totalpoints"].stringValue
        self.player.totalRaidPoints.text = self.playersInsideJSON["lastseason"]["totalraidpoints"].stringValue
        self.player.totalDefencePoints.text = self.playersInsideJSON["lastseason"]["totaldefencepoints"].stringValue
        self.player.GreenCards.text = self.playersInsideJSON["lastseason"]["greencards"].stringValue
        self.player.RedCards.text = self.playersInsideJSON["lastseason"]["redcards"].stringValue
        self.player.YellowCards.text = self.playersInsideJSON["lastseason"]["yellowcards"].stringValue
        self.player.raids.text = self.playersInsideJSON["lastseason"]["raids"].stringValue
        self.player.successfulRaids.text = self.playersInsideJSON["lastseason"]["successfulraids"].stringValue
        self.player.unsuccessfulRaids.text = self.playersInsideJSON["lastseason"]["unsuccessfulraids"].stringValue
        self.player.emptyRaids.text = self.playersInsideJSON["lastseason"]["emptyraids"].stringValue
        self.player.tackles.text = self.playersInsideJSON["lastseason"]["tackles"].stringValue
        self.player.totalPoints.text = self.playersInsideJSON["lastseason"]["successfultackles"].stringValue
        self.player.successfulTackles.text = self.playersInsideJSON["lastseason"]["unsuccessfultackles"].stringValue
        player.lastSeason.alpha = 1.0
        player.playerCareer.alpha = 0.6
        player.currentSeason.alpha = 0.6
    }
    
    func playerCareer(_ sender: UIButton){
        
        self.player.matchesPlayed.text = self.playersInsideJSON["career"]["matchplayed"].stringValue
        self.player.totalPoints.text = self.playersInsideJSON["career"]["totalpoints"].stringValue
        self.player.totalRaidPoints.text = self.playersInsideJSON["career"]["totalraidpoints"].stringValue
        self.player.totalDefencePoints.text = self.playersInsideJSON["career"]["totaldefencepoints"].stringValue
        self.player.GreenCards.text = self.playersInsideJSON["career"]["greencards"].stringValue
        self.player.RedCards.text = self.playersInsideJSON["career"]["redcards"].stringValue
        self.player.YellowCards.text = self.playersInsideJSON["career"]["yellowcards"].stringValue
        self.player.raids.text = self.playersInsideJSON["career"]["raids"].stringValue
        self.player.successfulRaids.text = self.playersInsideJSON["career"]["successfulraids"].stringValue
        self.player.unsuccessfulRaids.text = self.playersInsideJSON["career"]["unsuccessfulraids"].stringValue
        self.player.emptyRaids.text = self.playersInsideJSON["career"]["emptyraids"].stringValue
        self.player.tackles.text = self.playersInsideJSON["career"]["tackles"].stringValue
        self.player.successfulTackles.text = self.playersInsideJSON["career"]["successfultackles"].stringValue
        self.player.unsuccessfulTackles.text = self.playersInsideJSON["career"]["unsuccessfultackles"].stringValue
        player.lastSeason.alpha = 0.6
        player.playerCareer.alpha = 1.0
        player.currentSeason.alpha = 0.6
    }

    func currentCareer(_ sender: UIButton){
        
        self.player.matchesPlayed.text = self.playersInsideJSON["current"]["matchplayed"].stringValue
        self.player.totalPoints.text = self.playersInsideJSON["current"]["totalpoints"].stringValue
        self.player.totalRaidPoints.text = self.playersInsideJSON["current"]["totalraidpoints"].stringValue
        self.player.totalDefencePoints.text = self.playersInsideJSON["current"]["totaldefencepoints"].stringValue
        self.player.GreenCards.text = self.playersInsideJSON["current"]["greencards"].stringValue
        self.player.RedCards.text = self.playersInsideJSON["current"]["redcards"].stringValue
        self.player.YellowCards.text = self.playersInsideJSON["current"]["yellowcards"].stringValue
        self.player.raids.text = self.playersInsideJSON["current"]["raids"].stringValue
        self.player.successfulRaids.text = self.playersInsideJSON["current"]["successfulraids"].stringValue
        self.player.unsuccessfulRaids.text = self.playersInsideJSON["current"]["unsuccessfulraids"].stringValue
        self.player.emptyRaids.text = self.playersInsideJSON["current"]["emptyraids"].stringValue
        self.player.tackles.text = self.playersInsideJSON["current"]["tackles"].stringValue
        self.player.successfulTackles.text = self.playersInsideJSON["current"]["successfultackles"].stringValue
        self.player.unsuccessfulTackles.text = self.playersInsideJSON["current"]["unsuccessfultackles"].stringValue
        player.lastSeason.alpha = 0.6
        player.playerCareer.alpha = 0.6
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
