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

        title = Resources.Strings.NavBar.session
        navigationController?.tabBarItem.title = Resources.Strings.TabBar.session
        
        addNavBarButton(at: .left, with: Resources.Strings.Sessions.navBarLeft)
        addNavBarButton(at: .right, with: Resources.Strings.Sessions.navBarRight)
    }
    
    override func navBarLeftButtonHandler() {
        print("Session navbar button left button tapped")
    }

}
