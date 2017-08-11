//
//  sponsorsView.swift
//  JPP
//
//  Created by Chintan Shah on 12/07/16.
//  Copyright © 2016 Wohlig Technology. All rights reserved.
//


class sponsorsView: UIView {
    
    @IBOutlet weak var sponImg: UIImageView!
    @IBOutlet weak var sponsorImage: UIImageView!
        
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
            let nib = UINib(nibName: "sponsorsView", bundle: bundle)
            let sortnewview = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
            sortnewview.frame = bounds
            sortnewview.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            self.addSubview(sortnewview);
        }
}
