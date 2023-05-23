//
//  BaseInfoView.swift
//  WorkoutApp
//
//  Created by Parshkova Daria on 23.05.2023.
//

import UIKit

class BaseInfoView : BaseView {
    private let titleLabel : UILabel = {
        let label = UILabel()
        label.font = R.Fonts.helveticaRegular(with: 13)
        label.textColor = R.Colors.inactive
        return label
    }()
    
    
    private let contentView : UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.backgroundColor = R.Colors.separator.cgColor
        view.layer.borderWidth = 1
        view.layer.cornerRadius = 5
        return view
    }()
    
    init(with title:String? = nil, alidment: NSTextAlignment = .left) {
        titleLabel.text = title?.uppercased()
        titleLabel.textAlignment = alidment
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        super.init(frame: .zero)
    }
    
}
extension BaseInfoView {
    override func setupViews() {
        super.setupViews()
        setupView(titleLabel)
        setupView(contentView)
    }
    override func constraintViews() {
        super.constraintViews()
        let contentTopAnchor : NSLayoutAnchor = titleLabel.text == nil ? topAnchor : titleLabel.bottomAnchor
        let contentTopOffset : CGFloat = titleLabel.text == nil ? 0 : 10
        
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            //растянем тайтл по ширине и прижмем к верхней грани нашего baseinfoview
            titleLabel.topAnchor.constraint(equalTo: topAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            contentView.topAnchor.constraint(equalTo: contentTopAnchor, constant: contentTopOffset),
            contentView.leadingAnchor.constraint(equalTo: leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: bottomAnchor)
        
        ])
    }
    override func configureApperance() {
        super.configureApperance()
        backgroundColor = .clear
    }
  
}
