//
//  BtnCollectionCell.swift
//  Summer Time 16
//
//  Created by Qudrat on 06/07/24.
//  Copyright © 2024 app.soft-it. All rights reserved.
//

import UIKit

struct ButtonsType {
    var text: String
    var isSelect: Bool
    var isLock: Bool
}




class BtnCollectionCell: UICollectionViewCell {

    @IBOutlet weak var backV: UIView!
    
    @IBOutlet weak var textLbl: UILabel!
    
    @IBOutlet weak var lockImageV: UIImageView!
    
    @IBOutlet weak var blurView: UIVisualEffectView!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func updateCell(item: ButtonsType){
        
        textLbl.text = item.text
        if item.isSelect {
            backV.backgroundColor = #colorLiteral(red: 0.05445761979, green: 0.254989326, blue: 0.9257465005, alpha: 1)
            backV.layer.borderColor = UIColor.white.cgColor
            backV.layer.borderWidth = 3/2
            lockImageV.isHidden = true
            blurView.isHidden = true
        }else if item.isLock {
            backV.backgroundColor = #colorLiteral(red: 0.05445761979, green: 0.254989326, blue: 0.9257465005, alpha: 1)
            lockImageV.isHidden = false
            blurView.isHidden = false
            backV.layer.borderWidth = 0
        }else {
            lockImageV.isHidden = true
            blurView.isHidden = true
            backV.backgroundColor = #colorLiteral(red: 0.04367058724, green: 0.346618861, blue: 0.9321888089, alpha: 1)
            backV.layer.borderWidth = 0
        }
    }

}
