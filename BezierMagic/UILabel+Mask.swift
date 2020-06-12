//
//  UILabel+Mask.swift
//  BezierMagic
//
//  Created by Christian Iñigo De Leon Alvarez on 6/12/20.
//  Copyright © 2020 Christian Iñigo De Leon Alvarez. All rights reserved.
//

import UIKit

extension UILabel {
    
    func curvedBottomLeftMask() {
        let bounds: CGRect = self.bounds
        let maskPath = UIBezierPath()
        
        maskPath.move(to: CGPoint(x: 0.0, y: 0.0))
        maskPath.addLine(to: CGPoint(x: bounds.width, y: 0.0))
        maskPath.addLine(to: CGPoint(x: bounds.width, y: bounds.height))
        maskPath.addLine(to: CGPoint(x: bounds.width * 0.5, y: bounds.height))
        maskPath.addQuadCurve(to: CGPoint(x: 0.0,
                                          y: 0.0),
                              controlPoint: CGPoint(x: 0.0,
                                                    y: bounds.height))
        maskPath.close()
        let maskLayer = CAShapeLayer()
        maskLayer.frame = bounds
        maskLayer.path = maskPath.cgPath
        self.layer.mask = maskLayer
    }
    
    func curvedBottomRightMask() {
        let bounds: CGRect = self.bounds
        let maskPath = UIBezierPath()
        maskPath.move(to: CGPoint(x: bounds.width, y: 0.0))
        maskPath.addLine(to: CGPoint(x: 0.0, y: 0.0))
        maskPath.addLine(to: CGPoint(x: 0.0, y: bounds.height))
        maskPath.addLine(to: CGPoint(x: bounds.width*0.66, y: bounds.height))
        maskPath.addQuadCurve(to: CGPoint(x: bounds.width,
                                          y: 0.0),
                              controlPoint: CGPoint(x: bounds.width,
                                                    y: bounds.height))
        maskPath.close()
        let maskLayer = CAShapeLayer()
        maskLayer.frame = bounds
        maskLayer.path = maskPath.cgPath
        self.layer.mask = maskLayer
    }
    
    func cylinderMask() {
        let bounds: CGRect = self.bounds
        let maskPath = UIBezierPath()
        let halfHeight = bounds.height/2
        let ninetyDegrees = CGFloat(Double.pi)*3/2
        let oneEightyDegrees = CGFloat(Double.pi)/2
        
        maskPath.addArc(withCenter: CGPoint(x: halfHeight, y: halfHeight), radius: halfHeight, startAngle: ninetyDegrees, endAngle: oneEightyDegrees, clockwise: false)
        maskPath.addLine(to: CGPoint(x: bounds.width-halfHeight, y: bounds.height))
        maskPath.addArc(withCenter: CGPoint(x: bounds.width - halfHeight, y: halfHeight), radius: halfHeight, startAngle: oneEightyDegrees, endAngle: ninetyDegrees, clockwise: false)
        maskPath.close()
        
        let maskLayer = CAShapeLayer()
        maskLayer.path = maskPath.cgPath
        self.layer.mask = maskLayer
        self.layer.masksToBounds = true
        
        let borderLayer = CAShapeLayer()
        borderLayer.path = maskLayer.path
        borderLayer.frame = bounds
        borderLayer.lineWidth = 2.0
        borderLayer.fillColor = UIColor.clear.cgColor
        borderLayer.strokeColor = self.layer.borderColor
        self.layer.addSublayer(borderLayer)
    }
}

