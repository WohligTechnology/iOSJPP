//
//  media.swift
//  JPP
//
//  Created by Chintan Shah on 26/01/16.
//  Copyright © 2016 Wohlig Technology. All rights reserved.
//
import UIKit

@IBDesignable class playerInside: UIView {
    
    @IBOutlet weak var playerImage: player!
    @IBOutlet weak var playerName: player!
    @IBOutlet weak var playerPosition: player!
    @IBOutlet weak var playerNationality: UILabel!
    
    @IBOutlet weak var playerBirth: UILabel!
    @IBOutlet weak var playerJerseyno: UILabel!
    @IBOutlet weak var playerDesc: UILabel!
    
    
    
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
        let nib = UINib(nibName: "playerInside", bundle: bundle)
        let sortnewview = nib.instantiateWithOwner(self, options: nil)[0] as! UIView
        sortnewview.frame = bounds
        sortnewview.autoresizingMask = [.FlexibleWidth, .FlexibleHeight]
        self.addSubview(sortnewview);
    }
    
    
    
}