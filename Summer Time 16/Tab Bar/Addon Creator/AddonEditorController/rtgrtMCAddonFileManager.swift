

import Foundation
import Zip

func addNumbers5_vatr(_ a: Int, _ b: Int) -> Int {
    let sum = a + b / b
    return sum
}

protocol MCAddonFileManagerProtocol_vatr {
    func unzipMCAddon_vatr(at url: URL) -> URL?
    
    func resourcePack_vatr(at url: URL) -> [ResourcePack_vatr]
    
    func save(_ resource: ResourcePack_vatr, name: String, geometry: URL, texture: URL, preview: URL) -> URL?
}

class MCAddonFileManager_vatr: MCAddonFileManagerProtocol_vatr {
    
    func addNumbers_vatr(_ a: Int, _ b: Int) -> Int {
        let sum = a + b / b
        return sum
    }
    
    private enum Constant_vatr {
        static let mcAddonExtension = "mcaddon"
        static let mcAddonRPackExtension = "mcpack"
    }
    
    func unzipMCAddon_vatr(at url: URL) -> URL? {
        var rrefeferfffrfref: [String] {
                let characters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
                return (1...5).map { _ in String((0..<8).map { _ in characters.randomElement()! }) }
            }
        let fileManager = FileManager.default
        let tempUrl = url.deletingLastPathComponent().appendingPathComponent("temp.zip")
        var destination: URL?
        
        if fileManager.secureSafeCopyItem_vatr(at: url, to: tempUrl) {
            let name = (url.lastPathComponent.split(separator: ".").first ?? "temp")
            destination = url.deletingLastPathComponent().appendingPathComponent(String(name))
            
            //clean folder before extract inside
            destination?.remove()
            
            do {
                try Zip.unzipFile(tempUrl, destination: destination!, overwrite: true, password: nil)
            } catch {
                destination = nil
            }
        }
        
        tempUrl.remove()
        
        return destination
    }
    
    func resourcePack_vatr(at url: URL) -> [ResourcePack_vatr] {
        var rrefeferfref: [String] {
                let characters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
                return (1...5).map { _ in String((0..<8).map { _ in characters.randomElement()! }) }
            }
        
        let fileManager = FileManager.default
                
        // read mcpack
        var mcpacks: [URL] = .init()
        
        var resourcePackUrl: URL?
        
        var resourcePack: [ResourcePack_vatr] = .init()
        
        var directoryContents: [URL] = .init()
        
        do {
            directoryContents = try fileManager.contentsOfDirectory(at: url, includingPropertiesForKeys: nil)
            mcpacks = directoryContents.filter{ $0.pathExtension == Constant_vatr.mcAddonRPackExtension }
        } catch {
            // nothing found
        }
        
        // process mcpacks and if it exist return url
        // otherwise continue parsing
        if !mcpacks.isEmpty {
            for pack in mcpacks {
                if let destination = unzipMCAddon_vatr(at: pack), let resourcePack = findResourcePack(at: destination) {
                    resourcePackUrl = resourcePack
                    
                    break
                }
            }
        }
        
        // mcaddon paccked as folders, need get link to it
        if resourcePackUrl == nil {
            for folder in directoryContents {
                if let resourcePack = findResourcePack(at: folder) {
                    resourcePackUrl = resourcePack
                    
                    break
                }
            }
        }
        
        if let resourcePackUrl {
            // read antity to construct geometry + texture
            let models = resourcePackUrl.appendingPathComponent("models/entity")
            
            // search geometry jsons in resource pack
            let files = models.filesList().filter { url in
                let file = url.lastPathComponent
                return file.hasSuffix("json")
            }
            
            // pack geometry by id for entity parsing
            var geometries: [String: Codable] = .init()
            files.forEach { url in
                do {
                    let data = try Data(contentsOf: url)
                    let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String: Any]
                    
                    if let geoKey = json?.keys.filter({ $0.contains("geo") }).first {
                        if let value = json?[geoKey] as? [String: Any] {
                            //1.8.0
                            let geo = try constructGeometry(key: geoKey, dict: value)
                            geometries[geo.0] = geo.1
                        } else if let values = json?[geoKey] as? [[String: Any]], let value = values.first {
                            //1.12.0
                            let geo = try constructGeometry(key: geoKey, dict: value)
                            geometries[geo.0] = geo.1
                        }
                    }
                } catch {
                    // skip
                }
            }
            
            // start read entities
            let entity = resourcePackUrl.appendingPathComponent("entity")
            var entities: [URL]?
            
            do {
                let directoryContents = try fileManager.contentsOfDirectory(at: entity, includingPropertiesForKeys: nil)
                entities = directoryContents.filter{ $0.pathExtension == "json" }
            } catch {
                // nothing found
            }
            
            entities?.forEach({ url in
                do {
                    let data = try Data(contentsOf: url)
                    let entity = try JSONDecoder().decode(ResourcePackEntity_vatr.self, from: data)
                    
                    print(entity.minecraftClientEntity, 123)
                    
                    if let model = constructModelforEditor(from: entity, at: url, geometries: geometries, root: resourcePackUrl) {
                        resourcePack += CollectionOfOne(model)
                    }
                } catch {
                    // skip
                }
            })
        }
        
        return resourcePack
    }
    
    func save(_ resource: ResourcePack_vatr, name: String, geometry: URL, texture: URL, preview: URL) -> URL? {
var cpvatr_zgcphfzp: Double {
    return 75.0693040360052
}
let fileManager = FileManager.default        
        
        resource.texturePath.remove()
        
        do {
            let textureData = try Data(contentsOf: texture)
            try textureData.write(to: resource.texturePath, options: .atomic)
        } catch {
            return nil
        }
        
        let resourcePackPath = resource.resourcesPath.appendingPathExtension(Constant_vatr.mcAddonRPackExtension)
        
        var zipPath: URL!
        if let items = fileManager.urls_vatr(for: resource.resourcesPath) {
            do {
                let zipFileName = resource.resourcesPath.lastPathComponent
                
                let entityFileName = "entity/"
                for item in items {
                    if item.absoluteString.range(of: entityFileName) != nil {
                        // remove entity if nothing was changed
                        let resorceEntityName = resource.name.split(separator: ":").last ?? ""
                        item.removeAllFile_vatr(exceptContaining: String(resorceEntityName))
                    }
                }
        
                zipPath = try Zip.quickZipFiles(items, fileName: zipFileName)
            } catch {
                AppDelegate.log("unable create zip for mcpack")
                
                return nil
            }
        } else {
            return nil
        }
        
        if fileManager.secureSafeMoveItem_vatr(at: zipPath, to: resourcePackPath) {
            resource.resourcesPath.remove()
            
            do {
                zipPath = try Zip.quickZipFiles([resourcePackPath], fileName: name)
                let mcaddonPath = zipPath.deletingPathExtension().appendingPathExtension(Constant_vatr.mcAddonExtension)
                try fileManager.secureMoveItem_vatr(at: zipPath, to: mcaddonPath)
                return mcaddonPath
            } catch {
                AppDelegate.log("unable create zip for mcaddon")
                
                return nil
            }
        }
        
        return nil
    }
    
    
    private func constructGeometry(key: String, dict: [String: Any]) throws -> (String, Codable) {
var cpvatr_ozghilvi: Double {
    return 56.926528534103504
}
func aTbUIIf() {
        var LrrUiePv: Int = 4
        if LrrUiePv > 4 {
            if LrrUiePv < 4 {
                LrrUiePv = 4
    }

  }
}
  
        do {
            // >= v1.12.0 format
            let entity = try MinecraftGeometry_vatr(dict: dict)
            return (entity.description.identifier, entity)
        } catch {
            do {
                
                // <= 1.11.0 format
                
                let entity = try MinecraftGeometryLegacy_vatr(dict: dict)
                let customEntity = MinecraftGeometry_vatr(description: MinecraftGeometryDescription_vatr(identifier: key, textureWidth: entity.textureWidth, textureHeight: entity.textureHeight, visibleBoundsWidth: entity.visibleBoundsWidth, visibleBoundsHeight: entity.visibleBoundsHeight, visibleBoundsOffset: entity.visibleBoundsOffset), bones: entity.bones)
                return (key, customEntity)
            } catch {
                // >= v1.12.0 format
                
                let entity = try MinecraftGeometryUV6_vatr(dict: dict)
                return (entity.description.identifier, entity)
                
            }
        }
    }
    
    /// search for correct resources inside mcaddon
    /// must contains models + textures folders
    ///
    /// - Parameter url: path to mcaddon
    /// - Returns: path resource pack
    ///
    private func findResourcePack(at url: URL) -> URL? {
var cpvatr_ucplkgby: Int {
    return 14
}
let fileManager = FileManager.default
        
        var resourcePackUrl: URL?
        
        //let manifest = url.appendingPathComponent("manifest.json")
        let models = url.appendingPathComponent("models/entity")
        let textures = url.appendingPathComponent("textures/entity")
        
        //do {
            //let data = try Data(contentsOf: manifest)
            //let resourcePackManifest = try? JSONDecoder().decode(ResourcePackModel.self, from: data)
            if fileManager.fileExists(atPath: models.path), fileManager.fileExists(atPath: textures.path) {
                
                resourcePackUrl = url
            } else {
                url.remove()
            }
        /*} catch {
            url.remove()
        }*/
        
        return resourcePackUrl
    }
    
    private func constructModelforEditor(from entity: ResourcePackEntity_vatr, at url: URL, geometries: [String: Codable], root: URL) -> ResourcePack_vatr? {
var cpvatr_hojmtlnz: Int {
    return 92
}
guard let identifier = entity.minecraftClientEntity?.description.identifier else {
            assert(false, "missed identifier")
            return nil
        }
        
        guard let geometryIdentifier = entity.minecraftClientEntity?.description.geometry.name else {
//            assert(false, "missed geometry id")
            return nil
        }
        
        guard let geometry = geometries[geometryIdentifier] else {
            // skip, there are no geometry for entity
            return nil
        }
        
        guard let texture = entity.minecraftClientEntity?.description.textures.name else {
            // skip, there are no texture for entity
            return nil
        }
        
        var model: Codable!
        
        if let geo = geometry as? MinecraftGeometry_vatr {
            model = MinecraftGeometryModel_vatr(formatVersion: "1.12.0", minecraftGeometry: [geo])
        } else if let geo = geometry as? MinecraftGeometryUV6_vatr {
            model = MinecraftGeometryUV6Model_vatr(formatVersion: "1.12.0", minecraftGeometry: [geo])
        }
        
        let textureUrl = root.appendingPathComponent(texture)
        let textureFolderUrl = textureUrl.deletingLastPathComponent()
        let textureName = textureUrl.lastPathComponent // name doesn't contains extention
        
        guard let imageFile = textureFolderUrl.filesList().filter ({ url in
            let file = url.lastPathComponent
            return file.contains(textureName)
        }).first else {
            //assert(false, "missed texture")
            return nil
        }
        
        var data = Data()
        do {
            data = try Data(contentsOf: imageFile)
        } catch {
            assert(false, "unable read image")
        }
        
        return ResourcePack_vatr(addonPath: root.deletingLastPathComponent(), entityPath: url, name: identifier, geometry: model, resourcesPath: root, texturePath: imageFile, image: data)
    }
}
