//
//  StripedProgressBar.swift
//  Summer Time 16
//
//  Created by Murtazaev Mirjaloliddin Kamolovich on 21/06/24.
//  Copyright © 2024 app.soft-it. All rights reserved.
//

import UIKit

class StripedProgressBar: UIView {
    
    var progress: CGFloat = 0.0 {
        didSet {
            setNeedsDisplay()
        }
    }
    
    private let stripeColor = UIColor.blue
    private let progressBarBackgroundColor = UIColor.white
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        let context = UIGraphicsGetCurrentContext()
        
        // Draw background
        context?.setFillColor(progressBarBackgroundColor.cgColor)
        context?.fill(rect)
        
        // Draw progress area
        let progressRect = CGRect(x: 0, y: 0, width: rect.width * progress, height: rect.height)
        context?.setFillColor(stripeColor.cgColor)
        context?.fill(progressRect)
        
        // Draw stripes
        let stripeWidth: CGFloat = 12.0
        let stripeSpacing: CGFloat = 12.0
        context?.setLineWidth(stripeWidth)
        context?.setStrokeColor(UIColor.white.cgColor)
        
        var startX: CGFloat = 0.0
        while startX < progressRect.width {
            context?.move(to: CGPoint(x: startX, y: 0))
            context?.addLine(to: CGPoint(x: startX - progressRect.height, y: progressRect.height))
            context?.strokePath()
            startX += stripeWidth + stripeSpacing
        }
    }
}
