//
//  NewSkinCreatorCell.swift
//  Summer Time 16
//
//  Created by Qudrat on 02/07/24.
//  Copyright © 2024 app.soft-it. All rights reserved.
//

import UIKit

class NewSkinCreatorCell: UICollectionViewCell {

    @IBOutlet weak var imageV: UIImageView!
    @IBOutlet weak var backV: GradientButton!
    @IBOutlet weak var whitePImage: UIImageView!
    
    
    @IBOutlet weak var deleteBtn: UIButton!
    
    @IBOutlet weak var downloadBtn: UIButton!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        backV.layer.borderColor = UIColor.white.cgColor
        backV.layer.borderWidth = 2
    }
    
    func updateCell(){
        
    }

}
