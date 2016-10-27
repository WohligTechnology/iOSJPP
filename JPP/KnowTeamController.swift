//
//  KnowTeamController.swift
//  JPP
//
//  Created by Chintan Shah on 26/01/16.
//  Copyright © 2016 Wohlig Technology. All rights reserved.
//

import UIKit

class KnowTeamController: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setNavigationBarItemText("KNOW YOUR PANTHERS")
        
        // Do any additional setup after loading the view.
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return players.count;
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "playerCell", for: indexPath) as UICollectionViewCell
        //cell.addSubview(player(frame: CGRectMake(8,8,cell.frame.width - 8,cell.frame.height - 8)));
        
        let mediaBox = player(frame: CGRect(x: 8,y: 8,width: cell.frame.width - 8,height: cell.frame.height - 8));
        mediaBox.playerTitle.text = players[(indexPath as NSIndexPath).row].name
        mediaBox.playerImage.image = UIImage(named:players[(indexPath as NSIndexPath).row].image)
        mediaBox.playerPosition.text = players[(indexPath as NSIndexPath).row].type
        mediaBox.index = (indexPath as NSIndexPath).row
        mediaBox.layer.borderWidth = 1
        mediaBox.layer.borderColor = UIColor(red:18/255.0, green:126/255.0, blue:165/255.0, alpha: 1.0).cgColor
        cell.addSubview(mediaBox)
        
        return cell
    }
    
    func collectionView(_ collectionView : UICollectionView,layout collectionViewLayout:UICollectionViewLayout,sizeForItemAtIndexPath indexPath:IndexPath) -> CGSize
    {
        
        return CGSize(width: self.view.frame.width/2 - 4, height: self.view.frame.width/2)
    }
    
    func collectionView(_ collectionView: UICollectionView,
        didSelectItemAt indexPath: IndexPath) {
            playerIndex = (indexPath as NSIndexPath).row
    }
    
    func collectionView(_ collectionView: UICollectionView, didHighlightItemAt indexPath: IndexPath) {
       playerIndex = (indexPath as NSIndexPath).row
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
