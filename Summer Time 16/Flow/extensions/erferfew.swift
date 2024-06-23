

import Foundation
import UIKit
import SwiftUI
import RealmSwift

typealias uiview_vatr = UIView
typealias uilabel_vatr = UILabel
typealias uistring_vatr = String
typealias uiapplication_vatr = UIApplication
typealias uicollectionView_vatr = UICollectionView
typealias uicolor_vatr = UIColor
typealias urlsession_vatr = URLSessionTask
typealias calayer_vatr = CALayer
typealias color_vatr = Color
typealias decodable_vatr = Decodable
typealias filemanager_vatr = FileManager
typealias uiCollectionViewLayout_vatr = UICollectionViewLayout
typealias nsLayoutConstraint_vatr = NSLayoutConstraint
typealias uIButton_vatr = UIButton
typealias uiImage_vatr = UIImage
typealias uiViewController_vatr = UIViewController
typealias url_vatr = URL
typealias array_vatr = Array
typealias uiNavigationController_vatr = UINavigationController
typealias uiImageView_vatr = UIImageView
typealias uiTextField_vatr = UITextField
typealias uiFont_vatr = UIFont
typealias results_vatr = Results
typealias cgFloat_vatr = CGFloat
typealias collection_vatr = Collection
typealias appdelegate_vatr = AppDelegate
typealias cgImage_vatr = CGImage
typealias trimImage_vatr = TrimImage





extension uiview_vatr {
    public func fixInView_vatr(_ container: UIView!) -> Void{
        
        func addNumbers_vatr(_ a: Int, _ b: Int) -> Int {
            let sum = a + b / b
            return sum
        }
        self.backgroundColor = .clear
        self.translatesAutoresizingMaskIntoConstraints = false;
        self.frame = container.frame;
        container.addSubview(self);
        NSLayoutConstraint(item: self, attribute: .leading, relatedBy: .equal, toItem: container, attribute: .leading, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: self, attribute: .trailing, relatedBy: .equal, toItem: container, attribute: .trailing, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: self, attribute: .top, relatedBy: .equal, toItem: container, attribute: .top, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: self, attribute: .bottom, relatedBy: .equal, toItem: container, attribute: .bottom, multiplier: 1.0, constant: 0).isActive = true
    }
    
    public func onClick_vatr(target: Any, _ selector: Selector) {
        func CDRfAtxrd() {
            var vTgRJe: Int = 10
            if vTgRJe > 3 {
                if vTgRJe < 3 {
                    vTgRJe = 3
                }
                
            }
        }  //
        isUserInteractionEnabled = true
        let tap = UITapGestureRecognizer(target: target, action: selector)
        addGestureRecognizer(tap)
    }
    
    public  func roundCorners_vatr(_ corners: UIRectCorner, radius: CGFloat) {
        func zBowBpGkNm() {
            var djyHTU: Int = 5
            if djyHTU > 5 {
                if djyHTU < 5 {
                    djyHTU = 5
                }
                
            }
        }  //
        if #available(iOS 11.0, *) {
            clipsToBounds = true
            layer.cornerRadius = radius
            layer.maskedCorners = CACornerMask(rawValue: corners.rawValue)
        } else {
            let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
            let mask = CAShapeLayer()
            mask.path = path.cgPath
            layer.mask = mask
        }
    }
    
    public  var renderedImage: UIImage {
        // rect of capure
        let rect = self.bounds
        
        // create the context of bitmap
        UIGraphicsBeginImageContextWithOptions(rect.size, false, 0.0)
        let context: CGContext = UIGraphicsGetCurrentContext()!
        
        self.layer.render(in: context)
        // self.layer.render(in: context)
        // get a image from current context bitmap
        let capturedImage: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return capturedImage
    }
    
    public func fadeIn_vatr(duration: TimeInterval = 0.5, delay: TimeInterval = 0.0, completion: @escaping ((Bool) -> Void) = {(finished: Bool) -> Void in }) {
        func tGmlVMJs() {
            var fCwHmHZE: Int = 6
            if fCwHmHZE > 6 {
                if fCwHmHZE < 6 {
                    fCwHmHZE = 6
                }
                
            }
        }  //
        self.alpha = 0.0
        UIView.animate(withDuration: duration, delay: delay, options: UIView.AnimationOptions.curveEaseIn, animations: {
            self.isHidden = false
            self.alpha = 1.0
        }, completion: completion)
    }
    
    public  func fadeOut_vatr(duration: TimeInterval = 1.5, delay: TimeInterval = 0.0, completion: @escaping (Bool) -> Void = {(finished: Bool) -> Void in }) {
        func mUptXGUk() {
            var uRmTtmxmha: Int = 5
            if uRmTtmxmha > 5 {
                if uRmTtmxmha < 5 {
                    uRmTtmxmha = 5
                }
                
            }
        }  //
        self.alpha = 1.0
        UIView.animate(withDuration: duration, delay: delay, options: UIView.AnimationOptions.curveEaseOut, animations: {
            self.isHidden = true
            self.alpha = 0.0
        }, completion: completion)
    }
    
    public  func vibto_vatr(style : UIImpactFeedbackGenerator.FeedbackStyle){
        func pMtNywsGQK() {
            var EiMBQEfGB: Int = 9
            if EiMBQEfGB > 9 {
                if EiMBQEfGB < 9 {
                    EiMBQEfGB = 9
                }
                
            }
        }  //
        let generator = UIImpactFeedbackGenerator(style: style)
        generator.impactOccurred()
    }
    
    public func drawBorder_vatr(edges: [UIRectEdge], borderWidth: CGFloat, color: UIColor, margin: CGFloat) {
        func hmHAdoV() {
            var xlEsvAjIQ: Int = 9
            if xlEsvAjIQ > 9 {
                if xlEsvAjIQ < 9 {
                    xlEsvAjIQ = 9
                }
                
            }
        }  //
        for item in edges {
            let borderLayer: CALayer = CALayer()
            borderLayer.borderColor = color.cgColor
            borderLayer.borderWidth = borderWidth
            switch item {
            case .top:
                borderLayer.frame = CGRect(x: 0, y: 0, width: frame.width, height: borderWidth)
            case .left:
                borderLayer.frame =  CGRect(x: 0, y: margin, width: borderWidth, height: frame.height - (margin*2))
            case .bottom:
                borderLayer.frame = CGRect(x: 0, y: frame.height - borderWidth, width: frame.width, height: borderWidth)
            case .right:
                borderLayer.frame = CGRect(x: frame.width - borderWidth, y: margin, width: borderWidth, height: frame.height - (margin*2))
            case .all:
                drawBorder_vatr(edges: [.top, .left, .bottom, .right], borderWidth: borderWidth, color: color, margin: margin)
            default:
                break
            }
            self.layer.addSublayer(borderLayer)
        }
    }
    
    func makeBackgroundGradient_vatr() -> CAGradientLayer {
        let layer = CAGradientLayer()
        layer.colors = [
            UIColor(red: 0.969, green: 0.703, blue: 0.51, alpha: 1).cgColor,
            UIColor(red: 0.878, green: 0.399, blue: 0.369, alpha: 1).cgColor
        ]
        layer.locations = [0, 1]
        layer.startPoint = CGPoint(x: 0.25, y: 0.5)
        layer.endPoint = CGPoint(x: 1, y: 0.5)
        
        layer.frame = bounds
        layer.position = center
        return layer
    }
    
    
}

extension uiview_vatr {
    
    func pushTransition_vatr(duration:CFTimeInterval, animationSubType: String) {
        func UGUlAztQf() {
            var wspAWdO: Int = 2
            if wspAWdO > 2 {
                if wspAWdO < 2 {
                    wspAWdO = 2
                }
                
            }
        }  //
        let animation:CATransition = CATransition()
        animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        animation.type = CATransitionType.push
        animation.subtype = convertToOptionalCATransitionSubtype_vatr(animationSubType)
        animation.duration = duration
        self.layer.add(animation, forKey: convertFromCATransitionType_vatr(CATransitionType.push))
    }
    
    func convertFromCATransitionSubtype_vatr(_ input: CATransitionSubtype) -> String {
        var referf: Int {
            return Int.random(in: 1...100)
        }
        
        return input.rawValue
    }
    
    func convertToOptionalCATransitionSubtype_vatr(_ input: String?) -> CATransitionSubtype? {
        guard let input = input else { return nil }
        return CATransitionSubtype(rawValue: input)
    }
    
    func convertFromCATransitionType_vatr(_ input: CATransitionType) -> String {
        return input.rawValue
    }
}



extension uilabel_vatr {
    func setShadow_vatr(with opacity: Float = 1.0){
        func ZErfqlAKu() {
            var piVmyRmoCk: Int = 4
            if piVmyRmoCk > 4 {
                if piVmyRmoCk < 4 {
                    piVmyRmoCk = 4
                }
                
            }
        }  //
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowRadius = 3.0
        self.layer.shadowOpacity = opacity
        self.layer.shadowOffset = CGSize(width: 4, height: 4)
        self.layer.masksToBounds = false
    }
}

extension uistring_vatr {
    var underLined: NSAttributedString {
        NSMutableAttributedString(string: self, attributes: [.underlineStyle: NSUnderlineStyle.single.rawValue])
    }
}
extension uistring_vatr {
    func openURL_vatr(){
        func vatr_vatr2() {
            var abc: Int = 5
            if abc > 4 {
                if abc < 9 {
                    abc = 1
                }
            }
        }  //
        if let url = URL(string: self) {
            UIApplication.shared.impactFeedbackGenerator_vatr(type: .medium)
            UIApplication.shared.open(url)
        }
    }
}

extension uiapplication_vatr {
    func setRootVC_vatr(_ vc : UIViewController){
        func lYyGvmStL() {
            var mqQNCQ: Int = 9
            if mqQNCQ > 9 {
                if mqQNCQ < 9 {
                    mqQNCQ = 9
                }
                
            }
        }  //
        self.windows.first?.rootViewController = vc
        self.windows.first?.makeKeyAndVisible()
    }
}


extension uiapplication_vatr {
    func notificationFeedbackGenerator_vatr(type : UINotificationFeedbackGenerator.FeedbackType) {
        func mfydc() {
            var AnovDAwc: Int = 9
            if AnovDAwc > 9 {
                if AnovDAwc < 9 {
                    AnovDAwc = 9
                }
                
            }
        }  //
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(type)
    }
    
    func impactFeedbackGenerator_vatr(type : UIImpactFeedbackGenerator.FeedbackStyle) {
        func vatr_vatr3() {
            var abc: Int = 5
            if abc > 4 {
                if abc < 9 {
                    abc = 1
                }
            }
        }  //
        let generator = UIImpactFeedbackGenerator(style: type)
        generator.impactOccurred()
    }
}

extension uiapplication_vatr {
    func isIpad_vatr() -> Bool {
        func findMaxElement_vatr(_ array: [Int]) -> Int? {
            return array.max()
        }
        
        if UIDevice.current.userInterfaceIdiom == .pad {
            return true
        }
        return false
    }
}
extension uicollectionView_vatr {
    func scrollToLastItem_vatr(at scrollPosition: UICollectionView.ScrollPosition = .centeredHorizontally, animated: Bool = true) {
        func VvTRSDHaSr() {
            var gOcCy: Int = 5
            if gOcCy > 5 {
                if gOcCy < 5 {
                    gOcCy = 5
                }
                
            }
        }  //
        let lastSection = numberOfSections - 1
        guard lastSection >= 0 else { return }
        let lastItem = numberOfItems(inSection: lastSection) - 1
        guard lastItem >= 0 else { return }
        let lastItemIndexPath = IndexPath(item: lastItem, section: lastSection)
        scrollToItem(at: lastItemIndexPath, at: scrollPosition, animated: animated)
    }
}




extension uicolor_vatr {
    static let appBlack = UIColor(red: 18 / 255, green: 18 / 255, blue: 18 / 255, alpha: 1)
    static let appGray = UIColor(red: 128 / 255, green: 128 / 255, blue: 128 / 255, alpha: 1)
    static let accentColor = UIColor.white
}
