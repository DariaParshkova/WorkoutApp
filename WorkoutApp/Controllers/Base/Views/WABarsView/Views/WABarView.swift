//
//  WABarView.swift
//  WorkoutApp
//
//  Created by Parshkova Daria on 14.06.2023.
//

import UIKit
extension WABarView {
    
    struct Data {
        let value: String
        let heightMultiplayer : Double
        let title: String
    }
}


final class WABarView : WABaseView {
    private let heightMultiplayer: Double
    
    private let valueLabel : UILabel = {
        let label = UILabel()
        label.font = R.Fonts.helveticaRegular(with: 13)
        label.textColor = R.Colors.active
        return label
        
    }()
    private let barView : UIView = {
        let view = UIView()
        view.backgroundColor = R.Colors.active
        view.layer.cornerRadius = 2.5
        return view
    }()
    
    
    
    private let titleLabel : UILabel = {
        let label = UILabel()
        label.font = R.Fonts.helveticaRegular(with: 9)
        label.textColor = R.Colors.inactive
        return label
    }()
    private let stackView : UIStackView = {
        let view = UIStackView()
        view.distribution = .equalSpacing
        return view
    }()
    //при инициализации будут вырисовываться данные, не использую конфигуратор
    init(data: Data) {
        self.heightMultiplayer = data.heightMultiplayer
        super.init(frame: .zero)
        valueLabel.text = data.value
        titleLabel.text = data.title

    }
    
    required init?(coder: NSCoder) {
        self.heightMultiplayer = 0
        super.init(frame: .zero)
    }
    
    
}

extension WABarView {
    override func setupViews() {
        super.setupViews()
        
        setupView(valueLabel)
        setupView(barView)
        setupView(titleLabel)
    }
    override func constraintViews() {
        super.constraintViews()
        
        NSLayoutConstraint.activate([
            valueLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            barView.topAnchor.constraint(equalTo: valueLabel.bottomAnchor, constant: 5),
            barView.centerXAnchor.constraint(equalTo: centerXAnchor),
            barView.widthAnchor.constraint(equalToConstant: 17),
            barView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: heightMultiplayer, constant: -40),
            
            titleLabel.topAnchor.constraint(equalTo: barView.bottomAnchor, constant: 10),
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor)

        ])
    }
    override func configureApperance() {
        super.configureApperance()
        backgroundColor = .clear
    }
}
