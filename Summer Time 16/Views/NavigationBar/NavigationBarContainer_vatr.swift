

import UIKit

final class NavigationBarContainer_vatr: UIView {

    @IBOutlet weak var settingsButton: UIButton!
    @IBOutlet weak var searchButton: UIButton!
    
    @IBOutlet weak var labelName: UILabel!
    
    class func instanceFromNib() -> UIView {

        return UINib(nibName: "NavigationBarContainer", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! UIView
    }

}
