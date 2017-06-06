//
//  schedule.swift
//  JPP
//
//  Created by Chintan Shah on 25/01/16.
//  Copyright © 2016 Wohlig Technology. All rights reserved.
//

import UIKit

@IBDesignable class player: UIView {
    
    @IBOutlet weak var playerImage: UIImageView!
    @IBOutlet weak var playerTitle: UILabel!
    @IBOutlet weak var playerPosition: UILabel!
    var index:Int = 0
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
        let nib = UINib(nibName: "player", bundle: bundle)
        let sortnewview = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
        sortnewview.frame = bounds
        sortnewview.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.addSubview(sortnewview);
        
        self.playerTitle.text = playerTitle.text?.uppercased()
        self.playerPosition.text = playerPosition.text?.uppercased()
    }
    
    
    
}
