//
//  UIViewControllerExtension.swift
//  SlideMenuControllerSwift
//
//  Created by Yuji Hato on 1/19/15.
//  Copyright (c) 2015 Yuji Hato. All rights reserved.
//

import UIKit

extension UIViewController {
    
    func setNavigationBarItem() {
        
        self.navigationController?.navigationBar.tintColor = UIColor.white
        self.navigationController?.navigationBar.titleTextAttributes = [ kCTForegroundColorAttributeName : UIColor(red: 1, green: 1, blue: 1, alpha: 0) ] as [NSAttributedStringKey : Any]
        
        self.navigationController?.navigationBar.isTranslucent = false
        self.addLeftBarButtonWithImage(UIImage(named: "ic_menu_black_24dp")!)
        self.navigationController?.toolbar.barTintColor = BlueColor
        self.navigationController?.navigationBar.barTintColor = BlueColor
        
        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = false
//        self.addRightBarButtonWithImage(UIImage(named: "ic_notifications_black_24dp")!)
        self.slideMenuController()?.removeLeftGestures()
        self.slideMenuController()?.removeRightGestures()
        self.slideMenuController()?.addLeftGestures()
        self.slideMenuController()?.addRightGestures()
        
        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = false
        let logo = UIImage(named: "ic_action_panther.png")
        let imageView = UIImageView(image:logo)
        
        let screenSize: CGRect = UIScreen.main.bounds
        imageView.frame = CGRect(x: 0,y: 14,width: 50,height: 50);
        
        imageView.contentMode = UIViewContentMode.scaleAspectFit;
        imageView.center.x  = screenSize.width/2
        self.navigationController?.view.addSubview(imageView)
    }
    
    func setNavigationBarItem1() {
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        
        self.navigationController?.navigationBar.tintColor = UIColor.white
        self.navigationController?.navigationBar.titleTextAttributes = [ kCTForegroundColorAttributeName : UIColor(red: 1, green: 1, blue: 1, alpha: 0) ] as [NSAttributedStringKey : Any]
        
        self.navigationController?.navigationBar.isTranslucent = false
        
        self.navigationController?.toolbar.barTintColor = BlueColor
        self.navigationController?.navigationBar.barTintColor = BlueColor
        
        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = false
        
        self.slideMenuController()?.removeLeftGestures()
        self.slideMenuController()?.removeRightGestures()
        self.slideMenuController()?.addLeftGestures()
        self.slideMenuController()?.addRightGestures()
        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = false
        
        let logo = UIImage(named: "ic_action_panther.png")
        let imageView = UIImageView(image:logo)
        
        let screenSize: CGRect = UIScreen.main.bounds
        imageView.frame = CGRect(x: 0,y: 14,width: 50,height: 50);
        
        imageView.contentMode = UIViewContentMode.scaleAspectFit;
        imageView.center.x  = screenSize.width/2
        self.navigationController?.view.addSubview(imageView)
    }

    
    
    func changeDateFormat(_ givenFormat: String, getFormat: String, date: String, isDate: Bool) -> String {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = givenFormat
        let date = dateFormatter.date(from: date)
        
        dateFormatter.dateFormat = getFormat
        
        if isDate {
            
            dateFormatter.dateStyle = .medium
            
        }
        var goodDate = "";
        if(date != nil) {
            goodDate = dateFormatter.string(from: date!)
        }
        return goodDate
    }

    
    
    
    func setNavigationBarItemText(_ text:String) {
        
        self.navigationController?.navigationBar.tintColor = UIColor.white
        let font = UIFont(name: "Oswald-Light", size: 18)
        self.navigationController?.navigationBar.titleTextAttributes = [ kCTFontAttributeName : font!,NSAttributedStringKey.foregroundColor : UIColor(red: 1, green: 1, blue: 1, alpha: 1) ] as! [NSAttributedStringKey : Any]
        self.navigationController?.navigationBar.isTranslucent = false
        self.addLeftBarButtonWithImage(UIImage(named: "ic_menu_black_24dp")!)
        self.navigationController?.toolbar.barTintColor = BlueColor
        self.navigationController?.navigationBar.barTintColor = BlueColor
        
        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = false
        //self.addRightBarButtonWithImage(UIImage(named: "ic_notifications_black_24dp")!)
        self.slideMenuController()?.removeLeftGestures()
        self.slideMenuController()?.removeRightGestures()
        self.slideMenuController()?.addLeftGestures()
        self.slideMenuController()?.addRightGestures()
        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = false
        self.navigationController?.navigationBar.topItem!.title = text;
        
    }
    
   
    
    func removeNavigationBarItem() {
        self.navigationItem.leftBarButtonItem = nil
        self.navigationItem.rightBarButtonItem = nil
        self.slideMenuController()?.removeLeftGestures()
        self.slideMenuController()?.removeRightGestures()
        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = false
    }
}
