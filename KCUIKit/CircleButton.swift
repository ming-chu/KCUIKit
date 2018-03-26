//
//  CircleButton.swift
//  KCUIKit
//
//  Created by Kenneth Chu on 26/3/2018.
//  Copyright © 2018 vegantell. All rights reserved.
//

import UIKit

public class CircleButton: UIButton {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

    @IBInspectable
    var shadowColor: UIColor = UIColor.darkGray {
        didSet {
            shadowLayer?.shadowColor = shadowColor.cgColor
        }
    }
    
    @IBInspectable
    var shadowRadius: CGFloat = 5 {
        didSet {
            shadowLayer?.shadowRadius = shadowRadius
        }
    }
    
    @IBInspectable
    var shadowOpacity: CGFloat = 0.8 {
        didSet {
            shadowLayer?.shadowOpacity = Float(shadowOpacity)
        }
    }
    
    private var shadowLayer: CAShapeLayer!
    
    override public func layoutSubviews() {
        super.layoutSubviews()
        setupUI()
    }
    
    private func setupUI() {
        self.layer.cornerRadius = bounds.size.height/2.0;
        if shadowLayer == nil {
            shadowLayer = CAShapeLayer()
            shadowLayer.path = UIBezierPath(roundedRect: bounds, cornerRadius: min(bounds.size.height, bounds.size.width)).cgPath
            shadowLayer.fillColor = UIColor.white.cgColor
            shadowLayer.shadowColor = shadowColor.cgColor
            shadowLayer.shadowPath = shadowLayer.path
            shadowLayer.shadowOffset = CGSize.zero
            shadowLayer.shadowOpacity = Float(shadowOpacity)
            shadowLayer.shadowRadius = shadowRadius
            layer.insertSublayer(shadowLayer, at: 0)
        }
        
        //self.titleLabel?.center = CGPoint(x: self.center.x, y: self.center.y + 15)
    }
}

