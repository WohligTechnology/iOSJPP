//
//  doneMatch.swift
//  JPP
//
//  Created by Chintan Shah on 09/02/16.
//  Copyright © 2016 Wohlig Technology. All rights reserved.
//

import UIKit

@IBDesignable class doneMatch: UIView {
    
    @IBOutlet var teamOneScore: UILabel!
    @IBOutlet weak var teamTwoScore: UILabel!
    let borderWidth:CGFloat = 3
    @IBOutlet weak var fulltimeText: UILabel!
    
    @IBOutlet weak var team1image: UIImageView!
    @IBOutlet weak var team2image: UIImageView!
    override init(frame: CGRect) {
        super.init(frame: frame)
        loadViewFromNib ()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        loadViewFromNib ()
        
    }
    
    func loadViewFromNib() {
        let bundle = NSBundle(forClass: self.dynamicType)
        let nib = UINib(nibName: "doneMatch", bundle: bundle)
        let sortnewview = nib.instantiateWithOwner(self, options: nil)[0] as! UIView
        sortnewview.frame = bounds
        sortnewview.autoresizingMask = [.FlexibleWidth, .FlexibleHeight]
        self.addSubview(sortnewview);
        
        // font and border to score
        //self.teamOneScore.font = UIFont(name: "Kenyan-Coffee", size: 45)
        //self.teamTwoScore.font = UIFont(name: "Kenyan-Coffee", size: 45)
        //self.teamOneScore.layer.borderWidth = borderWidth
        //self.teamOneScore.layer.borderColor = UIColor.whiteColor().CGColor
        //self.teamTwoScore.layer.borderWidth = borderWidth
        //self.teamTwoScore.layer.borderColor = UIColor.whiteColor().CGColor
        
        //self.teamOneScore.attributedText = NSAttributedString(string: "38", attributes: [NSForegroundColorAttributeName : PinkColor, NSStrokeColorAttributeName : UIColor.whiteColor(), NSStrokeWidthAttributeName : 3, NSFontAttributeName : UIFont(name: "Kenyan-Coffee", size: 45)!])
        
    }
    
}