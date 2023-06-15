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
class WABaseController : UIViewController {
    override func viewDidLoad() {
        setupViews()
        constraintViews()
        configureApperance()
    }
    @objc func navBarLeftButtonHandler() {
        print("Navbar left button")
    }
    @objc func navBarRightButtonHandler() {
        print("navbar right button")
    }
    
    
    
}
@objc extension WABaseController {
    func setupViews () {}
    func constraintViews() {}
    func configureApperance() {
        view.backgroundColor =  R.Colors.background
    }
    
}
extension WABaseController {
    func addNavBarButton(at position: NavBarPosition, with title:String) {
        let button = UIButton(type: .system)
        button.setTitle(title, for: .normal)
        button.setTitleColor(R.Colors.active, for: .normal)
        button.setTitleColor(R.Colors.inactive, for: .disabled)
        button.titleLabel?.font = R.Fonts.helveticaRegular(with: 17)
        switch position {
        case .left:
            button.addTarget(self, action: #selector(navBarLeftButtonHandler), for: .touchUpInside)
            navigationItem.leftBarButtonItem = UIBarButtonItem(customView: button)
        case .right:
            button.addTarget(self, action: #selector(navBarRightButtonHandler), for: .touchUpInside)
            navigationItem.rightBarButtonItem = UIBarButtonItem(customView: button)
        }
    }
    func setTitleForNavBarButton(_ title:String, at position: NavBarPosition) {
        switch position {
        case .left:
            (navigationItem.leftBarButtonItem?.customView as? UIButton)?.setTitle(title, for: .normal)
        case .right:
            (navigationItem.rightBarButtonItem?.customView as? UIButton)?.setTitle(title, for: .normal)
        }

    }
}
