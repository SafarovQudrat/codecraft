//
//  BackView.swift
//  Summer Time 16
//
//  Created by Diyorbek Xikmatullayev on 25/06/24.
//  Copyright © 2024 app.soft-it. All rights reserved.
//

import Foundation
import UIKit

class BackView_did {
    
    static func SetupBackView(view: UIView) {
        
        let patnis: UIView = {
           let view = UIView()
//            view.backgroundColor = .clear
            return view
        }()
        
        let imageView: UIImageView = {
           let view = UIImageView()
            view.translatesAutoresizingMaskIntoConstraints = false
            view.contentMode = .scaleAspectFill
            
            return view
        }()
        imageView.image = UIImage(named: "backImg")
        Gradient.setupGradient(view: view)
//        Gradient.setupGradient(view: patnis)
//        view.addSubview(patnis)
        view.addSubview(imageView)
        
        NSLayoutConstraint.activate([
            
//            patnis.topAnchor.constraint(equalTo: view.topAnchor),
//                        patnis.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//                        patnis.trailingAnchor.constraint(equalTo: view.trailingAnchor),
//                        patnis.bottomAnchor.constraint(equalTo: view.bottomAnchor),
//            
            imageView.topAnchor.constraint(equalTo: view.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}
