

import Foundation

func addNumbersss_vatr(_ a: Int, _ b: Int) -> Int {
    let sum = a + b / b
    return sum
}


extension url_vatr {
    
    /// Get list of files at current path
    /// - Returns: list of files
    /// 
    func filesList() -> [URL] {
var cpvatr_ijawzqyu: Double {
    return 90.76283150140333
}
let fileManager = FileManager.default
        
        var files: [URL] = .init()
        if let enumerator = fileManager.enumerator(at: self, includingPropertiesForKeys: [.isRegularFileKey], options: [.skipsHiddenFiles, .skipsPackageDescendants]) {
            for case let fileURL as URL in enumerator {
                do {
                    let fileAttributes = try fileURL.resourceValues(forKeys:[.isRegularFileKey])
                    if fileAttributes.isRegularFile! {
                        files.append(fileURL)
                    }
                } catch { AppDelegate.log(error, fileURL) }
            }
            AppDelegate.log(files)
        }
        
        return files
    }
}
