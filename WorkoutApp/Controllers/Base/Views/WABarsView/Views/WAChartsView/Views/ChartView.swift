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

    
    func configure(with data: [WAChartsView.Data], topChartOffset: Int ) {
        layoutIfNeeded() //принудительно определяем его размеры чтобы он отрисовался
        drawDashLines()
        drawChart(with: data, topChartOffset: topChartOffset)
            
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
    func drawDashLines(with counts: Int = 9) {
        (0..<counts).map {CGFloat($0) }.forEach {
            drawDashLine(at: bounds.height / CGFloat(counts) * $0)
        }
    }
    
    
    
    
    func drawDashLine(at yPosition:CGFloat) {
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
        dashLayer.lineDashPattern = [6, 3] //длина линии и отступ между линиями
        layer.addSublayer(dashLayer)
    }
    
    func drawChart(with data: [WAChartsView.Data], topChartOffset: Int) {
        guard let maxValue = data.sorted(by: { $0.value > $1.value}).first?.value else { return }
        let valuePoints = data.enumerated().map { CGPoint(x: CGFloat($0), y: CGFloat($1.value)) } //массив абстракатных точек с 0 по 9 значение
        let chartHeight = bounds.height / CGFloat(maxValue + topChartOffset) //максимальный размер графиа находится не в верхней точке height, а на 10 поинтов ниже
        
        let points = valuePoints.map { point -> CGPoint in
           let x = bounds.width / CGFloat(valuePoints.count - 1) * point.x //берем ширину экрана и делим на количество точке
           let y = bounds.height - point.y * chartHeight
           return CGPoint(x: x, y: y)
        }
        
        let chartPath = UIBezierPath()
        chartPath.move(to: points[0])
        
        points.forEach {
            chartPath.addLine(to: $0)
            drawChartDot(at: $0)
        }
        let chartLayer = CAShapeLayer()
        chartLayer.path = chartPath.cgPath
        chartLayer.fillColor = UIColor.clear.cgColor //чтобы не внутренее пространство графика не заполнялось черным
        chartLayer.strokeColor = R.Colors.active.cgColor
        chartLayer.lineWidth = 3
        chartLayer.strokeEnd = 1
        chartLayer.lineJoin = .round //нужно для того чтобы линия присоединения графика не имела острого края
        layer.addSublayer(chartLayer)
    }
    func drawChartDot(at point: CGPoint) {
        let dotPath = UIBezierPath()
        dotPath.move(to: point)
        dotPath.addLine(to: point)
        
        let dotLayer = CAShapeLayer()
        dotLayer.path = dotPath.cgPath
        dotLayer.strokeColor = R.Colors.active.cgColor
        dotLayer.lineCap = .round
        dotLayer.lineWidth = 10
        layer.addSublayer(dotLayer)
    }
    
    
}
