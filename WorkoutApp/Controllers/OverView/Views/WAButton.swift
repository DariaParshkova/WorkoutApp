//
//  SecondaryButton.swift
//  WorkoutApp
//
//  Created by Parshkova Daria on 08.05.2023.
//

import UIKit

public enum WAButtonType {
    case primary
    case secondary
}



final class WAButton : UIButton {
    private var type : WAButtonType = .primary
    
    private let lable : UILabel = {
        let lable = UILabel()
        lable.textAlignment = .center
        return lable
    }()

    
    private let iconView : UIImageView = {
        let view = UIImageView()
        view.image = R.Images.Common.downArrow?.withRenderingMode(.alwaysTemplate)
        return view
    }()
    //кастомный инит
    init(with type: WAButtonType) {
        super.init(frame: .zero)
        self.type = type
        
        setupViews()
        constraintViews()
        configureApeearance()
        
    }
    
    required init?(coder: NSCoder) {
        super.init(frame: .zero)
        setupViews()
        constraintViews()
        configureApeearance()
    }
    func setTitle(_ title: String?) {
        lable.text = title
    }
    
}
private extension WAButton {
    func setupViews () {
        setupView(lable)
        setupView(iconView)
    }
    func constraintViews() {
        var horizontalOffset : CGFloat {
            switch type {
            case .primary : return 0
            case .secondary : return 10
            }
        }
        NSLayoutConstraint.activate([
            iconView.centerYAnchor.constraint(equalTo: centerYAnchor), //выравнив стрелки по высоте вью кнопки
            iconView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -horizontalOffset), //отступ справа но влево отриц направление
            iconView.heightAnchor.constraint(equalToConstant: 5),
            iconView.widthAnchor.constraint(equalToConstant: 10),
            
            lable.centerYAnchor.constraint(equalTo: centerYAnchor),
            lable.trailingAnchor.constraint(equalTo: iconView.leadingAnchor, constant: -10),
            lable.leadingAnchor.constraint(equalTo: leadingAnchor, constant: horizontalOffset*2) //двойной отступ для надписи на кнопке AllWorkout
            
        
        
        ])
    }
    func configureApeearance() {
        switch type {
        case .primary :
            
            lable.textColor = R.Colors.inactive
            lable.font = R.Fonts.helveticaRegular(with: 13)
            iconView.tintColor = R.Colors.inactive
        case .secondary :
            backgroundColor = R.Colors.secondary
            layer.cornerRadius = 14
            lable.textColor = R.Colors.active
            lable.font = R.Fonts.helveticaRegular(with: 15)
            iconView.tintColor = R.Colors.active
        }
        //функция которая делает кнопку прозрачной
        makeSystem(self)
      
    }
}
