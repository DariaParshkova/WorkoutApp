//
//  SessionController.swift
//  WorkoutApp
//
//  Created by Parshkova Daria on 01.05.2023.
//

import UIKit

class SessionController: BaseController {

    override func viewDidLoad() {
        super.viewDidLoad()

        title = R.Strings.NavBar.session
        navigationController?.tabBarItem.title = R.Strings.Sessions.navBarLeft
        
        addNavBarButton(at: .left, with: R.Strings.Sessions.navBarLeft)
        addNavBarButton(at: .right, with: R.Strings.Sessions.navBarRight)
    }
    
    override func navBarLeftButtonHandler() {
        print("Session navbar button left button tapped")
    }

}
