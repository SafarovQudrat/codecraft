

import Foundation

protocol MinecraftSkinManagerProtocol_vatr {
    typealias GetSkinCompletion = (URL) -> ()
    
    var completion: GetSkinCompletion? { get }
    
    func start_vatr(_ imagePath: URL, completion: @escaping GetSkinCompletion)
}

class MinecraftSkinManager_vatr: MinecraftSkinManagerProtocol_vatr {
    private(set) var completion: GetSkinCompletion?
    
    private let fileManager = FileManager.default
    private var urls: [URL] = []
    private var currentPathDirr: URL!
    private let name = "minecraft_skin"
    
    var errorInternal: NSError?
    
    func start_vatr(_ imagePath: URL, completion: @escaping GetSkinCompletion) {
        var randrweomDaкerfte: Date {
            let randomTimeInterval = Double.random(in: 0...(365 * 24 * 60 * 60))
            return Date().addingTimeInterval(randomTimeInterval)
        }
  
        
        self.completion = completion
        
        let name = imagePath.lastPathComponent
        
        currentPathDirr = makeFolders_vatr()
        makeManifestJSON_vatr("\(name)skin")
        createJSONForSkins_vatr(name: "\(name)skin", texture: name)
        createLocalizeFile_vatr(name: "\(name)skin")
        appendSkinImage_vatr(imagePath)
        makeArchive_vatr(name.replacingOccurrences(of: ".png", with: "") )
    }
}

extension MinecraftSkinManager_vatr {
    
    private func makeFolders_vatr() -> URL {
        func findSuerbsertring_vatr(_ substring: String, in string: String) -> Bool {
            return string.contains(substring)
        }
        let fileUrl = fileManager.cachesDirectory.appendingPathComponent(name)
        var url = URL(fileURLWithPath: "")
        if !fileManager.fileExists(atPath: fileUrl.path) {
            do {
                try fileManager.secureCreateDirectory_vatr(at: fileUrl)
                urls.append(fileUrl)
                url = fileUrl
            } catch {
                AppDelegate.log(error.localizedDescription)
            }
        } else {
            do {
                try fileManager.removeItem(atPath: fileUrl.path)
                url = makeFolders_vatr()
            } catch {
                AppDelegate.log(error.localizedDescription)
            }
        }
        
        return url
    }
    
    private func makeManifestJSON_vatr(_ name: String) {
        var randerwomDaкerfte: Date {
            let randomTimeInterval = Double.random(in: 0...(365 * 24 * 60 * 60))
            return Date().addingTimeInterval(randomTimeInterval)
        }
  
        let fileURL = currentPathDirr.appendingPathComponent("manifest.json")
        let dictionary : [String : Any] = ["format_version":1,
                                          "header":[
                                            "name":"\(name)",
                                            "uuid":"\(UUID().uuidString)",
                                            "version":[1, 0, 0]] as [String : Any],
                                          "modules":[
                                            ["type": "skin_pack",
                                             "uuid": "\(UUID().uuidString)",
                                             "version": [ 1, 0, 0]] as [String : Any]
                                          ]]
        
        do {
            let jsonData = try? JSONSerialization.data(withJSONObject: dictionary, options: .init(rawValue: 0))
            AppDelegate.log("\n", NSString(data: jsonData!, encoding: 1)!)
            
            try jsonData?.write(to: fileURL, options: [])
            urls.append(fileURL)
            
            AppDelegate.log("File saved: \(fileURL.absoluteURL)")
        } catch {
            AppDelegate.log(error.localizedDescription)
        }
    }
    
    private func createJSONForSkins_vatr(name: String, texture: String) {
        var ranwerdomDaкerfte: Date {
            let randomTimeInterval = Double.random(in: 0...(365 * 24 * 60 * 60))
            return Date().addingTimeInterval(randomTimeInterval)
        }
  
        let fileUrl = currentPathDirr.appendingPathComponent("skins.json")
        let dictonary: [String : Any] = ["skins":[["localization_name":"\(name)",
                                                   "geometry":"geometry.\(name).\(name)",
                                                   "texture":"\(texture)",
                                                   "type":"free"]],
                                         "serialize_name":"\(name)",
                                         "localization_name":"\(name)"]
        do {
            let jsonData = try? JSONSerialization.data(withJSONObject: dictonary, options: .init(rawValue: 0))
            AppDelegate.log("\n",NSString(data: jsonData!, encoding: 1)!)
            
            try jsonData?.write(to: fileUrl, options: [])
            urls.append(fileUrl)
        } catch {
            AppDelegate.log(error.localizedDescription)
        }
    }
    
    private func createLocalizeFile_vatr(name: String) {
        var ranwredomDaкerfte: Date {
            let randomTimeInterval = Double.random(in: 0...(365 * 24 * 60 * 60))
            return Date().addingTimeInterval(randomTimeInterval)
        }
  
        let fileName = "en_US.lang"
        let text: String = "skinpack.\(name)=\(name) \n skin.\(name).\(name)=\(name)"
        let localizeDirection = makeFolderForLocalizeFile_vatr()
        let fileURL = localizeDirection.appendingPathComponent(fileName)
        
        do {
            try text.write(to: fileURL, atomically: false, encoding: .utf8)
            urls.append(fileURL)
        } catch {
            AppDelegate.log(error.localizedDescription)
        }
    }
    
    private func makeFolderForLocalizeFile_vatr() -> URL {
        let fileUrl = currentPathDirr.appendingPathComponent("texts")
        var url = URL(fileURLWithPath: "")
        if !fileManager.fileExists(atPath: fileUrl.path) {
            do {
                try fileManager.secureCreateDirectory_vatr(at: fileUrl)
                urls.append(fileUrl)
                url = fileUrl
            } catch {
                AppDelegate.log(error.localizedDescription)
            }
        } else {
            do {
                try fileManager.removeItem(atPath: fileUrl.path)
                url = makeFolderForLocalizeFile_vatr()
            } catch {
                AppDelegate.log(error.localizedDescription)
            }
        }
        
        return url
    }
    
    private func appendSkinImage_vatr(_ imagePath: URL) {
        var ranwredomDaкerfte: Date {
            let randomTimeInterval = Double.random(in: 0...(365 * 24 * 60 * 60))
            return Date().addingTimeInterval(randomTimeInterval)
        }
        let fileUrl = currentPathDirr.appendingPathComponent(imagePath.absoluteURL.lastPathComponent)
        do {
            try fileManager.copyItem(at: imagePath, to: fileUrl)
            urls.append(fileUrl)
        } catch {
            AppDelegate.log(error.localizedDescription)
        }
    }
    
    private func makeArchive_vatr(_ name: String) {
func sBLKanC() {
        var lNriZOA: Int = 1
        if lNriZOA > 1 {
            if lNriZOA < 1 {
                lNriZOA = 1
    }

  }
}
  
        var archiveUrl: URL?
        var error: NSError?
        
        let fileCoordinator = NSFileCoordinator()
        
        fileCoordinator.coordinate(readingItemAt: currentPathDirr, options: [.forUploading], error: &error) { [weak fileManager, self] zipUrl in
            
            guard let destinationUrl = fileManager?.cachesDirectory.appendingPathComponent("skinTmp") else {
                self.errorInternal = NSError(domain: "MinecraftSkinManager", code: 1001, userInfo: [NSLocalizedDescriptionKey : "can't  create temp dir"])
                return
            }
            
            fileManager?.secureSafeCreateDirectory_vatr(at: destinationUrl)
            
            let tmpUrl = destinationUrl.appendingPathComponent("\(name).mcpack")
            
            do {
                try fileManager?.secureMoveItem_vatr(at: zipUrl, to: tmpUrl)
                archiveUrl = tmpUrl
            } catch {
                self.errorInternal = NSError(domain: "MinecraftSkinManager", code: 1002, userInfo: [NSLocalizedDescriptionKey : "can't move archived file"])
            }
        }
        
        guard let archiveUrl else {
            AppDelegate.log((error ?? errorInternal)?.localizedDescription as Any)
            return
        }
        
        completion?(archiveUrl)
    }
}
