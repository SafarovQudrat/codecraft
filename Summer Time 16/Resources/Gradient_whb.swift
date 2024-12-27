import Foundation
import QuartzCore
import UIKit

class Gradient {
    static func setupGradient(view: UIView,colors: [Any] = [  #colorLiteral(red: 0, green: 0.8705882353, blue: 0.9607843137, alpha: 1).cgColor, #colorLiteral(red: 0.06666666667, green: 0.03921568627, blue: 0.9137254902, alpha: 1).cgColor] ) {
        var gradient = CAGradientLayer()
        gradient.colors = colors
        
        gradient.startPoint = CGPoint(x: 0, y: 0)
        gradient.endPoint = CGPoint(x: 0.0, y: 1.0)
        gradient.frame = view.bounds
        view.layer.sublayers?.removeAll(where: { $0 is CAGradientLayer })
        view.layer.insertSublayer(gradient, at: 0)
    }
    
    static func setupGradientForBorderColor(view: UIView) {
         var gradientLayer: CAGradientLayer?
         var borderGradientLayer: CAGradientLayer?
        gradientLayer?.removeFromSuperlayer()
        gradientLayer = CAGradientLayer()
        gradientLayer?.frame = view.bounds
        gradientLayer?.colors = [ #colorLiteral(red: 0.03137254902, green: 0.431372549, blue: 0.937254902, alpha: 1).cgColor, #colorLiteral(red: 0.07843137255, green: 0.1058823529, blue: 0.9215686275, alpha: 1).cgColor]
        gradientLayer?.startPoint = CGPoint(x: 0.5, y: 0)
        gradientLayer?.endPoint = CGPoint(x: 0.5, y: 1)
        if let gradientLayer = gradientLayer {
            view.layer.insertSublayer(gradientLayer, at: 0)
        }
        borderGradientLayer?.removeFromSuperlayer()
        borderGradientLayer = CAGradientLayer()
        borderGradientLayer?.colors = [ #colorLiteral(red: 0.02691857993, green: 0.9140884479, blue: 0.8175817202, alpha: 1).cgColor, #colorLiteral(red: 0.7239795918, green: 0.7959121148, blue: 0.9981217487, alpha: 1).cgColor]
        borderGradientLayer?.frame = view.bounds
        borderGradientLayer?.startPoint = CGPoint(x: 0.5, y: 0)
        borderGradientLayer?.endPoint = CGPoint(x: 0.5, y: 1)
        
        let shape = CAShapeLayer()
        shape.lineWidth = 3
        shape.path = UIBezierPath(roundedRect: view.bounds, cornerRadius: 24).cgPath
        shape.fillColor = UIColor.clear.cgColor
        shape.strokeColor = UIColor.black.cgColor
        borderGradientLayer?.mask = shape
        
        if let borderGradientLayer = borderGradientLayer {
            view.layer.addSublayer(borderGradientLayer)
        }
        
        
        
    }
    static func setupButtonGradient(view: UIView) {
        var gradient = CAGradientLayer()
        gradient.colors = [
            #colorLiteral(red: 0.03137254902, green: 0.431372549, blue: 0.937254902, alpha: 1).cgColor, #colorLiteral(red: 0.07843137255, green: 0.1058823529, blue: 0.9215686275, alpha: 1).cgColor
        ]
        gradient.startPoint = CGPoint(x: 0, y: 0)
        gradient.endPoint = CGPoint(x: 0.0, y: 1.0)
        gradient.frame = view.bounds
        gradient.cornerRadius = view.layer.cornerRadius
        view.layer.sublayers?.removeAll(where: { $0 is CAGradientLayer })
        view.layer.insertSublayer(gradient, at: 0)
    }
   
}


class GradientButtonView: UIButton {
    
    override func layoutSubviews() {
        super.layoutSubviews()
        Gradient.setupButtonGradient(view: self)
    }
    
    
}


class GradientButton: UIButton {
    
    override func layoutSubviews() {
        super.layoutSubviews()
        Gradient.setupButtonGradient(view: self)
    }
    
    
}

class ContentGradientButton: UIButton {
    
    private var gradientLayer: CAGradientLayer?
    private var borderGradientLayer: CAGradientLayer?
    
    override var isSelected: Bool {
        didSet {
            updateButtonAppearance()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButton()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupButton()
    }
    
    private func setupButton() {
        self.layer.cornerRadius = 22
        self.clipsToBounds = true
        updateButtonAppearance()
        self.titleLabel?.font = UIFont(name: "Kufam", size: 14)
    }
    
    private func updateButtonAppearance() {
        if isSelected {
            applyGradientBackground()
            applyGradientBorder()
        } else {
            removeGradientBackground()
            removeGradientBorder()
        }
    }
    
    private func applyGradientBackground() {
        
        gradientLayer?.removeFromSuperlayer()
        gradientLayer = CAGradientLayer()
        gradientLayer?.frame = self.bounds
        gradientLayer?.colors = [ #colorLiteral(red: 0.03137254902, green: 0.431372549, blue: 0.937254902, alpha: 1).cgColor, #colorLiteral(red: 0.07843137255, green: 0.1058823529, blue: 0.9215686275, alpha: 1).cgColor]
        gradientLayer?.startPoint = CGPoint(x: 0.5, y: 0)
        gradientLayer?.endPoint = CGPoint(x: 0.5, y: 1)
        if let gradientLayer = gradientLayer {
            self.layer.insertSublayer(gradientLayer, at: 0)
        }
        self.setTitleColor(.white, for: .normal)
    }
    
    private func removeGradientBackground() {
        gradientLayer?.removeFromSuperlayer()
        gradientLayer = nil
        self.backgroundColor = #colorLiteral(red: 0, green: 0.3428561091, blue: 0.8461764455, alpha: 1)
        self.setTitleColor(.white, for: .normal)
    }
    
    private func applyGradientBorder() {
        borderGradientLayer?.removeFromSuperlayer()
        borderGradientLayer = CAGradientLayer()
        borderGradientLayer?.colors = [ #colorLiteral(red: 0.02691857993, green: 0.9140884479, blue: 0.8175817202, alpha: 1).cgColor, #colorLiteral(red: 0.7239795918, green: 0.7959121148, blue: 0.9981217487, alpha: 1).cgColor]
        borderGradientLayer?.frame = self.bounds
        borderGradientLayer?.startPoint = CGPoint(x: 0.5, y: 0)
        borderGradientLayer?.endPoint = CGPoint(x: 0.5, y: 1)
        
        let shape = CAShapeLayer()
        shape.lineWidth = 3
        shape.path = UIBezierPath(roundedRect: self.bounds, cornerRadius: 22).cgPath
        shape.fillColor = UIColor.clear.cgColor
        shape.strokeColor = UIColor.black.cgColor
        borderGradientLayer?.mask = shape
        
        if let borderGradientLayer = borderGradientLayer {
            self.layer.addSublayer(borderGradientLayer)
        }
        self.setTitleColor(.white, for: .normal)
    }
    
    private func removeGradientBorder() {
        borderGradientLayer?.removeFromSuperlayer()
        borderGradientLayer = nil
        self.layer.borderWidth = 0
        self.setTitleColor(.white, for: .normal)
    }
}



extension UIView {
    func applyGradientBorder(colors: [UIColor] = [ #colorLiteral(red: 0.02691857993, green: 0.9140884479, blue: 0.8175817202, alpha: 1), #colorLiteral(red: 0.7239795918, green: 0.7959121148, blue: 0.9981217487, alpha: 1)], borderWidth: CGFloat, startPoint: CGPoint = CGPoint(x: 0.5, y: 0), endPoint: CGPoint = CGPoint(x: 0.5, y: 1.0)) {
           let gradientLayer = CAGradientLayer()
           gradientLayer.colors = colors.map { $0.cgColor }
           gradientLayer.startPoint = startPoint
           gradientLayer.endPoint = endPoint
           gradientLayer.frame = self.bounds
           
           let shapeLayer = CAShapeLayer()
           shapeLayer.lineWidth = borderWidth
           shapeLayer.path = UIBezierPath(rect: self.bounds).cgPath
           shapeLayer.fillColor = UIColor.clear.cgColor
           shapeLayer.strokeColor = UIColor.black.cgColor
           gradientLayer.mask = shapeLayer
        gradientLayer.cornerRadius = 24
           self.layer.sublayers?.removeAll(where: { $0 is CAGradientLayer })
           self.layer.insertSublayer(gradientLayer, at: 0)
       }
}
