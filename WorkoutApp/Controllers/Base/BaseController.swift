//
//  BaseController.swift
//  WorkoutApp
//
//  Created by Parshkova Daria on 01.05.2023.
//

import UIKit

enum NavBarPosition {
    case left
    case right
}
class BaseController : UIViewController {
    override func viewDidLoad() {
        configure()
    }
    @objc func navBarLeftButtonHandler() {
        print("Navbar left button")
    }
    @objc func navBarRightButtonHandler() {
        print("navbar right button")
    }
    
    
    
}
@objc extension BaseController {
    func addViews () {}
    func layoutViews() {}
    func configure() {
        view.backgroundColor =  Resources.Colors.background
    }
    
}
extension BaseController {
    func addNavBarButton(at position: NavBarPosition, with title:String) {
        let button = UIButton(type: .system)
        button.setTitle(title, for: .normal)
        button.setTitleColor(Resources.Colors.active, for: .normal)
        button.setTitleColor(Resources.Colors.inactive, for: .disabled)
        button.titleLabel?.font = Resources.Fonts.helveticaRegular(with: 17)
        switch position {
        case .left:
            button.addTarget(self, action: #selector(navBarLeftButtonHandler), for: .touchUpInside)
            navigationItem.leftBarButtonItem = UIBarButtonItem(customView: button)
        case .right:
            button.addTarget(self, action: #selector(navBarRightButtonHandler), for: .touchUpInside)
            navigationItem.rightBarButtonItem = UIBarButtonItem(customView: button)
        }
    }
}
