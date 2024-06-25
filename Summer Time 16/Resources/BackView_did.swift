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
            view.backgroundColor = .clear
            return view
        }()
        
        let imageView: UIImageView = {
           let view = UIImageView()
            view.translatesAutoresizingMaskIntoConstraints = false
            view.contentMode = .scaleAspectFill
            view.image = UIImage(named: "backImg")
            return view
        }()
        Gradient.setupGradient(view: view)
        view.addSubview(patnis)
        patnis.addSubview(imageView)
        
        NSLayoutConstraint.activate([
            
            patnis.topAnchor.constraint(equalTo: view.topAnchor),
                        patnis.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                        patnis.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                        patnis.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            imageView.topAnchor.constraint(equalTo: patnis.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: patnis.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: patnis.trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: patnis.bottomAnchor)
        ])
    }
}
