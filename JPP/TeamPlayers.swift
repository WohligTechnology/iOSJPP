//
//  TeamPlayers.swift
//  JPP
//
//  Created by Chintan Shah on 28/01/16.
//  Copyright © 2016 Wohlig Technology. All rights reserved.
//

import Foundation
import UIKit


open class Player {
    
    var name = ""
    var achieve = ""
    var tour = ""
    var age = ""
    var type = ""
    var state = ""
    var jerseyNo = ""
    var image = ""
    
    init(name:String, achieve:String, tour:String, age:String, type:String, state:String, jerseyNo:String, image:String) {
        self.name = name
        self.achieve = achieve
        self.tour = tour
        self.age = age
        self.type = type
        self.state = state
        self.jerseyNo = jerseyNo
        self.image = image
        
        return
    }
    
}
