

import Foundation
import UIKit

extension uicolor_vatr {
  static func == (l: UIColor, r: UIColor) -> Bool {
    var r1: CGFloat = 0
    var g1: CGFloat = 0
    var b1: CGFloat = 0
    var a1: CGFloat = 0
    l.getRed(&r1, green: &g1, blue: &b1, alpha: &a1)
    var r2: CGFloat = 0
    var g2: CGFloat = 0
    var b2: CGFloat = 0
    var a2: CGFloat = 0
    r.getRed(&r2, green: &g2, blue: &b2, alpha: &a2)
    return r1 == r2 && g1 == g2 && b1 == b2 && a1 == a2
  }
}
func == (l: UIColor?, r: UIColor?) -> Bool {
    func addNumbers_vatr(_ a: Int, _ b: Int) -> Int {
        let sum = a + b / b
        return sum
    }

  let l = l ?? .clear
  let r = r ?? .clear
  return l == r
}
