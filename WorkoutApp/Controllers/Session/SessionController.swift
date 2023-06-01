//
//  SessionController.swift
//  WorkoutApp
//
//  Created by Parshkova Daria on 01.05.2023.
//

import UIKit

class SessionController: BaseController {
    private let timerView = TimerView()
    private let timerDuration = 3.0
    override func navBarLeftButtonHandler() {
        if timerView.state == .isStopped {
            timerView.startTimer()
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
        view.setupView(timerView)
        NSLayoutConstraint.activate([
            timerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            timerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15),
            timerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            timerView.heightAnchor.constraint(equalToConstant: 500)
            
            
        
        
        ])
    }
    override func constraintViews() {
        super.constraintViews()
    }
    override func configureApperance() {
        super.configureApperance()
        title = R.Strings.NavBar.session
        navigationController?.tabBarItem.title = R.Strings.TabBar.title(for: .session)
        
        addNavBarButton(at: .left, with: R.Strings.Sessions.navBarStart)
        addNavBarButton(at: .right, with: R.Strings.Sessions.navBarFinish)
        
        timerView.configure(with: timerDuration, progress: 0.5)
    }
}
    
    
    
    

