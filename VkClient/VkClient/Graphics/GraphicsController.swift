//
//  GraphicsController.swift
//  VkClient
//
//  Created by Yuriy Fedorov on 17.12.2020.
//

import UIKit

class GraphicsController: UIViewController {
    @IBInspectable var borderWidth: CGFloat = 4.0
    let myNewView = NewView(frame: CGRect(x: 50.0, y: 50.0, width: 100.0, height: 100.0))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(myNewView)
        myNewView.backgroundColor = .white
//        myNewView.layer.borderWidth = 4.0
//        myNewView.layer.borderColor = UIColor.black.cgColor
//        myNewView.layer.maskedCorners = CACornerMask(rawValue: 10)
//        myNewView.layer.cornerRadius = 10.0
//        myNewView.layer.masksToBounds = true
        addShadow()
        addGradient()
    }
    
    private func addShadow() {
        myNewView.layer.shadowColor = UIColor.black.cgColor
        myNewView.layer.shadowOpacity = 0.5
        myNewView.layer.shadowRadius = 8
        myNewView.layer.shadowOffset = CGSize.zero
    }
    
    private func addMask() {
        let mask = CAShapeLayer()
        let star = MyBezie.star
        star.stroke()
        mask.path = star.cgPath
        myNewView.layer.mask = mask
    }
    
    private func addGradient() {
        let gradient = CAGradientLayer()
        gradient.colors = [
            UIColor.black.cgColor,
            UIColor.init(red: 77.0/255, green: 0.0/255, blue: 130.0/255, alpha: 0.8).cgColor,
            UIColor.white.cgColor
            ]
        gradient.locations = [0.0, 0.5, 1]
        gradient.startPoint = CGPoint.zero
        gradient.endPoint = CGPoint(x: 1.0, y: 1.0)
        myNewView.layer.addSublayer(gradient)
        gradient.frame = myNewView.bounds
    }
}

class NewView: UIView {
    
//    override class var layerClass: AnyClass {
//        CAGradientLayer.self
//    }
    
    @IBInspectable var somePoint: CGPoint = CGPoint(x: 0.0, y: 0.0)
    @IBInspectable var radius: CGFloat = 10 {
        didSet {
            setNeedsDisplay()
        }
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        guard let context = UIGraphicsGetCurrentContext() else { return }
        context.setFillColor(UIColor.red.cgColor)
        context.fillEllipse(in: CGRect(x: rect.midX - radius,
                                       y: rect.midY - radius,
                                       width: radius * 2,
                                       height: radius * 2))
    }
    
//    override func draw(_ rect: CGRect) {
//        super.draw(rect)
//        guard let ctx = UIGraphicsGetCurrentContext() else { return }
//        ctx.setFillColor(UIColor.red.cgColor)
//        ctx.setStrokeColor(UIColor.red.cgColor)
//        let star = MyBezie.star
//        ctx.addPath(star.cgPath)
//        ctx.fillPath()
//        setNeedsDisplay()
//    }
}

struct MyBezie {
    static var star: UIBezierPath = {
        let bezie = UIBezierPath()
        bezie.move(to: CGPoint(x: 40, y: 20))
        bezie.addLine(to: CGPoint(x: 45, y: 40))
        bezie.addLine(to: CGPoint(x: 65, y: 40))
        bezie.addLine(to: CGPoint(x: 50, y: 50))
        bezie.addLine(to: CGPoint(x: 60, y: 70))
        bezie.addLine(to: CGPoint(x: 40, y: 55))
        bezie.addLine(to: CGPoint(x: 20, y: 70))
        bezie.addLine(to: CGPoint(x: 30, y: 50))
        bezie.addLine(to: CGPoint(x: 15, y: 40))
        bezie.addLine(to: CGPoint(x: 35, y: 40))
        bezie.close()
        return bezie
    }()
}
