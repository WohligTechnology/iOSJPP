//
//  HomeController.swift
//  JPP
//
//  Created by Chintan Shah on 26/01/16.
//  Copyright © 2016 Wohlig Technology. All rights reserved.
//

import UIKit
import SwiftyJSON

class HomeController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    var verticalLayout : VerticalLayout!
    
//    func checkThis(json:JSON) {
//        print(json);
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
//        rest.callAPI(checkThis)
        
        self.setNavigationBarItem()
        self.verticalLayout = VerticalLayout(width: self.view.frame.width);
        self.scrollView.insertSubview(self.verticalLayout, atIndex: 0)
        
        
        let updates = schedule(frame: CGRectMake(8,8,verticalLayout.frame.width-16,300));
        self.verticalLayout.addSubview(updates);
        updates.addToCalendar.hidden = true;
        
        updates.trapLabel.text = "LATEST UPDATE"
        
        let newsBox = news(frame: CGRectMake(8,8,verticalLayout.frame.width-16,280) );
        self.verticalLayout.addSubview(newsBox);
        
        let teamTitle = team2(frame: CGRectMake(8,8,verticalLayout.frame.width-16,34) );
        self.verticalLayout.addSubview(teamTitle);
        
        let PinkBox = UIView(frame:CGRectMake(8,0,verticalLayout.frame.width-16,300));
        PinkBox.backgroundColor = PinkColor;
        self.verticalLayout.addSubview(PinkBox);
        
        let tableHeader = table(frame: CGRectMake(8,8,PinkBox.frame.width-16,44));
        
        tableHeader.tableNo.font = UIFont(name:"Oswald-Bold", size: 14.0)
        tableHeader.tableNo.text = "No."
        
        
        tableHeader.tableTeam.font = UIFont(name:"Oswald-Bold", size: 14.0)
        tableHeader.tableTeam.text = "Team"
        
        
        tableHeader.tablePlayed.font = UIFont(name:"Oswald-Bold", size: 14.0)
        tableHeader.tablePlayed.text = "P"
        
        tableHeader.tableWon.font = UIFont(name:"Oswald-Bold", size: 14.0)
        tableHeader.tableWon.text = "W"
        
        tableHeader.tableLost.font = UIFont(name:"Oswald-Bold", size: 14.0)
        tableHeader.tableLost.text = "L"
        
        tableHeader.tablePoint.font = UIFont(name:"Oswald-Bold", size: 14.0)
        tableHeader.tablePoint.text = "PTS"
        
        
        PinkBox.addSubview(tableHeader)
        
        let topSpaceinPink = 8;
        let spacingPink = 3;
        
        
        for(var i=0;i<5;i++)
        {
            
            let topDistance = topSpaceinPink+spacingPink+((44+spacingPink)*(i+1));
            let insideTable = table(frame: CGRectMake(8,CGFloat(topDistance),PinkBox.frame.width-16,44));
            
            PinkBox.addSubview(insideTable);
        }
        
        
        
        
        
        
        resizeView(8);
        
    }
    
    func resizeView(offset:CGFloat)
    {
        self.verticalLayout.layoutSubviews()
        self.scrollView.contentSize = CGSize(width: self.verticalLayout.frame.width, height: self.verticalLayout.frame.height + offset)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
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
