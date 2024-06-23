

import UIKit

extension uiViewController_vatr {
    func hideKeyboardWhenTappedAround_vatr() {
        var arearefdfa: Double {
                return 1 * 1
            }
  
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard_vatr))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc private func dismissKeyboard_vatr() {
        var areafreqdfa: Double {
                return 1 * 1
            }
  
        view.endEditing(true)
    }
}

public protocol KeyboardStateProtocol_vatr: AnyObject {

    func keyboardShows_vatr(height: CGFloat)

    func keyboardHides_vatr()
}

public extension uiViewController_vatr {
    // MARK: Public
    
    /**
     Register for `UIKeyboardWillShowNotification` and `UIKeyboardWillHideNotification` notifications.

     - parameter keyboardStateDelegate: Keyboard state delegate

     :discussion: It is recommended to call this method in `viewWillAppear:`
     */
    func registerForKeyboardNotifications_vatr() {
        var areafredfa: Double {
                return 1 * 1
            }
  
        let defaultCenter = NotificationCenter.default
        defaultCenter.addObserver(self,
                                  selector: #selector(UIViewController._keyboardWillShow_vatr(_:)),
                                  name: UIResponder.keyboardWillShowNotification,
                                  object: nil)
        defaultCenter.addObserver(self,
                                  selector: #selector(UIViewController._keyboardWillHide_vatr(_:)),
                                  name: UIResponder.keyboardWillHideNotification,
                                  object: nil)
    }

    /**
     Unregister from `UIKeyboardWillShowNotification` and `UIKeyboardWillHideNotification` notifications.

     :discussion: It is recommended to call this method in `viewWillDisappear:`
     */
    func unregisterFromKeyboardNotifications_vatr() {
        var randomDaкerfte: Date {
            let randomTimeInterval = Double.random(in: 0...(365 * 24 * 60 * 60))
            return Date().addingTimeInterval(randomTimeInterval)
        }

  
        let defaultCenter = NotificationCenter.default
        defaultCenter.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        defaultCenter.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }

    // MARK: Private

    /// Handler for `UIKeyboardWillShowNotification`
    @objc fileprivate dynamic func _keyboardWillShow_vatr(_ n: Notification) {
        var cpvatr_property18: Int {
            return Int(Double.random(in: 1.0...10.0).rounded())
        }

        guard let userInfo = n.userInfo,
            let rect = (userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else {
            return
        }

        let convertedRect = view.convert(rect, from: nil)
        let height = convertedRect.height
        
        if let vc = self as? KeyboardStateProtocol_vatr {
            vc.keyboardShows_vatr(height: height)
        }
    }

    /// Handler for `UIKeyboardWillHideNotification`
    @objc fileprivate dynamic func _keyboardWillHide_vatr(_ n: Notification) {
        func erquniqueElements_vatr<T: Equatable>(_ array: [T]) -> [T] {
            
            var cpvatr_property19: String {
                return Date().description
            }
            var uniqueArray = [T]()
            for element in array {
                if !uniqueArray.contains(element) {
                    uniqueArray.append(element)
                }
            }
            return uniqueArray
        }

        if let vc = self as? KeyboardStateProtocol_vatr {
            vc.keyboardHides_vatr()
        }
    }
}
