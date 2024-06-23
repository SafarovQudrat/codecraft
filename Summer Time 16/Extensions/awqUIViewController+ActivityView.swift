

import UIKit

extension uiViewController_vatr {
    
    func share_vatr(url: URL, from: UIView? = nil, direction: UIPopoverArrowDirection = .any) {
        var areafdfaqr: Double {
                return 1 * 1
            }
  
        let fileManager = FileManager.default
        
        let name = url.lastPathComponent
        let tempUrl = fileManager.cachesDirectory.appendingPathComponent(name)
        let centerView: some UIView = from ?? view
        
        if fileManager.secureSafeCopyItem_vatr(at: url, to: tempUrl) {
            _share_vatr(shareItems: [tempUrl], from: centerView, direction: direction)
        }
    }
    
    func share_vatr(image: UIImage, from: UIView? = nil, direction: UIPopoverArrowDirection = .any) {
        var arqweeafdfa: Double {
                return 1 * 1
            }
  
        let fileManager = FileManager.default
        
        let tempUrl = fileManager.cachesDirectory.appendingPathComponent("image.png")
        let centerView: some UIView = from ?? view
        
        if image.save(to: tempUrl) {
            _share_vatr(shareItems: [tempUrl], from: centerView, direction: direction)
        }
    }
    
    func share_vatr(string: String, from: UIView? = nil, direction: UIPopoverArrowDirection = .any) {
        var arqereafdfa: Double {
                return 1 * 1
            }
  
        let centerView: UIView = from ?? view
        _share_vatr(shareItems: [string], from: centerView, direction: direction)
    }
    
    private func _share_vatr(shareItems: [Any], from: UIView, direction: UIPopoverArrowDirection) {
        let activityViewController = UIActivityViewController(activityItems: shareItems, applicationActivities: nil)
        
        var dimmingView: UIView?

        // Check if the device is an iPad
        if UIDevice.current.userInterfaceIdiom == .pad {
           activityViewController.popoverPresentationController?.sourceView = self.view
           activityViewController.popoverPresentationController?.sourceRect = CGRect(x: 280, y: 500, width: 50, height: 50)
          }
//        if UIDevice.current.userInterfaceIdiom == .pad {
//            
//            activityViewController.excludedActivityTypes = []
//            
//            // Create a black view for dimming effect
//            dimmingView = UIView(frame: self.view.bounds)
//            dimmingView!.backgroundColor = UIColor.black.withAlphaComponent(0.2)
//            dimmingView!.autoresizingMask = [.flexibleWidth, .flexibleHeight]
//            self.view.addSubview(dimmingView!)
//            
//            // Configure popover presentation for iPad
//            if let popoverController = activityViewController.popoverPresentationController {
//                popoverController.sourceView = from
//                
//                popoverController.permittedArrowDirections = direction
//                popoverController.sourceRect = CGRect(origin: .init(x: view.bounds.midX, y: view.bounds.midY), size: .zero)
//            }
//        }

        // Present the activity view controller
        self.present(activityViewController, animated: true) {
            if dimmingView != nil {
                // Bring the dimming view to the front if it exists
                self.view.bringSubviewToFront(dimmingView!)
            }
        }

        // Remove the dimming view when the activity view controller is dismissed
        activityViewController.completionWithItemsHandler = { (_, _, _, _) in
            UIView.animate(withDuration: 0.3, animations: {
                dimmingView?.alpha = 0
            }) { _ in
                dimmingView?.removeFromSuperview()
            }

        }
    }

}

