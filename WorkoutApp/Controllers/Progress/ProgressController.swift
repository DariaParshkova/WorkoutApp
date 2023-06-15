//
//  ProgressController.swift
//  WorkoutApp
//
//  Created by Parshkova Daria on 01.05.2023.
//

import UIKit

class ProgressController: WABaseController {
    private let dailyPerformanceView = DailyPerformanceView(with: R.Strings.Progress.dailyPerformance, buttonTitle: R.Strings.Progress.last7Days)

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

}
extension ProgressController {
    override func setupViews() {
        super.setupViews()
        view.setupView(dailyPerformanceView)
       
    }
    override func constraintViews() {
        super.constraintViews()
        
        NSLayoutConstraint.activate([
        dailyPerformanceView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
        dailyPerformanceView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15),
        dailyPerformanceView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
        dailyPerformanceView.heightAnchor.constraint(equalTo: dailyPerformanceView.widthAnchor, multiplier: 0.68),
        ])
    }
    
    override func configureApperance() {
        super.configureApperance()
        title = R.Strings.NavBar.progress
        navigationController?.tabBarItem.title = R.Strings.TabBar.title(for: .progress)
        
        addNavBarButton(at: .left, with: R.Strings.Progress.navBarLeft)
        addNavBarButton(at: .right, with: R.Strings.Progress.navBarRight)
        
        dailyPerformanceView.configure(with:[
                                    .init(value: "1", heightMultiplayer: 0.1, title: "Mon"),
                                    .init(value: "2", heightMultiplayer: 0.4, title: "Teu"),
                                    .init(value: "3", heightMultiplayer: 0.6, title: "Wen"),
                                    .init(value: "4", heightMultiplayer: 0.8, title: "Thu"),
                                    .init(value: "5", heightMultiplayer: 1, title: "Fri"),
                                    .init(value: "3", heightMultiplayer: 0.6, title: "Sat"),
                                    .init(value: "2", heightMultiplayer: 0.3, title: "Sun"),
                                    
        ])
      
    }
}
