//
//  playersInside.swift
//  JPP
//
//  Created by Pranay Joshi on 12/06/17.
//  Copyright © 2017 Wohlig Technology. All rights reserved.
//

import UIKit

class playersInside: UIView {
    @IBOutlet weak var dob: UITextField!
    @IBOutlet weak var playerType: UILabel!
    @IBOutlet weak var playerHeight: UITextField!
    @IBOutlet weak var nativePlace: UITextField!
    @IBOutlet weak var Nationality: UITextField!
    @IBOutlet weak var playerNumber: UILabel!
    @IBOutlet weak var playerImage: UIImageView!
    @IBOutlet weak var playerName: UILabel!
    @IBOutlet weak var acheivements: UIButton!
    @IBOutlet var playerView: UIView!
    @IBOutlet weak var row1Cell3: UIView!
    @IBOutlet weak var descriptionTextView: UITextView!
    @IBOutlet weak var row1Cell2: UIView!
    @IBOutlet weak var tournamentsPlayed: UIButton!
    @IBOutlet weak var matchesPlayed: UILabel!
    @IBOutlet weak var tackles: UILabel!
    @IBOutlet weak var row1Cell1: UIView!
    @IBOutlet weak var raids: UILabel!
    @IBOutlet weak var rowStack1: UIStackView!
    @IBOutlet weak var successfulTackles: UILabel!
    @IBOutlet weak var RedCards: UILabel!
    @IBOutlet weak var unsuccessfulRaids: UILabel!
    @IBOutlet weak var YellowCards: UILabel!
    @IBOutlet weak var successfulRaids: UILabel!
    @IBOutlet weak var unsuccessfulTackles: UILabel!
    @IBOutlet weak var emptyRaids: UILabel!
    @IBOutlet weak var totalPoints: UILabel!
    @IBOutlet weak var currentSeason: UIButton!
    @IBOutlet weak var lastSeason: UIButton!
    @IBOutlet weak var totalDefencePoints: UILabel!
    @IBOutlet weak var tableCell1: UIView!
    @IBOutlet weak var playerWeight: UITextField!
    @IBOutlet weak var tableview: UIView!
    @IBOutlet weak var GreenCards: UILabel!
    @IBOutlet weak var totalRaidPoints: UILabel!
    @IBOutlet weak var playerCareer: UIButton!
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
        let nib = UINib(nibName: "playersInside", bundle: bundle)
        let sortnewview1 = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
        sortnewview1.frame = bounds
        sortnewview1.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.addSubview(sortnewview1);
        tableview.layer.borderWidth = 1
//        tableCell1.layer.borderWidth = 1
//        row1Cell1.layer.borderColor = UIColor(colorLiteralRed: 0/255, green: 0/255, blue: 0/255, alpha: 0.5).cgColor
//        row1Cell2.layer.borderColor = UIColor(colorLiteralRed: 0/255, green: 0/255, blue: 0/255, alpha: 0.5).cgColor
//        row1Cell2.layer.borderColor = UIColor(colorLiteralRed: 0/255, green: 0/255, blue: 0/255, alpha: 0.5).cgColor
//        row1Cell1.layer.borderWidth = 1
//        row1Cell2.layer.borderWidth = 1
//        row1Cell3.layer.borderWidth = 1
    }


    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
