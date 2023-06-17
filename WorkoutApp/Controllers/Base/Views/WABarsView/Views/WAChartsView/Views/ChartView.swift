//
//  ChartView.swift
//  WorkoutApp
//
//  Created by Parshkova Daria on 17.06.2023.
//
//линии
import UIKit
final class ChartView : WABaseView {
    
    private let yAxisSeparator : UIView = {
        let view = UIView()
        view.backgroundColor = R.Colors.separator
        return view
    }()
    
    private let xAxisSeparator : UIView = {
        let view = UIView()
        view.backgroundColor = R.Colors.separator
        return view
    }()

    
    func configure(with data: [WAChartsView.Data]) {
        layoutIfNeeded() //принудительно определяем его размеры чтобы он отрисовался
        addDashLine()
            
    }
}

extension ChartView {
    override func setupViews() {
        super.setupViews()
        setupView(yAxisSeparator)
        setupView(xAxisSeparator)
        
    }
    override func constraintViews() {
        super.constraintViews()
        
        NSLayoutConstraint.activate([
            yAxisSeparator.leadingAnchor.constraint(equalTo: leadingAnchor),
            yAxisSeparator.topAnchor.constraint(equalTo: topAnchor),
            yAxisSeparator.bottomAnchor.constraint(equalTo: bottomAnchor),
            yAxisSeparator.widthAnchor.constraint(equalToConstant: 1),
            
            xAxisSeparator.leadingAnchor.constraint(equalTo: leadingAnchor),
            xAxisSeparator.trailingAnchor.constraint(equalTo: trailingAnchor),
            xAxisSeparator.bottomAnchor.constraint(equalTo: bottomAnchor),
            xAxisSeparator.heightAnchor.constraint(equalToConstant: 1)
            
            
            

        ])
    }
    override func configureApperance() {
        super.configureApperance()
        backgroundColor = .clear
    }
}

private extension ChartView {
    func addDashLine(with count: Int? = nil) {
        (0..<9).map {CGFloat($0) }.forEach {
            addDashLine(at: bounds.height / 9 * $0)
        }
    }
    
    
    
    
    func addDashLine(at yPosition:CGFloat) {
        let startPoint = CGPoint(x:0 , y: yPosition )
        let endPoint = CGPoint(x: bounds.width, y: yPosition)
        //путь по которому будет рисоваться линия
        let dashPath = CGMutablePath()
        dashPath.addLines(between: [startPoint, endPoint])
        //слой
        let dashLayer = CAShapeLayer()
        dashLayer.path = dashPath
        dashLayer.strokeColor = R.Colors.separator.cgColor
        dashLayer.lineWidth = 1
        dashLayer.lineDashPattern = [6 , 3] //длина линии и отступ между линиями
        layer.addSublayer(dashLayer)
    }
}
