//
//  NavigationBarController.swift
//  WorkoutApp
//
//  Created by Parshkova Daria on 01.05.2023.
//

import UIKit

final class NavBarController : UINavigationController {
    override func viewDidLoad() {
        super.viewDidLoad()
        configureAppearance()
    }
    private func configureAppearance() {
        view.backgroundColor = .white
        navigationBar.isTranslucent = false
        navigationBar.standardAppearance.titleTextAttributes = [
            .foregroundColor: R.Colors.titleGray,
            .font: R.Fonts.helveticaRegular(with: 17)
        ]
        navigationBar.addBottomBorder(with: R.Colors.separator, height: 1)
    }
    
    
    
    
    
}
