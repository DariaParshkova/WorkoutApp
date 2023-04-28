//
//  Resourses.swift
//  WorkoutApp
//
//  Created by Parshkova Daria on 28.04.2023.
//

import UIKit

enum Resources {
    enum Colors {
        static var active = UIColor(hexString: "#8F36C9")
        static var inactive = UIColor(hexString: "EAE7F0")
        static var separator = UIColor(hexString: "DDDDDD")
        
    }
    enum Strings {
        enum TabBar {
            static var overview = "Overview"
            static var session = "Session"
            static var progress = "Progress"
            static var settings = "Settings"
        }
    }
    
    enum Images {
        enum TabBar {
        static var overview = UIImage(named: "overview_tab")
        static var session = UIImage(named: "session_tab")
        static var progress = UIImage(named: "progress_tab")
        static var settins = UIImage(named: "settings_tab")
        }
    }
    
}
