//
//  ProgressView.swift
//  WorkoutApp
//
//  Created by Parshkova Daria on 27.05.2023.
//

import UIKit
extension TimerView {
    final class ProgressView : UIView {
        func drawProgress(with percent: CGFloat) {
            let circleFrame = UIScreen.main.bounds.width - (15 + 40) * 2 //15 отступ до contentView и 40 До центра линии прогресса и умножаем на 2 так как это отступы  с двух сторон
            let radius = circleFrame / 2 //есть некоторый frame, где радиус это его половина
            let center = CGPoint(x: radius, y: radius)
            let startAngle = -CGFloat.pi * 7 / 6
            let endAngle = CGFloat.pi * 1 / 6
            
            
            let circlePath = UIBezierPath(arcCenter: center,
                                          radius: radius,
                                          startAngle: startAngle,
                                          endAngle: endAngle,
                                          clockwise: true)
            
            let circleLayer = CAShapeLayer()
            circleLayer.path = circlePath.cgPath
            circleLayer.strokeColor = R.Colors.active.cgColor
            circleLayer.lineWidth = 20
            circleLayer.strokeEnd = percent
            circleLayer.fillColor = UIColor.clear.cgColor
            circleLayer.lineCap = .round
            
            layer.addSublayer(circleLayer)
        }
    }
}
