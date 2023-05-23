//
//  WeekDayView.swift
//  WorkoutApp
//
//  Created by Parshkova Daria on 17.05.2023.
//

import UIKit
extension WeekView {
    final class WeekDayView : BaseView {
        private let nameLabel = UILabel()
        private let dateLabel = UILabel()
        private let stackView = UIStackView()
        
        func configure(with index : Int, and name: String) {
            
            let startOfWeek = Date().startOfWeek
            let currentDay = startOfWeek.goForward(to: index)
            let day = Calendar.current.component(.day, from: currentDay)
            let isToday = currentDay.stripTime() == Date().stripTime()
            backgroundColor = isToday ? R.Colors.active : R.Colors.background
            
            
            nameLabel.text = name.uppercased() //uppercased - все будет большими буквами
            nameLabel.textColor = isToday ? .white : R.Colors.inactive
            dateLabel.text = "\(day)"
            dateLabel.textColor = isToday ? .white : R.Colors.inactive
        }
    
    }
}
extension WeekView.WeekDayView {
    override func setupViews() {
        super.setupViews()
        setupView(stackView)
        //addArrangedSubview - добавляет вид в конец упорядоченных подвидов
        stackView.addArrangedSubview(nameLabel)
        stackView.addArrangedSubview(dateLabel)
    }
    override func constraintViews() {
        super.constraintViews()
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: centerYAnchor)
          
        ])
        
    }
    override func configureApperance() {
        super.configureApperance()
        
        layer.cornerRadius = 5
        layer.masksToBounds = true
        nameLabel.font = R.Fonts.helveticaRegular(with: 9)
        nameLabel.textAlignment = .center
        dateLabel.font = R.Fonts.helveticaRegular(with: 15)
        dateLabel.textAlignment = .center
        stackView.spacing = 3
        stackView.axis = .vertical //направление стекВью вертикальное 
        
        
    }
}
