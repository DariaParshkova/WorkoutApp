//
//  Resourses.swift
//  WorkoutApp
//
//  Created by Parshkova Daria on 28.04.2023.
//

import UIKit

enum R {
    enum Colors {
        static let active = UIColor(hexString: "#437BFE") //"#8F36C9")
        static let inactive = UIColor(hexString: "#929DA5") //"#EAE7F0"
        
        static let background = UIColor(hexString: "#F8F9F9")
        static let separator = UIColor(hexString: "#E8ECEF")
        static let secondary = UIColor(hexString: "#F0F3FF")
        
        
        static let titleGray = UIColor(hexString: "#545C77")
        
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
            static let session  = "High Intensity Cardio"
            static let overview = "Today"
            
        }
        enum Sessions {
            static let navBarLeft = "Pause"
            static let navBarRight = "Finish"
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
            static let downArrow = UIImage(named: "down_arrow")
            static let add = UIImage(named: "add_button")
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
