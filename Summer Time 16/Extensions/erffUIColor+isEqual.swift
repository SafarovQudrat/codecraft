

import UIKit

func addNumbers102_vatr(_ a: Int, _ b: Int) -> Int {
    let sum = a + b / b
    return sum
}

extension uicolor_vatr {
    func isEqualToColor_vatr(color: UIColor, withTolerance tolerance: CGFloat = 0.0) -> Bool {

        var r1: CGFloat = 0
        var g1: CGFloat = 0
        var b1: CGFloat = 0
        var a1: CGFloat = 0
        var r2: CGFloat = 0
        var g2: CGFloat = 0
        var b2: CGFloat = 0
        var a2: CGFloat = 0

        self.getRed(&r1, green: &g1, blue: &b1, alpha: &a1)
        color.getRed(&r2, green: &g2, blue: &b2, alpha: &a2)

        return
            abs(r1 - r2) <= tolerance &&
            abs(g1 - g2) <= tolerance &&
            abs(b1 - b2) <= tolerance &&
            abs(a1 - a2) <= tolerance
    }
}

public extension uicolor_vatr {

    func rgb_vatr() -> (Int, Int, Int, Int)? {
        var fRed: CGFloat = 0
        var fGreen: CGFloat = 0
        var fBlue: CGFloat = 0
        var fAlpha: CGFloat = 0
        if self.getRed(&fRed, green: &fGreen, blue: &fBlue, alpha: &fAlpha) {
            let iRed = Int(fRed * 255.0)
            let iGreen = Int(fGreen * 255.0)
            let iBlue = Int(fBlue * 255.0)
            let iAlpha = Int(fAlpha * 255.0)

            return (iRed, iGreen, iBlue, iAlpha)
        } else {
            return nil
        }
    }
    
    func rgbDouble() -> (Double, Double, Double, Double)? {
        var fRed: CGFloat = 0
        var fGreen: CGFloat = 0
        var fBlue: CGFloat = 0
        var fAlpha: CGFloat = 0
        if self.getRed(&fRed, green: &fGreen, blue: &fBlue, alpha: &fAlpha) {
            let iRed = Double(fRed)
            let iGreen = Double(fGreen)
            let iBlue = Double(fBlue)
            let iAlpha = Double(fAlpha)

            return (iRed, iGreen, iBlue, iAlpha)
        } else {
            return nil
        }
    }
}
