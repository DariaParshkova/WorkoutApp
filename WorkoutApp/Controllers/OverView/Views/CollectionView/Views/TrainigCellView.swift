//
//  TrainingCellView.swift
//  WorkoutApp
//
//  Created by Parshkova Daria on 21.06.2023.
//

import UIKit

final class TrainingCellView : UICollectionViewCell {
    static let id = "TrainingCellView"
    private let stackView : UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.spacing = 3 //расстояние между тайтлом и сабтайтлом
        return view
    }()
    
    private let  checkmarkView = UIImageView(image: R.Images.OverView.chckmarkNotDone)
 
    private let title : UILabel = {
        let label = UILabel()
        label.font = R.Fonts.helveticaRegular(with: 17)
        label.textColor = R.Colors.titleGray
        return label
    }()
    private let subtitle : UILabel = {
        let label = UILabel()
        label.font = R.Fonts.helveticaRegular(with: 13)
        label.textColor = R.Colors.inactive
        return label
    }()
    private let rightArrowView = UIImageView(image: R.Images.OverView.rightArrow)
    
    //переопределяю инит так как уже не наследуюсь от WABaseView
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        constraintViews()
        configureApperance()
    }
    
    required init?(coder: NSCoder) {
        super.init(frame: .zero)
        setupViews()
        constraintViews()
        configureApperance()
    }
    func configure(with title: String, subtitle: String, isDone: Bool ) {
        self.title.text = title.uppercased()
        self.subtitle.text = subtitle
        checkmarkView.image = isDone ? R.Images.OverView.chckmarkDone : R.Images.OverView.chckmarkNotDone
    }
}

private extension TrainingCellView {
    
    func setupViews () {
        setupView(checkmarkView)
        setupView(stackView)
        stackView.addArrangedSubview(title)
        stackView.addArrangedSubview(subtitle)
        setupView(rightArrowView)
        
    }
    func constraintViews() {
        NSLayoutConstraint.activate([
            checkmarkView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            checkmarkView.centerYAnchor.constraint(equalTo: centerYAnchor),
            checkmarkView.heightAnchor.constraint(equalToConstant: 28),
            checkmarkView.widthAnchor.constraint(equalTo: checkmarkView.heightAnchor),
            
            //растягиваем стек между нашими двумя элементами, которые имеют четки размеры
            stackView.leadingAnchor.constraint(equalTo: checkmarkView.trailingAnchor, constant: 15),
            stackView.centerYAnchor.constraint(equalTo: centerYAnchor),
            stackView.trailingAnchor.constraint(equalTo: rightArrowView.leadingAnchor, constant: -15),
            
            rightArrowView.centerYAnchor.constraint(equalTo: centerYAnchor),
            rightArrowView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            rightArrowView.heightAnchor.constraint(equalToConstant: 12),
            rightArrowView.widthAnchor.constraint(equalToConstant: 7)
            
        ])
    }
    func configureApperance() {
        backgroundColor = .white
        layer.borderWidth = 1
        layer.borderColor = R.Colors.separator.cgColor
    }
}

