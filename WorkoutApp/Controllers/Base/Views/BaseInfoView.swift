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
    private let button : UIButton = {
        let button = UIButton()
        button.backgroundColor = .red
        return button
    }()
    
    private let contentView : UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.backgroundColor = R.Colors.separator.cgColor
        view.layer.borderWidth = 1
        view.layer.cornerRadius = 5
        return view
    }()
    
    init(with title:String? = nil, buttonTitle: String? = nil) {
        titleLabel.text = title?.uppercased()
        titleLabel.textAlignment = buttonTitle == nil ? .center : .left
        button.isHidden = buttonTitle == nil ? true : false
        button.setTitle(buttonTitle, for: .normal)
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        super.init(frame: .zero)
    }
    //устнавливаем таргет для кнопки
    func addButtonTarget(target:Any?, action: Selector) {
        button.addTarget(action, action:action , for: .touchUpInside)
    }
    
}
extension BaseInfoView {
    override func setupViews() {
        super.setupViews()
        setupView(titleLabel)
        setupView(contentView)
        setupView(button)
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
            
            button.trailingAnchor.constraint(equalTo: trailingAnchor),
            button.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor),
            button.widthAnchor.constraint(equalToConstant: 130),
            button.heightAnchor.constraint(equalToConstant: 30),
            
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
