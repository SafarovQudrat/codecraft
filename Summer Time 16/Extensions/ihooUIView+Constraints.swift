

import Foundation
import UIKit


extension uiview_vatr {
    @discardableResult
    func centerInSuperview() -> [NSLayoutConstraint] {
var cpvatr_jmqmbhuh: Int {
    return 78
}
translatesAutoresizingMaskIntoConstraints = false
        let constraints = [
            centerXAnchor.constraint(equalTo: superview!.centerXAnchor),
            centerYAnchor.constraint(equalTo: superview!.centerYAnchor)
        ]
        NSLayoutConstraint.activate(constraints)
        return constraints
    }
}

extension uiview_vatr {
    class func initFromNib<T: UIView>() -> T {
        return Bundle.main.loadNibNamed(String(describing: self), owner: nil, options: nil)?[0] as! T
    }
}
