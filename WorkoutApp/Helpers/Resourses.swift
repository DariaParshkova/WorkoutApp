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
        static var inactive = UIColor(hexString: "#EAE7F0")
        
        static var background = UIColor(hexString: "#F8F9F9")
        static var separator = UIColor(hexString: "#DDDDDD")
        static var secondary = UIColor(hexString: "#D8D8D8")
        
        
        static var titleGray = UIColor(hexString: "#545C77")
        
    }
    enum Strings {
        enum TabBar {
            static var overview = "Overview"
            static var session = "Session"
            static var progress = "Progress"
            static var settings = "Settings"
        }
        enum NavBar {
            static var session  = "High Intensity Cardio"
            static var overview = "Today"
        }
        enum Sessions {
            static var navBarLeft = "Pause"
            static var navBarRight = "Finish"
        }
        enum Overview {
            static var allWorkoutsButton = "all workouts"
        }
    }
    
    enum Images {
        enum TabBar {
        static var overview = UIImage(named: "overview_tab")
        static var session = UIImage(named: "session_tab")
        static var progress = UIImage(named: "progress_tab")
        static var settins = UIImage(named: "settings_tab")
        }
        enum Common {
            static var downArrow = UIImage(named: "down_arrow")
            static var add = UIImage(named: "add_button")
        }
        
    }
    enum Fonts {
        static func helveticaRegular(with size: CGFloat) -> UIFont {
            UIFont(name: "Helvetica", size: size) ?? UIFont()
        }
    }
    
    enum OverView {
        static var allWorkoutsButton = "All Workouts"
    }
   
   
}
