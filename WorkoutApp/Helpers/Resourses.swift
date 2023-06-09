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
            static let progress = "Workout Progress"
            
        }
        enum Sessions {
            static let navBarStart = "Start   "
            static let navBarPause = "Pause   "
            static let navBarFinish = "Finish"
            
            static let elepsedTime = "Elepsed Time"
            static let remainingTime = "Remaining Time"
            static let completed = "COMPLETED"
            static let remaining = "REMAINING"
            
            static let workoutStats = "Workout stats"
            static let averagePace = "Average pace"
            static let heartRate = "Heart rate"
            static let totalDistance = "Total distance"
            static let totalSteps = "Total steps"
            
            static let stepsCounter = "Steps Counter"
            
            
        }
        enum Overview {
            static var allWorkoutsButton = "all workouts"
        }
        enum Progress {
            static let navBarLeft = "Export"
            static let navBarRight = "Details"
            
            static let dailyPerformance = "Daily perfermance"
            static let last7Days = "Last 7 days"
            static let monthlyPerformance = "Monthly performance"
            static let last10Month = "Last 10 Month"
            
            
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
        enum OverView {
            static let rightArrow = UIImage(named: "right_arrow")
            static let chckmarkDone = UIImage(named: "checkmark_done")
            static let chckmarkNotDone = UIImage(named: "checkmark_not_done")
        }
        enum Session {
            enum Stats {
                static let averagePace = UIImage(named: "stats_averagePace")
                static let heartRate = UIImage(named: "stats_heartRate")
                static let totalDistance = UIImage(named: "stats_totalDistance")
                static let totalSteps = UIImage(named: "stats_totalSteps")
            }
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
