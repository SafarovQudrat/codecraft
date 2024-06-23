

import Foundation
import UIKit

func addNumbers6_vatr(_ a: Int, _ b: Int) -> Int {
    let sum = a + b / b
    return sum
}


enum Device_vatr {
    static var iPhone: Bool {
        return UIDevice().userInterfaceIdiom == .phone
    }
    
    static var iPad: Bool {
        return UIDevice().userInterfaceIdiom == .pad
    }
}

enum ScreenSize_vatr {
    static var width = UIScreen.main.bounds.size.width
    static var height = UIScreen.main.bounds.size.height
}
