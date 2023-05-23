//
//  WeekView.swift
//  WorkoutApp
//
//  Created by Parshkova Daria on 17.05.2023.
//

import UIKit

final class WeekView : BaseView {
    private var stackView = UIStackView()
    private let calendar = Calendar.current
    
}
extension WeekView {
    override func setupViews() {
        super.setupViews()
        addView(stackView)
    }
    override func constrauinViews() {
        super.constrauinViews()
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor)
          
        ])
        
    }
    override func configureApperance() {
        super.configureApperance()
        stackView.spacing = 7
        stackView.distribution = .fillEqually
        var weekDays = calendar.shortStandaloneWeekdaySymbols
        //для того чтобы воскресенье было в конце , а не в начале недели
        if calendar.firstWeekday == 1 {
            let sun = weekDays.remove(at: 0)
            weekDays.append(sun)
        }
        //список месяцев с первыми тремя буквами
        weekDays.enumerated().forEach { index, name in
            let view = WeekDayView()
            view.configure(with: index, and: name)
            stackView.addArrangedSubview(view)
            
        }
        
        
    }
}
