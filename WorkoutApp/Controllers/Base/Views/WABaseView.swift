//
//  BaseView.swift
//  WorkoutApp
//
//  Created by Parshkova Daria on 15.05.2023.
//

import UIKit
 

class WABaseView : UIView {
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

@objc extension WABaseView {
    func setupViews() {}
    func constraintViews() {}
    func configureApperance() {
        backgroundColor = .white
    }
    
}
