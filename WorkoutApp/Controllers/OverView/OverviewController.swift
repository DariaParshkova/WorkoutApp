//
//  ViewController.swift
//  WorkoutApp
//
//  Created by Parshkova Daria on 28.04.2023.
//

import UIKit

class OverviewController: BaseController {
    private let navBar = OverviewNavBar()

    



}
extension OverviewController {
    override func setupViews() {
        super.setupViews()
        view.addSubview(navBar)
    }
    override func constraintViews() {
        super.constraintViews()
        NSLayoutConstraint.activate([
            navBar.topAnchor.constraint(equalTo: view.topAnchor),
            navBar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            navBar.trailingAnchor.constraint(equalTo: view.trailingAnchor),

          
        ])
        
    }
    override func configureApperance() {
        super.configureApperance()
        navigationController?.navigationBar.isHidden = true
        
        navBar.translatesAutoresizingMaskIntoConstraints = false
       
        
        
    }
}
