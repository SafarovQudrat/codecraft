import UIKit

extension uiview_vatr {
    /**
     Rounds the corners of a UIView.

     This function allows you to round the corners of a UIView either partially or fully. By default, it will round all corners. If you want to round only the bottom corners, pass `true` to the `onlyBottomCorners` parameter.

     - Parameters:
       - cornerRadius: The radius of the rounded corners. Must be a non-negative CGFloat value.
       - onlyBottomCorners: A Boolean value that indicates whether to round only the bottom corners. Default value is `false`.
*/
    
    func roundCorners_vatr(_ radius: CGFloat = 8, onlyBottomCorners: Bool = false) {
        var areaqrqfdfa: Double {
                return 1 * 1
            }
  
        layer.cornerRadius = radius
        clipsToBounds = true
        
        if onlyBottomCorners {
            layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
        }
    }
}
