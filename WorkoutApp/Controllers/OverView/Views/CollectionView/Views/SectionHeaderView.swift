//
//  SectionHeaderView.swift
//  WorkoutApp
//
//  Created by Parshkova Daria on 21.06.2023.
//

import UIKit

final class SectionHeaderView : UICollectionReusableView {
    static let id = "SectionHeaderView"
    private let title : UILabel = {
        let label = UILabel()
        label.font = R.Fonts.helveticaRegular(with: 13)
        label.textColor = R.Colors.inactive
        label.textAlignment = .center
        return label
    }()
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
    func configure(with title: String ) {
        self.title.text = title.uppercased()
    }
}

private extension SectionHeaderView {
    
    func setupViews () {
        setupView(title)
    }
    func constraintViews() {
        NSLayoutConstraint.activate([
            title.centerXAnchor.constraint(equalTo: centerXAnchor),
            title.centerYAnchor.constraint(equalTo: centerYAnchor),
        ])
    }
    func configureApperance() {}
}

