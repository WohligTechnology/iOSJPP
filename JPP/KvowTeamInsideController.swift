//
//  KvowTeamInsideController.swift
//  JPP
//
//  Created by Chintan Shah on 26/01/16.
//  Copyright © 2016 Wohlig Technology. All rights reserved.
//

import UIKit
import SwiftyJSON
class KvowTeamInsideController: UIViewController {
    
    @IBOutlet weak var playerIn: playerInside!
    var verticalLayout : VerticalLayout!
    var scroll: UIScrollView!
    @IBOutlet weak var playerScrollView: UIScrollView!
    let height: CGFloat = 620
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.verticalLayout = VerticalLayout(width: self.view.frame.size.width - 8)
        
        let playerInsideView = playerInside(frame: CGRect(x: 8, y: 8, width: verticalLayout.frame.size.width - 8, height: height - 8))
        //playerInsideView.frame.size.height = playerInside.
        
        scroll = UIScrollView(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height - 65))
        scroll.contentSize.height = self.view.frame.size.height - 65
        //print("\(playerInsideView.frame.size.height)")
        scroll.layer.zPosition = 100
        
        //playerScrollView.insertSubview(self.verticalLayout, atIndex: 0)
        
        //playerIn = playerInside(frame: CGRectMake(8, 8, self.view.frame.size.width, self.view.frame.size.height))
        playerInsideView.playerPer.playerTitle.text = players[playerIndex].name
        playerInsideView.playerPer.playerImage.image = UIImage(named: players[playerIndex].image)
        playerInsideView.playerPer.playerPosition.text = players[playerIndex].type
        
        playerInsideView.playerAchivements.text = players[playerIndex].achieve
        playerInsideView.playerTournaments.text = players[playerIndex].tour
        playerInsideView.playerNative.text = players[playerIndex].state
        playerInsideView.playerAge.text = players[playerIndex].age
        playerInsideView.playerJersey.text = players[playerIndex].jerseyNo
        
        if(players[playerIndex].achieve == "")
        {
            playerInsideView.achivementsLabel.text = "";
        }
        
        self.title =  players[playerIndex].name
        
        self.view.addSubview(scroll)
        scroll.addSubview(verticalLayout)
        self.verticalLayout.addSubview(playerInsideView)
        
        resizeView(8)
    }
    
    func resizeView(_ offset:CGFloat) {
        self.verticalLayout.layoutSubviews()
        scroll.contentSize = CGSize(width: self.verticalLayout.frame.width, height: height + offset)
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
