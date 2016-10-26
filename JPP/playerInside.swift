//
//  media.swift
//  JPP
//
//  Created by Chintan Shah on 26/01/16.
//  Copyright © 2016 Wohlig Technology. All rights reserved.
//
import UIKit

@IBDesignable class playerInside: UIView {
    
    @IBOutlet weak var playerPer: player!
    
    @IBOutlet weak var playerNative: UILabel!
    @IBOutlet var playerNativePlace: UILabel!
    
    @IBOutlet var playerAgeView: UIView!
    @IBOutlet weak var playerAge: UILabel!
    
    @IBOutlet weak var playerJersey: UILabel!
    @IBOutlet var playerJerseyNo: UILabel!
    
    @IBOutlet weak var playerAchivements: UILabel!
    
    @IBOutlet weak var playerTournaments: UILabel!
    @IBOutlet weak var achivementsLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        loadViewFromNib ()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        loadViewFromNib ()
        
    }
    func loadViewFromNib() {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: "playerInside", bundle: bundle)
        let sortnewview = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
        sortnewview.frame = bounds
        sortnewview.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.addSubview(sortnewview);
        
//        let borderLeft = CALayer()
//        let borderRight = CALayer()
//        let width = CGFloat(1.0)
//        
//        borderLeft.borderColor = UIColor.purpleColor().CGColor
//        borderLeft.frame = CGRect(x: 1, y: 0, width: width, height: playerAgeView.frame.size.height)
//        borderLeft.borderWidth = width
//        
//        borderRight.borderColor = UIColor.purpleColor().CGColor
//        borderRight.frame = CGRect(x: playerAgeView.frame.size.width - 4, y: 0, width: width, height: playerAgeView.frame.size.height)
//        borderRight.borderWidth = width
//        
//        playerAgeView.layer.addSublayer(borderLeft)
//        playerAgeView.layer.addSublayer(borderRight)
//        playerAgeView.layer.masksToBounds = true
        
        //self.playerAgeView.layer.borderWidth = 1
        //self.playerAgeView.layer.borderColor = UIColor.purpleColor().CGColor
    }
    
    
    
}
