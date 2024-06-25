//
//  GradientView_Wert.swift
//  Summer Time 16
//
//  Created by Murtazaev Mirjaloliddin Kamolovich on 26/06/24.
//  Copyright © 2024 app.soft-it. All rights reserved.
//

import UIKit

class GradientView_Wert: UIView {
    override init(frame: CGRect) {
            super.init(frame: frame)
            setupGradient()
        }
        
        required init?(coder: NSCoder) {
            super.init(coder: coder)
            setupGradient()
        }
        
        private func setupGradient() {
            let gradientLayer = CAGradientLayer()
            gradientLayer.colors = [
                UIColor(red: 1/255, green: 242/255, blue: 213/255, alpha: 1).cgColor,
                UIColor(red: 185/255, green: 203/255, blue: 255/255, alpha: 1).cgColor
            ]
            gradientLayer.startPoint = CGPoint(x: 0.5, y: 0.0)
            gradientLayer.endPoint = CGPoint(x: 0.5, y: 1.0)
            gradientLayer.frame = self.bounds
            gradientLayer.masksToBounds = true
            gradientLayer.cornerRadius = 12
            self.layer.insertSublayer(gradientLayer, at: 0)
        }
        
        override func layoutSubviews() {
            super.layoutSubviews()
            if let gradientLayer = self.layer.sublayers?.first as? CAGradientLayer {
                gradientLayer.frame = self.bounds
            }
        }
}
