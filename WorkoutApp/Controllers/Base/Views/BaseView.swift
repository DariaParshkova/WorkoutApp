//
//  BaseView.swift
//  WorkoutApp
//
//  Created by Parshkova Daria on 15.05.2023.
//

import UIKit
 

class BaseView : UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        constraintViews()
        configureApperance()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

@objc extension BaseView {
    func setupViews() {}
    func constraintViews() {}
    func configureApperance() {}
    
}
