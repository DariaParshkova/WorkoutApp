//
//  WAChartsView.swift
//  WorkoutApp
//
//  Created by Parshkova Daria on 16.06.2023.
//
import UIKit

final class WAChartsView : WABaseView {
    private let yAxisView = YAxisView()
    private let xAxisView = XAxisView()
    private let chartView = UIView()

    func configure(with data:[WAChartsView.Data]) {
        yAxisView.configure(with: data)
        xAxisView.configure(with: data)
        
    }
    
    
}

extension WAChartsView {
    override func setupViews() {
        super.setupViews()
        setupView(xAxisView)
        setupView(yAxisView)
        setupView(chartView)
    }
    override func constraintViews() {
        super.constraintViews()
        NSLayoutConstraint.activate([
            yAxisView.leadingAnchor.constraint(equalTo: leadingAnchor),
            yAxisView.topAnchor.constraint(equalTo: topAnchor),
            yAxisView.bottomAnchor.constraint(equalTo: xAxisView.topAnchor, constant: -12),
            
            xAxisView.leadingAnchor.constraint(equalTo: yAxisView.trailingAnchor, constant: 12),
            xAxisView.bottomAnchor.constraint(equalTo: bottomAnchor),
            xAxisView.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            chartView.leadingAnchor.constraint(equalTo: yAxisView.trailingAnchor, constant: 12),
            chartView.topAnchor.constraint(equalTo: topAnchor),
            chartView.trailingAnchor.constraint(equalTo: trailingAnchor),
            chartView.bottomAnchor.constraint(equalTo: yAxisView.topAnchor, constant: -12),
        ])
        
    }
    override func configureApperance() {
        super.configureApperance()
        chartView.backgroundColor = .cyan
        backgroundColor = .clear
    }
}
extension WAChartsView {
    struct Data {
        let value : Int
        let title : String
    }
    
    
}
