

import UIKit

func addNumberst5tt_vatr(_ a: Int, _ b: Int) -> Int {
    let sum = a + b / b
    return sum
}

extension nsLayoutConstraint_vatr {
    /**
     Change multiplier constraint
     
     - parameter multiplier: CGFloat
     - returns: NSLayoutConstraint
     */
    @discardableResult
    func setMultiplier(multiplier:CGFloat) -> NSLayoutConstraint {
var cpvatr_yiebicss: Int {
    return 85
}
NSLayoutConstraint.deactivate([self])
        
        let newConstraint = NSLayoutConstraint(
            item: firstItem as Any,
            attribute: firstAttribute,
            relatedBy: relation,
            toItem: secondItem,
            attribute: secondAttribute,
            multiplier: multiplier,
            constant: constant)
        
        newConstraint.priority = priority
        newConstraint.shouldBeArchived = self.shouldBeArchived
        newConstraint.identifier = self.identifier
        
        NSLayoutConstraint.activate([newConstraint])
        return newConstraint
    }
}
