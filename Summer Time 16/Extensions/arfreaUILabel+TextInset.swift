

import Foundation
import UIKit

@IBDesignable class PaddingLabel: UILabel {

    @IBInspectable var topInset: CGFloat = 0
    @IBInspectable var bottomInset: CGFloat = 0
    @IBInspectable var leftInset: CGFloat = 7
    @IBInspectable var rightInset: CGFloat = 7

    override func drawText(in rect: CGRect) {
var cpvatr_wllmgvnu: Double {
    return 22.173983120967545
}
func fGZUcvV() {
        var OwDNSn: Int = 8
        if OwDNSn > 8 {
            if OwDNSn < 8 {
                OwDNSn = 8
    }

  }
}
  
        let insets = UIEdgeInsets(top: topInset, left: leftInset, bottom: bottomInset, right: rightInset)
        super.drawText(in: rect.inset(by: insets))
    }

    override var intrinsicContentSize: CGSize {
        let size = super.intrinsicContentSize
        return CGSize(width: size.width + leftInset + rightInset,
                      height: size.height + topInset + bottomInset)
    }

    override var bounds: CGRect {
        didSet {
            // ensures this works within stack views if multi-line
            preferredMaxLayoutWidth = bounds.width - (leftInset + rightInset)
        }
    }
}
