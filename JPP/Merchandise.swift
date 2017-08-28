//
//  Merchandise.swift
//  JPP
//
//  Created by Pranay Joshi on 19/08/17.
//  Copyright © 2017 Wohlig Technology. All rights reserved.
//

import UIKit

class Merchandise: UIView {

    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var buyNow: UIButton!
    @IBOutlet weak var productPrice: UILabel!
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var merchandiseView: UIView!
    override init(frame: CGRect) {
        super.init(frame: frame)
        loadViewFromNib ()
        merchandiseView.layer.borderWidth = 2
        merchandiseView.layer.borderColor = BlueColor.cgColor
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func loadViewFromNib() {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: "Merchandise", bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
        view.frame = bounds
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.addSubview(view);


}

}
