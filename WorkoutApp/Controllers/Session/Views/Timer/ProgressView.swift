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
            layer.sublayers?.removeAll() //для того чтобы слои не рисовались поверх дефолтных слоев и не скоадывались в одну огромную стопку слоев, при анимации это давало небольшой эффект залипания. Каждый раз когда дергается drawProgress удаляеится предыдущий слой и рисуется новый! 
            
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
            let defaultCircleLayer = CAShapeLayer()
            defaultCircleLayer.path = circlePath.cgPath
            defaultCircleLayer.strokeColor = R.Colors.separator.cgColor
            defaultCircleLayer.lineWidth = 20
            defaultCircleLayer.strokeEnd = 1
            defaultCircleLayer.fillColor = UIColor.clear.cgColor
            defaultCircleLayer.lineCap = .round
            
            let circleLayer = CAShapeLayer()
            circleLayer.path = circlePath.cgPath
            circleLayer.strokeColor = R.Colors.active.cgColor
            circleLayer.lineWidth = 20
            circleLayer.strokeEnd = percent
            circleLayer.fillColor = UIColor.clear.cgColor
            circleLayer.lineCap = .round
            
            let dotAngle = CGFloat.pi * (7 / 6 - (8 / 6 * percent)) //положение для корректной отрисовки точки
            let dotPoint = CGPoint(x: cos(-dotAngle) * radius + center.x ,
                                        y: sin(-dotAngle) * radius + center.y)
            // путь по которому рисуется линия
            let dotPath = UIBezierPath()
            dotPath.move(to: dotPoint) //дефолтная точка
            dotPath.addLine(to: dotPoint) //двигаемся прямой линией до dotPoint
            //для точки при нулевом прогрессе 
            let bigDotLayer = CAShapeLayer()
            bigDotLayer.path = dotPath.cgPath //!!!какой путь заполнит слой cgPath так как это Core Graphic!!!
            bigDotLayer.fillColor = UIColor.clear.cgColor
            bigDotLayer.strokeColor = R.Colors.active.cgColor //цвет линии
            bigDotLayer.lineCap = .round //закругленные края
            bigDotLayer.lineWidth = 20
            
            //слой рисующий эту линию
            let dotLayer = CAShapeLayer()
            dotLayer.path = dotPath.cgPath //!!!какой путь заполнит слой cgPath так как это Core Graphic!!!
            dotLayer.fillColor = UIColor.clear.cgColor 
            dotLayer.strokeColor = UIColor.white.cgColor //цвет линии
            dotLayer.lineCap = .round //закругленные края
            dotLayer.lineWidth = 8
            
            //MARK: - Bars
            //для черточек
            let barsFrame = UIScreen.main.bounds.width - (15 + 40 + 25) * 2
            let barsRadius = barsFrame / 2
            //рисуем путь окружности
            let barsPath = UIBezierPath(arcCenter: center,
                                        radius: barsRadius,
                                        startAngle: startAngle,
                                        endAngle: endAngle,
                                        clockwise: true)
            //создаем слой который будет рисоваться сами черточки, пустой прозрачный родительский layer
            let barsLayer = CAShapeLayer()
            barsLayer.path = barsPath.cgPath //пусть по которому они будут рисоваться
            barsLayer.fillColor = UIColor.clear.cgColor // прозрачный цвет наполнения
            barsLayer.strokeColor = UIColor.clear.cgColor //цвет линии
            barsLayer.lineWidth = 6 //ширина линии
            
            //Точки начала и конца каждой черточки
            let startBarRadius = barsRadius - barsLayer.lineWidth * 0.5 //от большого радиуса до центра
            let endBarRadius = startBarRadius + 6 //маленький радиус до центра
            
            var angle : CGFloat = 7 / 6     //первый угол где должна находиться черточка и потом рисуем следующ по этому углу
            (1...9).forEach { _ in
                let barAngle = CGFloat.pi * angle
                //вычисляем начало точки
                let startBarPoint = CGPoint(
                    x: cos(-barAngle) * startBarRadius + center.x,
                    y: sin(-barAngle) * startBarRadius + center.y
                )
                //конец точки
                let endBarPoint = CGPoint(
                    x: cos(-barAngle) * endBarRadius + center.x,
                    y: sin(-barAngle) * endBarRadius + center.y
                )
                //путь от начала до конца точки, который мы наполним визуалом
                let barPath = UIBezierPath()
                barPath.move(to: startBarPoint)
                barPath.addLine(to: endBarPoint)
                //создаем слой который рисует точку-визуал
                let barLayer = CAShapeLayer()
                barLayer.path = barPath.cgPath
                barLayer.fillColor = UIColor.clear.cgColor
                barLayer.strokeColor = angle >= (7 / 6 - (8 / 6 * percent)) ? R.Colors.active.cgColor : R.Colors.separator.cgColor //цвет в зависимости от процента текущего угла
                barLayer.lineCap = .round //закругление края
                barLayer.lineWidth = 4 //ширина линии черточки
    
                barsLayer.addSublayer(barLayer) //добавляем на глобальный layer
                
                angle -= 1 / 6 //увеличиваем угол на 1/6 делаем движение вверх и рисуем след черточку в итерации
                
            }
        
            layer.addSublayer(defaultCircleLayer)
            layer.addSublayer(circleLayer)
            layer.addSublayer(bigDotLayer)
            layer.addSublayer(dotLayer)
            layer.addSublayer(barsLayer)
        }
    }
}
