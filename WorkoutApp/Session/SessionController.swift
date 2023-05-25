//
//  SessionController.swift
//  WorkoutApp
//
//  Created by Parshkova Daria on 01.05.2023.
//

import UIKit

class SessionController: BaseController {
    private let timerView : BaseInfoView = {
        let view = BaseInfoView(with: "Test", buttonTitle: "button")
        
        return view
    }()
    
}
    
extension SessionController {
    override func setupViews() {
        super.setupViews()
        view.setupView(timerView)
        NSLayoutConstraint.activate([
            timerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            timerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15),
            timerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            timerView.heightAnchor.constraint(equalToConstant: 300)
            
            
        
        
        ])
    }
    override func constraintViews() {
        super.constraintViews()
    }
    override func configureApperance() {
        super.configureApperance()
        title = R.Strings.NavBar.session
        navigationController?.tabBarItem.title = R.Strings.Sessions.navBarLeft
        
        addNavBarButton(at: .left, with: R.Strings.Sessions.navBarLeft)
        addNavBarButton(at: .right, with: R.Strings.Sessions.navBarRight)
    }
}
    
    
    
    

