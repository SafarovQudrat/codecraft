
protocol ColorAble_vatr: AnyObject {
    func updateCollection_vatr()
}


import UIKit
import Foundation


class ColorsManger_vatr {
    
//    .black (.init(red: 0, green: 0, blue: 0, alpha: 1)
//    .white (.init(red: 1, green: 1, blue: 1, alpha: 1)
//    .red,
//    .green,
//    .yellow,
//    .blue,
//    .cyan,
//    .purple


    private let defaultColorArray = [
        UIColor(red: 0, green: 0, blue: 0, alpha: 1),
        UIColor(.white),
        UIColor(.red),
        UIColor(.green),
        UIColor(.yellow),
        UIColor(.blue),
        UIColor(.cyan),
        UIColor(.purple)
//        UIColor(red: 0.953, green: 0.478, blue: 0.478, alpha: 1),
//        UIColor(red: 0.764, green: 0.461, blue: 0.938, alpha: 1),
//        UIColor(red: 0.612, green: 0.388, blue: 0.741, alpha: 1),
//        UIColor(red: 0.263, green: 0.494, blue: 0.706, alpha: 1),
//        UIColor(red: 0.345, green: 0.725, blue: 0.616, alpha: 1),
        
    ]
    private var colorsArr = [UIColor]()
    weak var delegate: ColorAble_vatr?
    var selectedColorIndex = 0
    
    var maxColors = 9
    
    init() {
        self.colorsArr = getColorsFromUserDefaults_vatr()
    }

    func getColors_vatr() -> [UIColor] {

return colorsArr
    }
    
    func updateColorsArr_vatr(with color: UIColor) {


  

        if !colorsArr.contains(color) && color != .clear && color.alpha != 0 {

            if colorsArr.count == maxColors {
                colorsArr.removeLast()
            }

            colorsArr.insert(color, at: 0)
            saveColorsToUserDefaults_vatr(colors: colorsArr)
            delegate?.updateCollection_vatr()
        }

    }
    
    func addNewColor(_ color: UIColor) {


  
        if  color != .clear && color.alpha != 0 {

            if colorsArr.count == maxColors {
                colorsArr.removeLast()
            }

            colorsArr.insert(color, at: 0)
            saveColorsToUserDefaults_vatr(colors: colorsArr)
            delegate?.updateCollection_vatr()
        }
    }
    
    func getColor_vatr2(by index: Int ) -> UIColor {

var colorToReturn = UIColor()
        
        if index <= colorsArr.count - 1 {
            colorToReturn = colorsArr[index]

        } else {
            colorToReturn = .black
        }
        
        return colorToReturn
    }
    
    func isSelctedColor_vatr(index: Int ) -> Bool {

if index == selectedColorIndex {
            return true
        } else {
            return false
        }
    }
    
    //MARK: UIColor -> UserDefaults
    
    // Save array of colors to UserDefaults
    private func saveColorsToUserDefaults_vatr(colors: [UIColor]) {
  
        let colorDataArray = colors.compactMap { $0.encode_vatr() }
        UserDefaults.standard.set(colorDataArray, forKey: "SavedColors")
    }
    
    //MARK: UserDefaults -> UIColor

    // Retrieve array of colors from UserDefaults
    private func getColorsFromUserDefaults_vatr() -> [UIColor] {

if let colorDataArray = UserDefaults.standard.array(forKey: "SavedColors") as? [Data] {
            return colorDataArray.compactMap { UIColor.decode(from: $0) }
        }
        return defaultColorArray
    }
    
    
}
