//
//  TeamPlayers.swift
//  JPP
//
//  Created by Chintan Shah on 28/01/16.
//  Copyright © 2016 Wohlig Technology. All rights reserved.
//

import Foundation
import UIKit


public class Player {
    
    var name = ""
    var achieve = ""
    var tour = ""
    var age = ""
    var type = ""
    var nativePlace = ""
    var jerseyNo = ""
    var image = ""
    
    init(name:String, achieve:String, tour:String, age:String, type:String, nativePlace:String, jerseyNo:String, image:String) {
        self.name = name
        self.achieve = achieve
        self.tour = tour
        self.age = age
        self.type = type
        self.nativePlace = nativePlace
        self.jerseyNo = jerseyNo
        self.image = image
        
        return
    }
    
}



