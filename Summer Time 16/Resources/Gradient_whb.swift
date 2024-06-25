import Foundation
import QuartzCore
import UIKit

class Gradient {
    static func setupGradient(view: UIView) {
        var gradient = CAGradientLayer()
        gradient.colors = [
            #colorLiteral(red: 0, green: 0.8705882353, blue: 0.9607843137, alpha: 1).cgColor,
            #colorLiteral(red: 0.06666666667, green: 0.03921568627, blue: 0.9137254902, alpha: 1).cgColor
        ]
        gradient.startPoint = CGPoint(x: 0, y: 0)
        gradient.endPoint = CGPoint(x: 0.0, y: 1.0)
        gradient.frame = view.bounds
        view.layer.sublayers?.removeAll(where: { $0 is CAGradientLayer })
        view.layer.insertSublayer(gradient, at: 0)
    }
}

class GradientButton: UIButton {
    
    override func layoutSubviews() {
        super.layoutSubviews()
        Gradient.setupGradient(view: self)
    }
}
