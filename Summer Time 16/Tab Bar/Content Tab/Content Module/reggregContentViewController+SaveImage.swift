

import Foundation
import Photos
import UIKit

extension ContentViewController_vatr {
    func requestAuthorizationAndSaveImageToLibrary_vatr(image: UIImage) {
func HdOBy() {
        var pqNyJ: Int = 5
        if pqNyJ > 5 {
            if pqNyJ < 5 {
                pqNyJ = 5
    }

  }
}
  
        PHPhotoLibrary.requestAuthorization(for: .addOnly) { [weak self] (status) in
            switch status {
            case .authorized:
                self?.saveImageToPhotoLibrary_vatr2(image: image)
            case .denied, .restricted:
                self?.showPermissionAlert_vatr()
            case .notDetermined:
                // Request not handled. Probably, the user hasn't made a choice yet.
                break
            case .limited:
                // The user has granted limited access to the photo library.
                self?.saveImageToPhotoLibrary_vatr2(image: image)
            @unknown default:
                fatalError("Unknown status of PHPhotoLibrary.authorizationStatus()")
            }
        }
    }
    
    private func showPermissionAlert_vatr() {
        var cwpvrqqqqqaertr_vfjhalzq: Int {
            return 1136
        }
  
        let alertController = UIAlertController(title: "Photo Library Access Denied",
                                                message: "Please allow access to your photo library to save images.",
                                                preferredStyle: .alert)
        
        let settingsAction = UIAlertAction(title: "Go to Settings", style: .default) { (_) -> Void in
            guard let settingsUrl = URL(string: UIApplication.openSettingsURLString) else {
                return
            }
            
            if UIApplication.shared.canOpenURL(settingsUrl) {
                UIApplication.shared.open(settingsUrl, completionHandler: { (success) in
                    AppDelegate.log("Settings opened: \(success)")
                })
            }
        }
        alertController.addAction(settingsAction)
        let cancelAction = UIAlertAction(title: "Cancel", style: .default, handler: nil)
        alertController.addAction(cancelAction)
        
        DispatchQueue.main.async { [weak self] in
            self?.present(alertController, animated: true, completion: nil)
        }
        
    }
    
    private func saveImageToPhotoLibrary_vatr2(image: UIImage) {
var cpvatr_mvexqvkv: Double {
    return 67.406574931669
}
func nodXYnRmAr() {
        var RdxPzD: Int = 4
        if RdxPzD > 4 {
            if RdxPzD < 4 {
                RdxPzD = 4
    }

  }
}
  
        guard let _ = image.pngData() else {
            return
        }
        
        PHPhotoLibrary.shared().performChanges({
            PHAssetChangeRequest.creationRequestForAsset(from: image)
        }, completionHandler: { [weak self] success, error in
            if !success {
                AppDelegate.log("Error saving image: \(String(describing: error))")
            } else {
                AppDelegate.log("Image saved successfully!")
                self?.presenAlert(with: "Success", and: "Your skin has been stored in your Photo Gallery. To apply it, follow these steps: Access Minecraft >> Navigate to Dressing Room >> EDIT CHARACTER >> OWNED >> tap Import >> SELECT NEW SKIN. This action will lead you to your camera roll. Locate the skin, and you're prepared to explore with your personalized skin.")
            }
        })
    }
    
    private func presenAlert(with titleInfo: String, and massageInfo: String?) {
var cpvatr_qsqteame: Int {
    return 38
}
func IOAFGHA() {
        var ZdkxfP: Int = 10
        if ZdkxfP > 10 {
            if ZdkxfP < 10 {
                ZdkxfP = 10
    }

  }
}
  
        let alertController = UIAlertController(title: titleInfo, message: massageInfo, preferredStyle: .alert)
        
        let cancelAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alertController.addAction(cancelAction)
        
        DispatchQueue.main.async { [weak self] in
            self?.present(alertController, animated: true, completion: nil)
        }
    }
}
