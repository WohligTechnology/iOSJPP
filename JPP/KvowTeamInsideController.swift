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
    
    var scroll: UIScrollView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        scroll = UIScrollView(frame: CGRectMake(8, 8, self.view.frame.size.width, self.view.frame.size.height))
//        scroll.backgroundColor = UIColor.blackColor()
//        scroll.contentSize.height = 1000
//        scroll.layer.zPosition = 100
//        self.view.addSubview(scroll)
//        
//        scroll.addSubview(playerIn)
        
        playerIn.playerPer.playerTitle.text = players[playerIndex].name
        playerIn.playerPer.playerImage.image = UIImage(named: players[playerIndex].image)
        playerIn.playerPer.playerPosition.text = players[playerIndex].type
        
        playerIn.playerAchivements.text = players[playerIndex].achieve
        playerIn.playerTournaments.text = players[playerIndex].tour
        playerIn.playerNative.text = players[playerIndex].state
        playerIn.playerAge.text = players[playerIndex].age
        playerIn.playerJersey.text = players[playerIndex].jerseyNo
//
        self.title =  players[playerIndex].name
        
        
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
