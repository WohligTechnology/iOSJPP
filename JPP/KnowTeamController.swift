//
//  KnowTeamController.swift
//  JPP
//
//  Created by Chintan Shah on 26/01/16.
//  Copyright © 2016 Wohlig Technology. All rights reserved.
//

import UIKit

class KnowTeamController: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate {
    @IBOutlet weak var playersCollection: UICollectionView!
    var getPlayers: JSON = []
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setNavigationBarItemText("KNOW YOUR PANTHERS")
        print("HEllo")
        
        // Do any additional setup after loading the view.
        getAllPlayer()
        
    }
    
    
    func getAllPlayer(){
        rest.getAllPlayers(completion: {(json:JSON) -> () in
            DispatchQueue.main.sync(execute: {
                if json == 401 {
                    print("No Data Found")
                }else{
                    
                    print(json)
                    self.getPlayers = json["queryresult"]
                    print("i want this\(self.getPlayers)")
                    print("givecount\(self.getPlayers.count)")
                    self.playersCollection.reloadData()
                }
            })
            
        })

    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.getPlayers.count;
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "playerCell", for: indexPath) as UICollectionViewCell
        //cell.addSubview(player(frame: CGRectMake(8,8,cell.frame.width - 8,cell.frame.height - 8)));
        
        let mediaBox = player(frame: CGRect(x: 8,y: 8,width: cell.frame.width - 8,height: cell.frame.height - 8));
        mediaBox.playerTitle.text = getPlayers[indexPath.row]["name"].stringValue
       mediaBox.playerImage.hnk_setImageFromURL(rest.getImageCache(getPlayers[indexPath.row]["smallimage"].string!))
//        mediaBox.playerImage.image = UIImage(named:players[(indexPath as NSIndexPath).row].image)
        mediaBox.playerPosition.text = getPlayers[indexPath.row]["type"].stringValue
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
        if(getPlayers[indexPath.row]["status"].stringValue == "1"){
            playerIndex = getPlayers[indexPath.row]["id"].stringValue
            self.performSegue(withIdentifier: "playerInside", sender: indexPath)
            
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didHighlightItemAt indexPath: IndexPath) {
//       playerIndex = getPlayers[indexPath.row]["id"].stringValue
//         print("showindex\(playerIndex)")
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       
        if segue.identifier == "playersInside"{
            let controller = segue.destination as! PlayerInsideViewController
            controller.players = playerIndex
        }else{
//            let controller = segue.destination as! PlayerInsideViewController
//            controller.players = playerIndex
        }
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
