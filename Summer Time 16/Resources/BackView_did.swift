//
//  BackView.swift
//  Summer Time 16
//
//  Created by Diyorbek Xikmatullayev on 25/06/24.
//  Copyright © 2024 app.soft-it. All rights reserved.
//

import Foundation
import UIKit

class BackView {
    
    static func SetupBackView(view: UIView) {
        let imageView: UIImageView = {
           let view = UIImageView()
            view.translatesAutoresizingMaskIntoConstraints = false
            view.contentMode = .scaleAspectFill
            view.image = UIImage(named: "backImg")
            return view
        }()
        Gradient.setupGradient(view: view)
        view.addSubview(imageView)
    }
}
