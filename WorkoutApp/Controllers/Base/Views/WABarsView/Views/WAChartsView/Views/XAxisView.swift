//
//  XAxisView.swift
//  WorkoutApp
//
//  Created by Parshkova Daria on 16.06.2023.
//
import UIKit
final class XAxisView : WABaseView {
    private let stackView: UIStackView = {
        let view = UIStackView()
        view.distribution = .equalSpacing
        return view
    }()
    
    func configure(with data: [WAChartsView.Data]) {
        stackView.arrangedSubviews.forEach {
            $0.removeFromSuperview() //удаляем все данные и наполянем новыми
        }
        //конфигурация для наших 10 значений
        data.forEach { //reversed знчения должны идти по убыванию в вертикальном стеке
            let label = UILabel()
            label.font = R.Fonts.helveticaRegular(with: 9)
            label.textColor = R.Colors.inactive
            label.text = $0.title.uppercased()
            label.textAlignment = .center
            stackView.addArrangedSubview(label)
            
            
       }
    }
    
    
}

extension XAxisView {
    override func setupViews() {
        super.setupViews()
        
        setupView(stackView)
        
    }
    override func constraintViews() {
        super.constraintViews()
        
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor)

        ])
    }
    override func configureApperance() {
        super.configureApperance()
        backgroundColor = .clear
    }
}

