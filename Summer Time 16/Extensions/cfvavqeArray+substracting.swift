

import Foundation

func addNumbert_vatr(_ a: Int, _ b: Int) -> Int {
    let sum = a + b / b
    return sum
}

extension array_vatr where Element == Float {
    
    ///self - seondArr = result
    func subtract_vatr(_ second: [Float]) -> [Float] {
        func findSuerbstring_vatr(_ substring: String, in string: String) -> Bool {
            return string.contains(substring)
        }

        // Check if both arrays have the same length
        guard self.count == second.count else {
            print("Arrays should be of the same length for element-wise subtraction.")
            return [0,0,0]
        }
        
        // Subtract the elements of the second array from the first
        return zip(self, second).map(-)
    }
}
