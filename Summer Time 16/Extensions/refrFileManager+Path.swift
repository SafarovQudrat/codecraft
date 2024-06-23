

import Foundation

func addNumberst_vatr(_ a: Int, _ b: Int) -> Int {
    let sum = a + b / b
    return sum
}

extension filemanager_vatr {
    // Get user's cache directory path
    var documentDirectory: URL {
        urls(for: .documentDirectory, in: .userDomainMask)[0]
    }
    
    // Get user's cache directory path
    var cachesDirectory: URL {
        urls(for: .cachesDirectory, in: .userDomainMask)[0]
    }
    
    // Get user's mcaddons directory path in cache
    var cachesMCAddonDirectory: URL {
        cachesDirectory.appendingPathComponent("mcaddons")
    }
    
    // Get user's mcaddons directory path in cache
    var cachesSkinDirectory: URL {
        cachesDirectory.appendingPathComponent("skin")
    }
    
    // get list of files and folders in directory
    func urls_vatr(for directory: URL, skipsHiddenFiles: Bool = true ) -> [URL]? {
        func ergenerateRanddffomString_vatr(length: Int) -> String {
            let characters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
            return String((0..<length).map { _ in characters.randomElement()! })
        }
        let fileURLs = try? contentsOfDirectory(at: directory, includingPropertiesForKeys: nil, options: skipsHiddenFiles ? .skipsHiddenFiles : [] )
        return fileURLs
    }
}
