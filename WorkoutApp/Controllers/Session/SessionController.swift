//
//  SessionController.swift
//  WorkoutApp
//
//  Created by Parshkova Daria on 01.05.2023.
//

import UIKit

class SessionController: BaseController {
    private let timerView = TimerView()
    private let timerDuration = 5.0 //продолжительность таймера !!!УБЕРИ ПОТОМ!!!!!
    private let statsView = StatsView(with: R.Strings.Sessions.workoutStats)
    private let stepsView = WABaseInfoView(with: R.Strings.Sessions.stepsCounter)
    
    override func navBarLeftButtonHandler() {
        if timerView.state == .isStopped {
            timerView.startTimer ()
        } else {
            timerView.pauseTimer()
        }
        timerView.state = timerView.state == .isRunning ? .isStopped : .isRunning
        setTitleForNavBarButton(timerView.state == .isRunning ? R.Strings.Sessions.navBarPause : R.Strings.Sessions.navBarStart,
                                at: .left
        )
    }
    override func navBarRightButtonHandler() {
        timerView.stopTimer()
        timerView.state = .isStopped
        setTitleForNavBarButton(R.Strings.Sessions.navBarStart, at: .left)
    }
    
}
    
extension SessionController {
    override func setupViews() {
        super.setupViews()
        view.setupView(statsView)
        view.setupView(timerView)
        view.setupView(stepsView)
    }
    override func constraintViews() {
        super.constraintViews()
        NSLayoutConstraint.activate([
            timerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            timerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15),
            timerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            
            statsView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            statsView.topAnchor.constraint(equalTo: timerView.bottomAnchor, constant: 10),
            statsView.trailingAnchor.constraint(equalTo: view.centerXAnchor, constant: -7.5),
            
            stepsView.leadingAnchor.constraint(equalTo: view.centerXAnchor, constant: 7.5),
            stepsView.topAnchor.constraint(equalTo: statsView.topAnchor),
            stepsView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            stepsView.heightAnchor.constraint(equalTo: statsView.heightAnchor)
            
        
        ])
    }
    override func configureApperance() {
        super.configureApperance()
        title = R.Strings.NavBar.session
        navigationController?.tabBarItem.title = R.Strings.TabBar.title(for: .session)
        
        addNavBarButton(at: .left, with: R.Strings.Sessions.navBarStart)
        addNavBarButton(at: .right, with: R.Strings.Sessions.navBarFinish)
        
        timerView.configure(with: timerDuration, progress: 0)
        
        timerView.callBack = { [weak self] in
                self?.navBarRightButtonHandler()
        }

        
        statsView.configure(with: [.heartRate(value:"155"),
                                   .averagePace(value: "8'20''"),
                                   .totalSteps(value: "7.682"),
                                   .totalDistance(value: "8.25")
                                  ])
    }
}
    
    
    
    

