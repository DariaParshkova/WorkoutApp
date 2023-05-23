//
//  Resourses.swift
//  WorkoutApp
//
//  Created by Parshkova Daria on 28.04.2023.
//

import UIKit

enum R {
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
            static func title(for tab: Tabs) -> String {
                switch tab {
                case .overview : return "Overview"
                case .session : return "Session"
                case .progress : return "Progress"
                case .settings : return "Settings"
                }
            }
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
            static func icon(for tab:Tabs) -> UIImage?  {
                switch tab {
                case .overview : return UIImage(named: "overview_tab")
                case .session : return UIImage(named: "session_tab")
                case .progress : return UIImage(named: "progress_tab")
                case .settings: return UIImage(named: "settings_tab")
                }
            }
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
