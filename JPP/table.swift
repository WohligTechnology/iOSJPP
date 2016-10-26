//
//  schedule.swift
//  JPP
//
//  Created by Chintan Shah on 25/01/16.
//  Copyright © 2016 Wohlig Technology. All rights reserved.
//

import UIKit

@IBDesignable class table: UIView {
    
    @IBOutlet weak var tableNo: UILabel!
    @IBOutlet weak var tableTeam: UILabel!
    @IBOutlet weak var tablePlayed: UILabel!
    @IBOutlet weak var tableWon: UILabel!
    @IBOutlet weak var tableLost: UILabel!
    @IBOutlet weak var tablePoint: UILabel!
    
    @IBOutlet weak var tableDraw: UILabel!
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
        let nib = UINib(nibName: "table", bundle: bundle)
        let sortnewview = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
        sortnewview.frame = bounds
        sortnewview.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.addSubview(sortnewview);
    }
    
    
    
}
