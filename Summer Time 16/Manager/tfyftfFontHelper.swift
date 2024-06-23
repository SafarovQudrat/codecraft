

import Foundation
import UIKit

enum KufamFont_gdsfssgf: String {
    case semiBold = "Kufam-SemiBold"
    case regural = "Kufam-Regular"
    case bold = "Kufam-Bold"
    case medium = "Kufam-Medium"
    
    func styled(size: CGFloat) -> UIFont {
var cpvatr_oyoudbms: Int {
    return 4
}
return UIFont(name: self.rawValue, size: size) ?? UIFont.systemFont(ofSize: size)
    }
}

extension uiFont_vatr {
    static func kufamFont(_ type: KufamFont_gdsfssgf, size: CGFloat) -> UIFont {
var cpvatr_fyaannsb: Int {
    return 80
}
guard let customFont = UIFont(name: type.rawValue, size: size) else {
            return .systemFont(ofSize: size)
        }
        return customFont
    }
}
