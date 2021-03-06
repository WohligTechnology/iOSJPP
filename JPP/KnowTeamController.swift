//
//  KnowTeamController.swift
//  JPP
//
//  Created by Chintan Shah on 26/01/16.
//  Copyright © 2016 Wohlig Technology. All rights reserved.
//

import UIKit
import SwiftyJSON
class KnowTeamController: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setNavigationBarItemText("KNOW YOUR PANTHERS")
        
        // Do any additional setup after loading the view.
    }
    
    
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return players.count;
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("playerCell", forIndexPath: indexPath) as UICollectionViewCell
        //cell.addSubview(player(frame: CGRectMake(8,8,cell.frame.width - 8,cell.frame.height - 8)));
        
        let mediaBox = player(frame: CGRectMake(8,8,cell.frame.width - 8,cell.frame.height - 8));
        mediaBox.playerTitle.text = players[indexPath.row].name
        mediaBox.playerImage.image = UIImage(named:players[indexPath.row].image)
        mediaBox.playerPosition.text = players[indexPath.row].type
        mediaBox.index = indexPath.row
        mediaBox.layer.borderWidth = 1
        mediaBox.layer.borderColor = UIColor(red:18/255.0, green:126/255.0, blue:165/255.0, alpha: 1.0).CGColor
        cell.addSubview(mediaBox)
        
        return cell
    }
    
    func collectionView(collectionView : UICollectionView,layout collectionViewLayout:UICollectionViewLayout,sizeForItemAtIndexPath indexPath:NSIndexPath) -> CGSize
    {
        
        return CGSizeMake(self.view.frame.width/2 - 4, self.view.frame.width/2)
    }
    
    func collectionView(collectionView: UICollectionView,
        didSelectItemAtIndexPath indexPath: NSIndexPath) {
            playerIndex = indexPath.row
    }
    
    func collectionView(collectionView: UICollectionView, didHighlightItemAtIndexPath indexPath: NSIndexPath) {
       playerIndex = indexPath.row
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
