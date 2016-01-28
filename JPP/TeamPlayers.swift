//
//  TeamPlayers.swift
//  JPP
//
//  Created by Chintan Shah on 28/01/16.
//  Copyright © 2016 Wohlig Technology. All rights reserved.
//

import Foundation
import UIKit


public class player {
    
    var name = ""
    var achieve = ""
    var tour = ""
    var age = ""
    var type = ""
    var nativePlace = ""
    var jerseyNo = ""
    
    init(name:String, achieve:String, tour:String, age:String, type:String, nativePlace:String, jerseyNo:String) {
        self.name = name
        self.achieve = achieve
        self.tour = tour
        self.age = age
        self.type = type
        self.nativePlace = nativePlace
        self.jerseyNo = jerseyNo
        
        return
    }
    
}


var players:[Player]!
players[0] = Player(name: "Navneet Gautam", achieve: "Pro-kabaddi (2014)- 1st Position, Arjun Awardee - (2007), Asian Games (2006-10-14) - 1st Position, World Cup (2004) (2007) - 1st Position, Indoor Asian Game (2007)(2009) - 1st Position", tour: "Pro-Kabaddi (2015-2014), Asian Games (2006 -10 -14), WorldCup (2004)(2007), Indoor Asian Games (2007))(2009) ", age: "32", type: "Defender", nativePlace: "Jaipur", jerseyNo: "07")

players[1] = Player(name: "Raju Lal Choudhary", achieve: "Pro-kabaddi (2014)- 1st Position,National Games (2011)-1st Position, Senior National (2015) - 3rd Position", tour: "Pro-Kabaddi (2015-2014)National Games (2011), Senior National Games (2015), All India Police Games (2008-15)", age: "26", type: "Defender", nativePlace: "Jaipur", jerseyNo: "12")

players[2] = Player(name: "Jasvir Singh", achieve: "Pro-kabaddi (2014)- 1st Position,Senior National (2013) - 1st Position, National Game (2011)- 1st Position, Indoor Asian Game (2013) - 1st Position, Asian Game (2014) - 1st Position.", tour: "Pro-Kabaddi (2015-2014),Senior National (2013), National Game (2011), Indoor Asian Game (2013), Asian Game (2014)", age: "31", type: "Raider", nativePlace: "Panipat", jerseyNo: "02")

players[3] = Player(name: "Rajesh Narwal", achieve: "Pro-kabaddi (2014)- 1st Position,Beach Asian Games (2014) - 3rd Position, National Games (2015) - 1st Position, (2011) - 3rd Position, Senior National (2013-15) - 2nd Position", tour: "Pro-Kabaddi (2015-2014),Beach Asian Game (2014), National Games (2011) (2015), Senior National (2008-15), ", age: "25", type: "All Rounder", nativePlace: "Sonipat", jerseyNo: "11")

players[4] = Player(name: "Ran Singh", achieve: "Pro-kabaddi (2014)- 1st Position,Senior National (2007) - 2nd Position, Senior National (2006) - 3rd Position, All India Police Tournament (2008) (2011) - 1st Position, All India Police Tournament (2009-10) - 3rd Position, Dept. National Tournament (2014) - 2nd Position", tour: "Pro-Kabaddi (2015-2014),Senior National (2002-08), Senior National (2014), Dept. National Tournament  (2014), All India Police Tournanment (2008-11)", age: "28", type: "All Rounder", nativePlace: "Sangrur", jerseyNo: "33")

players[5] = Player(name: "Gangadhari Mallesh", achieve: "Pro-kabaddi (2014)- 1st Position,School Nationals(2008) -3rd Position", tour: "Pro-Kabaddi (2015-2014),Senior National (2015-2012),Junior National Championship (2012-2009), School Nationals(2009-2009)", age: "22", type: "All Rounder", nativePlace: "Choutapally", jerseyNo: "10")

players[6] = Player(name: "Rohit Rana", achieve: "Pro-kabaddi (2014)- 1st Position,National Games (2014) - 3rd Position, Dept. National (2011-14) - 1st Postion", tour: "Pro-Kabaddi (2015-2014), National Games (2010-15), Senior National  (2010-14), Dept National (2011-14)", age: "27", type: "Defender", nativePlace: "Dharmshala", jerseyNo: "05")

players[7] = Player(name: "Samarjeet Singh", achieve: "Pro-kabaddi (2014)- 1st Position,Asian Games (2010) - 1st Position , Indoor Asian Games (2010) - 1st Postion, Safe Games (2010) -1st Position, Indoor Asian Games (2013)", tour: "Pro-Kabaddi (2015-2014),Asian Games (2010),Indoor Asian Games (2010), Safe Games (2010), Indoor Asian Games (2013)", age: "29", type: "All Rounder", nativePlace: "Khedi Daulatpur", jerseyNo: "77")

players[8] = Player(name: "Sanjay Shrestha", achieve: "Pro-kabaddi (2014)- 1st Position", tour: "Pro-Kabaddi (2015-2014),World Cup ( , 9th Safe game, 10th Safe Game, 11th Safe Game ", age: "31", type: "All Rounder", nativePlace: "Dhanusha", jerseyNo: "04")

players[9] = Player(name: "Sonu Narwal", achieve: "All India Police (2009) - 1st Position, Asian Championship (2005) - 1st Position , Asian Games (2010)- 1st Position, Beach Asian Games (2011) - 2nd Position.", tour: "Pro-Kabaddi (2015),Senior National Game (2008-09), Asian Championship(2005), Asian Game (2010), Beach Asian Game(2011), All India Police Kabaddi (2009-10-11)", age: "29", type: "Raider", nativePlace: "Sonipat", jerseyNo: "22")

players[10] = Player(name: "Kuldeep Singh", achieve: "National (2012-13) - 1st Position, National Game (2011) - 3rd Position, Dept. National (2008)- 2nd Position, (2009)- 1st Position.", tour: "Pro-Kabaddi (2015),National Game (2011), National (2008-15), Dept. National (2008-09)", age: "23", type: "All Rounder", nativePlace: "Sonipat", jerseyNo: "08")

players[11] = Player(name: "C. Arun", achieve: "All India University (2012) - 1st Position.", tour: "Pro-Kabaddi (2015),All India University (2012), Senior National (2015)", age: "22", type: "Defender", nativePlace: "Thiruvarur", jerseyNo: "03")

players[12] = Player(name: "Anil Patil", achieve: "Senior National(2007)-1st Position,Senior National (2011, 2012)- 3rd Position ,Departmental National (2014)- 3rd Position,", tour: "Senior National- (2007-2009,2011-2012), Departmental National (2006,2010,2013-2015)", age: "33", type: "All Rounder", nativePlace: "Mumbai", jerseyNo: "01")

players[13] = Player(name: "Rohit Kumar Prajapat", achieve: "Sub Junior National Under 16  (2012) - 2nd Position, Under 19 School national (2012)- 3rd PositionJunior National Federation Cup (2014)- 3rd Position, Senior West Zone (2015) - 3rd Position", tour: "Pro-Kabaddi (2015), Under 20 Junior National (2012-14), All India University kabbadi tournament(2014), Under 19 School National(2012), Under 16 Sub Juniour National(2011), Junior National Federation cup (2014), Senior West Zone (2015)", age: "19", type: "Raider", nativePlace: "Jaipur", jerseyNo: "14")

players[14] = Player(name: "Jagdeesha K.K", achieve: "Departmental National Campionship (2014-2012) - 2nd Position, Departmental National Campionship (2006-2002)- 1st Position, Asian Cup (2002)- 1st Position, Senior National (2005-2003) -1st Position, Senior Federation Cup (2003)- 1st Position", tour: "Departmental National Campionship- (2015-1999),Senior National (2013-1999),National Games (2003-1999), Senior Federation Cup (2006-2003), Asian Cup(2002)", age: "", type: "Defender", nativePlace: "Koipaddy", jerseyNo: "09")

players[15] = Player(name: "Satish kumar", achieve: "Senior National (2007,2008,2011)- 1st Positon, Senior National (2015)- 2nd Position,Senior Federation (2006) - 3rd Position, Beach Kabaddi National Campionship (2008) - 1st Position", tour: "Senior National -(2007,2008,2011,2015),Senior Federation Cup (2006), Beach Kabaddi National Campionship(2008)", age: "31", type: "Raider", nativePlace: "Rohera", jerseyNo: "06")

players[16] = Player(name: "Mohammad Maghsoudlou", achieve: "Asian Indoor Kabaddi Games Incheon (2014)-2nd Position, Asian Beach Kabaddi Games China (2012)-1st Position, National Kabaddi Championship (2008,2009,2010,2011,2012)-1st Position, National Kabaddi Premier League (2006,2007)-1st Position", tour: "", age: "25", type: "All Rounder", nativePlace: "Gorgan", jerseyNo: "23")

players[17] = Player(name: "Hwangi Ahn", achieve: "Incheon indoor game- Bronze Medal, National Championship (2011,2012,2013)-2nd Position, Asian Games (2014)- Bronze Medal", tour: "", age: "32", type: "", nativePlace: "Gyoung Ju", jerseyNo: "17")


