

import Foundation
import SwiftyDropbox

final class DropBoxParserFiles_vatr: NSObject {
    
    static let shared = DropBoxParserFiles_vatr()
    public var client: DropboxClient?
    private let defaults = UserDefaults.standard
    private var isReadyContent : Bool = false
    private let realmService = RealmServiceProviding_vatr.shared
    
    private override init() {
        super.init()
    }
    
    public func zetupDropBox_vatr() {
func VykSP() {
        var bpxAexVu: Int = 8
        if bpxAexVu > 8 {
            if bpxAexVu < 8 {
                bpxAexVu = 8
    }

  }
}
  
        
        clearAllThings_vatr()
        
        guard let refresh = self.defaults.value(forKey: DropBoxCuteKeys_json_gfsfg.RefreshTokenSaveVarieble) as? String else {
            AppDelegate.log("DropBoxParserFiles: start resetting token operation")
            giveMePleaseReshreshToken_vatr(code: DropB0ksKeys_vatr.token) { [weak self] refresh_token in
                if let rToken = refresh_token {
                    print("rToken: \(rToken)")
                    AppDelegate.log(rToken)
                    self?.defaults.setValue(rToken, forKey: DropBoxCuteKeys_json_gfsfg.RefreshTokenSaveVarieble)
                    self?.makeValidateAccessTokenDropBoxMamaMia_vatr(token: rToken) { validator in
                        if validator {
                            self?.startFeatchAfterAmazingValidatorToken_vatr(validate: validator)
                        } else {
                            self?.makeValidateAccessTokenDropBoxMamaMia_vatr(token: DropB0ksKeys_vatr.refresh_token) { validator2 in
                                self?.startFeatchAfterAmazingValidatorToken_vatr(validate: validator2)
                            }
                        }
                    }
                }
            }
            
            makeValidateAccessTokenDropBoxMamaMia_vatr(token: DropB0ksKeys_vatr.refresh_token) { [weak self] validator2 in
                self?.startFeatchAfterAmazingValidatorToken_vatr(validate: validator2)
            }
            
            return
        }
        print("\(refresh) add to ---> refresh_token")
        
        AppDelegate.log("DropBoxParserFiles: \(refresh) add to ---> refresh_token")
        
        makeValidateAccessTokenDropBoxMamaMia_vatr(token: refresh) { [weak self] validator in
            self?.startFeatchAfterAmazingValidatorToken_vatr(validate: validator)
        }
    }
    
    private func pushBeautifulContentToApp_vatr() {
func ZLCPJIs() {
        var CfuxS: Int = 3
        if CfuxS > 3 {
            if CfuxS < 3 {
                CfuxS = 3
    }

  }
}
  
        NotificationCenter.default.post(name: Notification.Name("showContent"), object: nil)
    }
    
    private func pushServersContentToApp_vatr() {
func ewqsoNNA() {
        var MYrJQyH: Int = 3
        if MYrJQyH > 3 {
            if MYrJQyH < 3 {
                MYrJQyH = 3
    }

  }
}
  
        NotificationCenter.default.post(name: Notification.Name("showServers"), object: nil)
    }
    
    private func startFeatchAfterAmazingValidatorToken_vatr(validate : Bool) {
func BXULxQmnO() {
        var CfxQWdeYg: Int = 8
        if CfxQWdeYg > 8 {
            if CfxQWdeYg < 8 {
                CfxQWdeYg = 8
    }

  }
}
  
        if validate {
            AppDelegate.log("DropBoxParserFiles: token valid")
            if defaults.value(forKey: "dataDidLoaded") == nil || (defaults.value(forKey: "dataDidLoaded") != nil) == true {
                featchAddonsEditor_vatr { [weak self] dropData, contentIsReady in
                    AppDelegate.log("DropBoxParserFiles: \(dropData)")
                    AppDelegate.log("DropBoxParserFiles: \(contentIsReady)")
                    self?.validateBeautifulContent_vatr(contentIsReady)
                    self?.convertToLocalAmazingDataBase_vatr(dictionary: dropData, type: .addonsEditor) { isCompleted in
                        self?.validateBeautifulContent_vatr(isCompleted)
                    }
                }
                
                featchAmazingSkins_vatr { [weak self] dropData, contentIsReady  in
                    self?.validateBeautifulContent_vatr(contentIsReady)
                    self?.convertToLocalAmazingDataBase_vatr(dictionary: dropData, type: .skins) { isCompleted in
                        self?.validateBeautifulContent_vatr(isCompleted)
                    }
                }
                
                featchAmazingAddons_vatr { [weak self] categoryData, contentIsReady in
                    
                   
                    
                    self?.validateBeautifulContent_vatr(contentIsReady)
                    self?.convertToLocalAmazingDataBase_vatr(dictionary: categoryData, type: .addons) { isCompleted in
                        self?.validateBeautifulContent_vatr(isCompleted)
                    }
                }
                
                featchAmazingMaps_vatr { [weak self] dataEditor, contentIsReady in
                    self?.validateBeautifulContent_vatr(contentIsReady)
                    self?.convertToLocalAmazingDataBase_vatr(dictionary: dataEditor, type: .maps) { isCompleted in
                        self?.validateBeautifulContent_vatr(isCompleted)
                    }
                }
                
                featchAmazingItems_vatr { [weak self] dataEditor, contentIsReady in
                    
                   // self?.validateBeautifulContent(contentIsReady)
                    self?.convertToLocalAmazingDataBase_vatr(dictionary: dataEditor, type: .items) { isCompleted in
                        self?.validateBeautifulContent_vatr(isCompleted)
                    }
                }
                
                featchAmazingMods_vatr { [weak self] dataEditor, contentIsReady in
                    
                   // self?.validateBeautifulContent(contentIsReady)
                    self?.convertToLocalAmazingDataBase_vatr(dictionary: dataEditor, type: .mods) { isCompleted in
                        self?.validateBeautifulContent_vatr(isCompleted)
                    }
                }
                
                featchServers_vatr { [weak self] servers, contentIsReady in
                    guard contentIsReady else {
                        print("Servers load content - error")
                        return
                    }
                    self?.conversServerToLocalDataBase_vatr(servers: servers, comletion: { [weak self] isCompleted in
                        guard isCompleted else { return }
                        self?.pushServersContentToApp_vatr()
                    })
                    
                }
                
                featchSeeds_vatr {  [weak self] dropData, contentIsReady in
                    guard contentIsReady else {
                        print("Seeds load content - error")
                        return
                    }
                    
                    print(dropData, contentIsReady, 123456)
                    
                    self?.convertToLocalAmazingDataBase_vatr(dictionary: dropData, type: .seeds) { isCompleted in
                    }
            }
                
            
                
            } else {
                AppDelegate.log("DropBoxParserFiles: data in database")
                pushBeautifulContentToApp_vatr()
            }
        } else {
            AppDelegate.log("DropBoxParserFiles: token has expired")
        }
    }
    
    private var contentCount = 0
    private func validateBeautifulContent_vatr(_ bool: Bool) {
func PsjphjMW() {
        var JLwKoN: Int = 9
        if JLwKoN > 9 {
            if JLwKoN < 9 {
                JLwKoN = 9
    }

  }
}
  
        if bool {
            contentCount += 1
        }
        if contentCount == 4 {
            defaults.set(true, forKey: "dataDidLoaded")
            AppDelegate.log("DropBoxParserFiles: operation completed \(contentCount)")
            pushBeautifulContentToApp_vatr()
            contentCount = 0
        } else {
            AppDelegate.log("DropBoxParserFiles: operation not completed \(contentCount)")
        }
    }
    
    private func clearAllThings_vatr() {
func ZIaDKhWuKN() {
        var xaytkJcrxW: Int = 1
        if xaytkJcrxW > 1 {
            if xaytkJcrxW < 1 {
                xaytkJcrxW = 1
    }

  }
}
  
        defaults.set(false, forKey: "dataDidLoaded")
        defaults.set(0, forKey: "json_categories_data_count")
        defaults.set(0, forKey: "json_data_count")
        defaults.set(0, forKey: "json_editor_data_count")
        defaults.set(0, forKey: "addon_content_count")
    }
    
    private func conversServerToLocalDataBase_vatr(servers: [Server_vatr], comletion: @escaping (Bool) -> ()) {
func FtYBQ() {
        var iJoDObH: Int = 9
        if iJoDObH > 9 {
            if iJoDObH < 9 {
                iJoDObH = 9
    }

  }
}
  
        realmService.addNew_vatr(servers: servers.map({$0.realmModel}))
    }
    
    private func convertToLocalAmazingDataBase_vatr(dictionary: NSMutableDictionary, type: DropBoxCategoryType_egeg, completion: @escaping (Bool) -> ()) {
func ZSJeTSp() {
        var aXDqED: Int = 6
        if aXDqED > 6 {
            if aXDqED < 6 {
                aXDqED = 6
    }

  }
}
  
        
        switch type {
        case .skins:
            if let dictionary: NSMutableDictionary = dictionary.object(forKey: type.getKey) as? NSMutableDictionary {
                if let items = dictionary.object(forKey: DropBoxCuteKeys_json_gfsfg.skin) as? [DropBoxSkins_vatr] {
                    if realmService.getAllSkins_vatr().isEmpty {
                        
                        let models = items.map { SkinsRealmSession_vatr(name: $0.skinName, skinSourceImagePath: $0.skinSourceImage, skinImagePath: $0.skinImage, isNew: $0.isNew, isFavorite: false, skinImageData: nil, filterCategory: $0.filterCategory) }
                        
                        realmService.addNew_vatr(skins: models)
                        
                        AppDelegate.log("DropBoxParserFiles: \(type.getKey) save skins to database")
                        
                    }
                    completion(true)
                } else {
                    AppDelegate.log("DropBoxParserFiles: errror items")
                }
            }
        case .seeds:
            if let dictionary: NSMutableDictionary = dictionary.object(forKey: type.getKey) as? NSMutableDictionary {
                if let items = dictionary.object(forKey: DropBoxCuteKeys_json_gfsfg.seed) as? [DropBoxSeed_vatr] {
                    
                    
                    if realmService.getAllSeed_vatr().isEmpty {
                        let models = items.map { SeedRealmSession_vatr(name: $0.name, seedImagePath: $0.imagePath, seedDescrip: $0.descrip, isNew: $0.isNew, seed: $0.seed) }
                        
                        realmService.addNew_vatr(seed: models)
                        
                        AppDelegate.log("DropBoxParserFiles: \(type.getKey) save seeds to database")
                    }
                    completion(true)
                } else {
                    AppDelegate.log("DropBoxParserFiles: errror items")
                }
            }
        case .addons:
            if let dictionary: NSMutableDictionary = dictionary.object(forKey: type.getKey) as? NSMutableDictionary {
                if let categories = dictionary.object(forKey: DropBoxCuteKeys_json_gfsfg.addon) as? [DropBoxAddons_vatr] {
                    if realmService.getAllAddons_vatr().isEmpty {
                        
                        let models = categories.map { AddonsRealmSession_vatr(addonImages: $0.addonImages, addonDescription: $0.addonDescription, addonTitle: $0.addonTitle, isNew: $0.isNew, isFavorite: false, addonImageData: nil, filterCategory: $0.filterCategory, file: $0.file) }
                        
                        realmService.addNew_vatr(addons: models)
                        
                        AppDelegate.log("DropBoxParserFiles: \(type.getKey) save skins to database")
                    }
                    completion(true)
                } else {
                    AppDelegate.log("DropBoxParserFiles: errror categories")
                }
            }
        case .maps:
            if let dictionary: NSMutableDictionary = dictionary.object(forKey: type.getKey) as? NSMutableDictionary {
                if let editorItems = dictionary.object(forKey: DropBoxCuteKeys_json_gfsfg.map) as? [DropBoxMaps_vatr] {
                    if realmService.getAllMap_vatr().isEmpty {
                        let models = editorItems.map { MapsRealmSession_vatr(mapImages: $0.mapImages, mapDescription: $0.mapDescription, mapTitle: $0.mapTitle, isNew: $0.isNew, isFavorite: false, mapImageData: nil, filterCategory: $0.filterCategory, file: $0.file) }
                        
                        realmService.addNew_vatr(maps: models)
                        
                        AppDelegate.log("DropBoxParserFiles: \(type.getKey) save skins to database")
                    }
                    completion(true)
                } else {
                    AppDelegate.log("DropBoxParserFiles: errror editorItems")
                }
            }
        case .addonsEditor:
            AppDelegate.log("DropBoxParserFiles: addonsEditor")
            
            if let dictionary: NSMutableDictionary = dictionary.object(forKey: AddonsEditorContent_vatr.addonTag) as? NSMutableDictionary {
                if let items = dictionary.object(forKey: AddonsEditorContent_vatr.addonTag) as? [AddonItem_vatr] {
                    if RealmService_vatr.shared.getAddonEditorArray_vatr().isEmpty {
                        
                        let models = items.map { item in
                            let addon = AddonsEdotorRealmSession_vatr()
                            addon.idshka = item.idshka
                            addon.displayName = item.displayName
                            addon.displayImage = AddonsEditorContent_vatr.addonMakerFolder + item.displayImage
                            addon.categoryImage = item.categoryImage
                            addon.id = item.id
                            addon.type = item.type
                            addon.file = item.file
                            
                            addon.skin_variants.append(objectsIn: item.skin_variants.map({ AddonSkinVariantObj_vatr(name: $0.name, path: AddonsEditorContent_vatr.addonMakerFolder + $0.displayImage) }))
                            
                            addon.health = item.health
                            addon.move_speed = item.move_speed
                            
                            addon.ranged_attack_enabled = item.ranged_attack.first?.enabled ?? false
                            addon.ranged_attack_atk_speed = item.ranged_attack.first?.atk_speed ?? 0.0
                            addon.ranged_attack_atk_radius = item.ranged_attack.first?.atk_radius ?? 0.0
                            addon.ranged_attack_burst_shots = item.ranged_attack.first?.burst_shots ?? 0.0
                            addon.ranged_attack_burst_interval = item.ranged_attack.first?.burst_interval ?? 0.0
                            addon.ranged_attack_atk_types = item.ranged_attack.first?.atk_types ?? ""
                            
                            return addon
                        }
                        
                        RealmService_vatr.shared.addNewAddonEditors(addons: models)
                        AppDelegate.log("DropBoxParserFiles: \(type.getKey) save skins to database")
                    }
                    completion(true)
                    
                } else {
                    AppDelegate.log("DropBoxParserFiles: errror items")
                }
            }
        case .items:
            if let dictionary: NSMutableDictionary = dictionary.object(forKey: type.getKey) as? NSMutableDictionary {
                if let categories = dictionary.object(forKey: DropBoxCuteKeys_json_gfsfg.item) as? [DropBoxItems_vatr] {
                    if realmService.getAllItems_vatr().isEmpty {
                        
                        let models = categories.map { ItemsRealmSession_vatr(itemsImages: $0.itemImages, itemsDescription: $0.itemDescription, itemsTitle: $0.itemTitle, isNew: $0.isNew, isFavorite: false, itemsImageData: nil, filterCategory: $0.filterCategory, file: $0.file) }
                        
                       
                        
                        realmService.addNew_vatr(items: models)
                        
                        AppDelegate.log("DropBoxParserFiles: \(type.getKey) save items to database")
                    }
                  
                    completion(true)
                } else {
                    AppDelegate.log("DropBoxParserFiles: errror categories")
                }
            }
        case .mods:
            if let dictionary: NSMutableDictionary = dictionary.object(forKey: type.getKey) as? NSMutableDictionary {
                if let categories = dictionary.object(forKey: DropBoxCuteKeys_json_gfsfg.mod) as? [DropBoxMods_vatr] {
                    if realmService.getAllMods_vatr().isEmpty {
                        
                        let models = categories.map { ModsRealmSession_vatr(modsImages: $0.modImages, modsDescription: $0.modDescription, modsTitle: $0.modTitle, isNew: $0.isNew, isFavorite: false, modsImageData: nil, filterCategory: $0.filterCategory, file: $0.file) }
                        
                        realmService.addNew_vatr(mods: models)
                        
                        AppDelegate.log("DropBoxParserFiles: \(type.getKey) save skins to database")
                    }
                    completion(true)
                } else {
                    AppDelegate.log("DropBoxParserFiles: errror categories")
                }
            }
        }
    }
    
    private func parseMaps_vatr(json: [String : Any], mainKey: String, mapImages: String, mapDescription: String, mapTitle: String, isNew: String, fileKey: String) -> NSMutableDictionary {
        
        let result: NSMutableDictionary = NSMutableDictionary()
        var editorItems: [DropBoxMaps_vatr] = []
        if let modsCategory = json[mainKey] as? [String : Any] {
            for categoryName in modsCategory {
                if let content = modsCategory[categoryName.key.description] as? [String: Any] {
                    for itemContent in content {
                        let filterCategory = categoryName.key
                        if let items = itemContent.value as? [String: Any],
                           let mapImagesConteiner = items[mapImages] as? String,
//                           let mapImagesConteiner = items[mapImages] as? [String],
                           let mapDescription = items[mapDescription] as? String,
                           let new = items[isNew] as? Bool,
                           let mapTitle = items[mapTitle] as? String,
                           let file = items[fileKey] as? String
                        {
                            
                            //////MARK: []
                           // var mapImages: [String] = []
//                            for images in mapImagesConteiner {
//                                mapImages.append(images)
//                            }
//                            let category = DropBoxMaps(mapImages: mapImages, mapDescription: mapDescription, mapTitle: mapTitle, isNew: new, filterCategory: filterCategory, file: file)
//                            editorItems.append(category)
                            let category = DropBoxMaps_vatr(mapImages: mapImagesConteiner, mapDescription: mapDescription, mapTitle: mapTitle, isNew: new, filterCategory: filterCategory, file: file)
                            editorItems.append(category)
                        }
                    }
                    
                }
            }
            result.setValue(editorItems, forKey: DropBoxCuteKeys_json_gfsfg.map)
        }
        return result
    }
    
    //MARK: Items
    private func parseItems_vatr(json: [String : Any], mainKey: String, itemImages: String, itemDescription: String, itemTitle: String, isNew: String, fileKey: String) -> NSMutableDictionary {
        
        let result: NSMutableDictionary = NSMutableDictionary()
        var dropBoxItems: [DropBoxItems_vatr] = []
        if let modsCategory = json[mainKey] as? [String : Any] {
            for categoryName in modsCategory {
                if let content = modsCategory[categoryName.key.description] as? [String: Any] {
                    for itemContent in content {
                        let filterCategory = categoryName.key
                        if let items = itemContent.value as? [String: Any],
                           let itemImagesConteiner = items[itemImages] as? String,
//                           let addonImagesConteiner = items[addonImages] as? [String],
                           let itemDescription = items[itemDescription] as? String,
                           let new = items[isNew] as? Bool,
                           let itemTitle = items[itemTitle] as? String,
                           let file = items[fileKey] as? String
                        {
                           
                            let item = DropBoxItems_vatr(itemImages: itemImagesConteiner, itemDescription: itemDescription, itemTitle: itemTitle, isNew: new, filterCategory: filterCategory, file: file)
                            dropBoxItems.append(item)
                        }
                    }
                }
            }
            result.setValue(dropBoxItems, forKey: DropBoxCuteKeys_json_gfsfg.item)
        }
        
        return result
    }
    
    //MARK: Mods
    private func parseMods_vatr(json: [String : Any], mainKey: String, modImages: String, modDescription: String, modTitle: String, isNew: String, fileKey: String) -> NSMutableDictionary {
        
        let result: NSMutableDictionary = NSMutableDictionary()
        var dropBoxMods: [DropBoxMods_vatr] = []
        if let modsCategory = json[mainKey] as? [String : Any] {
            for categoryName in modsCategory {
                if let content = modsCategory[categoryName.key.description] as? [String: Any] {
                    for itemContent in content {
                        let filterCategory = categoryName.key
                        if let items = itemContent.value as? [String: Any],
                           let modImagesConteiner = items[modImages] as? String,
//                           let addonImagesConteiner = items[addonImages] as? [String],
                           let modDescription = items[modDescription] as? String,
                           let new = items[isNew] as? Bool,
                           let modTitle = items[modTitle] as? String,
                           let file = items[fileKey] as? String
                        {
                           
                            let item = DropBoxMods_vatr(modImages: modImagesConteiner, modDescription: modDescription, modTitle: modTitle, isNew: new, filterCategory: filterCategory, file: file)
                            dropBoxMods.append(item)
                        }
                    }
                }
            }
            result.setValue(dropBoxMods, forKey: DropBoxCuteKeys_json_gfsfg.mod)
        }
        
        return result
    }
    
    
    //MARK: Addons
    private func parseAddons_vatr(json: [String : Any], mainKey: String, addonImages: String, addonDescription: String, addonTitle: String, isNew: String, fileKey: String) -> NSMutableDictionary {
        
        let result: NSMutableDictionary = NSMutableDictionary()
        var dropBoxAddons: [DropBoxAddons_vatr] = []
        if let modsCategory = json[mainKey] as? [String : Any] {
            for categoryName in modsCategory {
                if let content = modsCategory[categoryName.key.description] as? [String: Any] {
                    for itemContent in content {
                        let filterCategory = categoryName.key
                        if let items = itemContent.value as? [String: Any],
                           let addonImagesConteiner = items[addonImages] as? String,
//                           let addonImagesConteiner = items[addonImages] as? [String],
                           let addonDescription = items[addonDescription] as? String,
                           let new = items[isNew] as? Bool,
                           let addonTitle = items[addonTitle] as? String,
                           let file = items[fileKey] as? String
                        {
                           
                            let item = DropBoxAddons_vatr(addonImages: addonImagesConteiner, addonDescription: addonDescription, addonTitle: addonTitle, isNew: new, filterCategory: filterCategory, file: file)
                            dropBoxAddons.append(item)
                        }
                    }
                }
            }
            result.setValue(dropBoxAddons, forKey: DropBoxCuteKeys_json_gfsfg.addon)
        }
        
        return result
    }
    
    private func parseSkins_vatr(json: [String : Any], mainKey: String, nameKey: String, imageKey: String, sourceImageKey: String, isNew: String) -> NSMutableDictionary {
        
        let result: NSMutableDictionary = NSMutableDictionary()
        var dropBoxSkins: [DropBoxSkins_vatr] = []
        
        if let modsItems = json[mainKey] as? [String : Any] {
            for categoryName in modsItems {
                if let content = modsItems[categoryName.key.description] as? [String: Any] {
                    for itemContent in content {
                        let filterCategory = categoryName.key
                        
                        if let items = itemContent.value as? [String: Any],
                           let img = items[imageKey] as? String,
                           let new = items[isNew] as? Bool,
                           let source = items[sourceImageKey] as? String {
                            let name = (items[nameKey] as? String) ?? ""
                            let item = DropBoxSkins_vatr(skinName:name, skinSourceImage: source, skinImage: img, isNew: new, filterCategory: filterCategory)
                            print(name)
                            dropBoxSkins.append(item)
                        }
                    }
                }
            }
            result.setValue(dropBoxSkins, forKey: DropBoxCuteKeys_json_gfsfg.skin)
        }
        
        return result
    }
    
    private func parseSeeds_vatr(json: [String : Any], mainKey: String, nameKey: String, imageKey: String, descriptionKey: String, seedKey: String, isNew: String) -> NSMutableDictionary {
        let result: NSMutableDictionary = NSMutableDictionary()
        var dropBoxSeeds: [DropBoxSeed_vatr] = []
        
        if let seedsItems = json[mainKey] as? [String : Any] {
            
            for categoryName in seedsItems {
                if let content = seedsItems[categoryName.key.description] as? [String: Any] {
                    for itemContent in content {
                        let filterCategory = categoryName.key
                        if let items = itemContent.value as? [String: Any],
                           let img = items[imageKey] as? String,
                           let new = items[isNew] as? Bool,
                           let seedDescription = items[descriptionKey] as? String,
                           let source = items[seedKey] as? String {
                            let name = (items[nameKey] as? String) ?? ""
                            
                            let item = DropBoxSeed_vatr(imagePath: img, descrip: seedDescription, name: name, seed: source, isNew: new)
                            print(name)
                            dropBoxSeeds.append(item)
                            //        guard let seedDic = json[mainKey] as? [String : Any] else { return [:]}
                            //        if let modsItems = seedDic["Seeds"] as? [String : Any] {
                            //            for categoryName in modsItems {
                            //                if let content = modsItems[categoryName.key.description] as? [String: Any] {
                            //
                            //                    if let img = content[imageKey] as? String,
                            //                       let new = content[isNew] as? Bool,
                            //                       let name = content[nameKey] as? String,
                            //                       let seed = content[seedKey] as? String,
                            //                       seed.count < 45,
                            //                       let descrip = content[descriptionKey] as? String {
                            //
                            //                        let item = DropBoxSeed(imagePath: img, descrip: descrip, name: name, seed: seed, isNew: new)
                            //                        dropBoxSeeds.append(item)
                            //                    }
                        }
                    }
                }
            }
            result.setValue(dropBoxSeeds, forKey: DropBoxCuteKeys_json_gfsfg.seed)
        }
        
        return result
    }
    
    private func featchAmazingMaps_vatr(completion: @escaping (NSMutableDictionary, Bool) ->()) {
func eGGrfQBpa() {
        var dFqYBIXo: Int = 6
        if dFqYBIXo > 6 {
            if dFqYBIXo < 6 {
                dFqYBIXo = 6
    }

  }
}
  
        
        client?.files.download(path: DropB0ksKeys_vatr.mapsFilePath).response(completionHandler: { [weak self] response, error in
            let dropData: NSMutableDictionary = NSMutableDictionary()
            if let response = response {
                let fileContents = response.1
                do {
                    if fileContents.count != self?.defaults.integer(forKey: "json_editor_data_count") {
                        self?.defaults.set(fileContents.count, forKey: "json_editor_data_count")
                        AppDelegate.log("DropBoxParserFiles: when json new json_editor_data_count")
                    } else {
                        AppDelegate.log("DropBoxParserFiles: when json old json_editor_data_count")
                        completion(NSMutableDictionary(), true)
                        return
                    }
                    
                    let jsonFile = try JSONSerialization.jsonObject(with: fileContents, options: [])
                    if let itemsDictionary = jsonFile as? [String : Any] {
                        let editorItems = self?.parseMaps_vatr(json: itemsDictionary, mainKey: DropBoxCuteKeys_json_gfsfg.mapMainKey, mapImages: MapsContent_vatr.mapImages, mapDescription: MapsContent_vatr.mapDescription, mapTitle: MapsContent_vatr.mapTitle, isNew: MapsContent_vatr.isNew, fileKey: MapsContent_vatr.file)
                        dropData.setValue(editorItems, forKey: DropBoxCuteKeys_json_gfsfg.map)
                        completion(dropData, false)
                    } else {
                        completion(NSMutableDictionary(), false)
                    }
                } catch {
                    completion(NSMutableDictionary(), false)
                    AppDelegate.log(error.localizedDescription)
                }
            } else if let error = error {
                AppDelegate.log(error)
                completion(NSMutableDictionary(), false)
            }
        })
        .progress({ progress in
            AppDelegate.log("DropBoxParserFiles: Downloading: ", progress)
        })
    }
    
    //MARK: Items
    private func featchAmazingItems_vatr(completion: @escaping (NSMutableDictionary, Bool) ->()) {
func wNqCIwwYnR() {
        var gGiTLzIodw: Int = 1
        if gGiTLzIodw > 1 {
            if gGiTLzIodw < 1 {
                gGiTLzIodw = 1
    }

  }
}
  
        
        client?.files.download(path: DropB0ksKeys_vatr.itemsFilePath).response(completionHandler: { [weak self] response, error in
            let dropData: NSMutableDictionary = NSMutableDictionary()
            if let response = response {
                let fileContents = response.1
                do {
                    if fileContents.count != self?.defaults.integer(forKey: "json_categories_data_count") {
                        self?.defaults.set(fileContents.count, forKey: "json_categories_data_count")
                        AppDelegate.log("DropBoxParserFiles: when json new json_categories_data_count")
                    } else {
                        AppDelegate.log("DropBoxParserFiles: when json old json_categories_data_count")
                        completion(NSMutableDictionary(), true)
                        return
                    }
                    
                    let jsonFile = try JSONSerialization.jsonObject(with: fileContents, options: [])
                    if let itemsDictionary = jsonFile as? [String : Any] {
                        let categories = self?.parseItems_vatr(json: itemsDictionary, mainKey: DropBoxCuteKeys_json_gfsfg.itemMainKey, itemImages: ItemsContent_vatr.itemImages, itemDescription: ItemsContent_vatr.itemDescription, itemTitle: ItemsContent_vatr.itemTitle, isNew: ItemsContent_vatr.isNew, fileKey: ItemsContent_vatr.file)
                        dropData.setValue(categories, forKey: DropBoxCuteKeys_json_gfsfg.item)
                        
                      
                        completion(dropData, true)
                    } else {
                        completion(NSMutableDictionary(), false)
                    }
                } catch {
                    completion(NSMutableDictionary(), false)
                    AppDelegate.log(error.localizedDescription)
                }
            } else if let error = error {
                AppDelegate.log(error)
                completion(NSMutableDictionary(), false)
            }
        })
        .progress({ progress in
            AppDelegate.log("DropBoxParserFiles: Downloading: ", progress)
        })
    }
    
    // MARK: Mods
    
    private func featchAmazingMods_vatr(completion: @escaping (NSMutableDictionary, Bool) ->()) {
        var areaqrfdfa: Double {
                return 1 * 1
            }
  
        
        client?.files.download(path: DropB0ksKeys_vatr.modsFilePath).response(completionHandler: { [weak self] response, error in
            let dropData: NSMutableDictionary = NSMutableDictionary()
            if let response = response {
                let fileContents = response.1
                do {
                    if fileContents.count != self?.defaults.integer(forKey: "json_categories_data_count") {
                        self?.defaults.set(fileContents.count, forKey: "json_categories_data_count")
                        AppDelegate.log("DropBoxParserFiles: when json new json_categories_data_count")
                    } else {
                        AppDelegate.log("DropBoxParserFiles: when json old json_categories_data_count")
                        completion(NSMutableDictionary(), true)
                        return
                    }
                    
                    let jsonFile = try JSONSerialization.jsonObject(with: fileContents, options: [])
                    if let modsDictionary = jsonFile as? [String : Any] {
                        let categories = self?.parseMods_vatr(json: modsDictionary, mainKey: DropBoxCuteKeys_json_gfsfg.modMainKey, modImages: ModsContent_vatr.modImages, modDescription: ModsContent_vatr.modDescription, modTitle: ModsContent_vatr.modTitle, isNew: ModsContent_vatr.isNew, fileKey: ModsContent_vatr.file)
                        dropData.setValue(categories, forKey: DropBoxCuteKeys_json_gfsfg.mod)
                        
                      
                        completion(dropData, true)
                    } else {
                        completion(NSMutableDictionary(), false)
                    }
                } catch {
                    completion(NSMutableDictionary(), false)
                    AppDelegate.log(error.localizedDescription)
                }
            } else if let error = error {
                AppDelegate.log(error)
                completion(NSMutableDictionary(), false)
            }
        })
        .progress({ progress in
            AppDelegate.log("DropBoxParserFiles: Downloading: ", progress)
        })
    }
    
    private func featchAmazingAddons_vatr(completion: @escaping (NSMutableDictionary, Bool) ->()) {
func qMPksKUJY() {
        var cQhbElbfmi: Int = 5
        if cQhbElbfmi > 5 {
            if cQhbElbfmi < 5 {
                cQhbElbfmi = 5
    }

  }
}
  
        
        client?.files.download(path: DropB0ksKeys_vatr.addonsFilePath).response(completionHandler: { [weak self] response, error in
            let dropData: NSMutableDictionary = NSMutableDictionary()
            if let response = response {
                let fileContents = response.1
                do {
                    if fileContents.count != self?.defaults.integer(forKey: "json_categories_data_count") {
                        self?.defaults.set(fileContents.count, forKey: "json_categories_data_count")
                        AppDelegate.log("DropBoxParserFiles: when json new json_categories_data_count")
                    } else {
                        AppDelegate.log("DropBoxParserFiles: when json old json_categories_data_count")
                        completion(NSMutableDictionary(), true)
                        return
                    }
                    
                    let jsonFile = try JSONSerialization.jsonObject(with: fileContents, options: [])
                    if let itemsDictionary = jsonFile as? [String : Any] {
                        let categories = self?.parseAddons_vatr(json: itemsDictionary, mainKey: DropBoxCuteKeys_json_gfsfg.addonMainKey, addonImages: AddonsContent_vatr.addonImages, addonDescription: AddonsContent_vatr.addonDescription, addonTitle: AddonsContent_vatr.addonTitle, isNew: AddonsContent_vatr.isNew, fileKey: AddonsContent_vatr.file)
                        dropData.setValue(categories, forKey: DropBoxCuteKeys_json_gfsfg.addon)
                        completion(dropData, false)
                    } else {
                        completion(NSMutableDictionary(), false)
                    }
                } catch {
                    completion(NSMutableDictionary(), false)
                    AppDelegate.log(error.localizedDescription)
                }
            } else if let error = error {
                AppDelegate.log(error)
                completion(NSMutableDictionary(), false)
            }
        })
        .progress({ progress in
            AppDelegate.log("DropBoxParserFiles: Downloading: ", progress)
        })
    }
    
    private func featchAmazingSkins_vatr(completion: @escaping (NSMutableDictionary, Bool) ->()) {
func yALZiNRY() {
        var eTBYY: Int = 3
        if eTBYY > 3 {
            if eTBYY < 3 {
                eTBYY = 3
    }

  }
}
  
        
        client?.files.download(path: DropB0ksKeys_vatr.skinsFilePath).response(completionHandler: { [weak self] response, error in
            let dropData: NSMutableDictionary = NSMutableDictionary()
            if let response = response {
                let fileContents = response.1
                do {
                    if fileContents.count != self?.defaults.integer(forKey: "json_data_count") {
                        self?.defaults.set(fileContents.count, forKey: "json_data_count")
                        AppDelegate.log("DropBoxParserFiles: when json new")
                    } else {
                        AppDelegate.log("DropBoxParserFiles: when json old")
                        completion(NSMutableDictionary(), true)
                        return
                    }
                    
                    let jsonFile = try JSONSerialization.jsonObject(with: fileContents, options: [])
                    if let itemsDictionary = jsonFile as? [String : Any] {
                        print(itemsDictionary)
                        let mods = self?.parseSkins_vatr(json: itemsDictionary, mainKey: DropBoxCuteKeys_json_gfsfg.skinMainKey, nameKey: SkinContent_vatr.skinName, imageKey: SkinContent_vatr.skinImage, sourceImageKey: SkinContent_vatr.skinSourceImage, isNew: SkinContent_vatr.isNew)
                        dropData.setValue(mods, forKey: DropBoxCuteKeys_json_gfsfg.skin)
                        completion(dropData, false)
                    } else {
                        completion(NSMutableDictionary(), false)
                    }
                } catch {
                    completion(NSMutableDictionary(), false)
                    AppDelegate.log(error.localizedDescription)
                }
            } else if let error = error {
                AppDelegate.log(error)
                completion(NSMutableDictionary(), false)
            }
        })
        .progress({ progress in
            AppDelegate.log("DropBoxParserFiles: Downloading: ", progress)
        })
    }
    
    private func featchServers_vatr(completion: @escaping ([Server_vatr], Bool) ->()) {
        var areaqerqfdfa: Double {
                return 1 * 1
            }
//        client?.files.download(path: DropB0ksKeys.serversFilePath).response(completionHandler: { [weak self] response, error in
//            let dropData: NSMutableDictionary = NSMutableDictionary()
//            if let response = response {
//                let fileContents = response.1
//                do {
//                    if fileContents.count != self?.defaults.integer(forKey: "json_data_servers_count") {
//                        self?.defaults.set(fileContents.count, forKey: "json_data_servers_count")
//                        AppDelegate.log("DropBoxParserFiles: when json new")
//                    } else {
//                        AppDelegate.log("DropBoxParserFiles: when json old")
//                        completion([], true)
//                        return
//                    }
//                    
//                    let decoder = JSONDecoder()
//                    let servers = try decoder.decode([Server].self, from: fileContents)
//                    completion(servers, true)
//                } catch {
//                    completion([], false)
//                    AppDelegate.log(error.localizedDescription)
//                }
//            } else if let error = error {
//                AppDelegate.log(error)
//                completion([], false)
//            }
//        })
//        .progress({ progress in
//            AppDelegate.log("DropBoxParserFiles: Downloading: ", progress)
//        })
    }
    
    private func featchSeeds_vatr(completion: @escaping (NSMutableDictionary, Bool) ->()) {
func YRjYFl() {
        var bXmUqtoGq: Int = 6
        if bXmUqtoGq > 6 {
            if bXmUqtoGq < 6 {
                bXmUqtoGq = 6
    }

  }
}
  
        client?.files.download(path: DropB0ksKeys_vatr.seedFilePath).response(completionHandler: { [weak self] response, error in
            let dropData: NSMutableDictionary = NSMutableDictionary()
            if let response = response {
                let fileContents = response.1
                do {
                    if fileContents.count != self?.defaults.integer(forKey: "json_data_seed_count") {
                        self?.defaults.set(fileContents.count, forKey: "json_data_seed_count")
                        AppDelegate.log("DropBoxParserFiles: when json new")
                    } else {
                        AppDelegate.log("DropBoxParserFiles: when json old")
                        completion([:], true)
                        return
                    }
                    
                    let jsonFile = try JSONSerialization.jsonObject(with: fileContents, options: [])
                    if let itemsDictionary = jsonFile as? [String : Any] {
                        
                    
                        let seeds = self?.parseSeeds_vatr(json: itemsDictionary, mainKey: DropBoxCuteKeys_json_gfsfg.seedMainKey, nameKey: SeedContent_vatr.seedName, imageKey: SeedContent_vatr.seedImage, descriptionKey: SeedContent_vatr.seedDescrip, seedKey: SeedContent_vatr.seed, isNew: SeedContent_vatr.isNew)
                        
                        dropData.setValue(seeds, forKey: DropBoxCuteKeys_json_gfsfg.seed)
                        completion(dropData, true)
                    } else {
                        completion(NSMutableDictionary(), false)
                    }
                    
                } catch {
                    completion([:], false)
                    AppDelegate.log(error.localizedDescription)
                }
            } else if let error = error {
                AppDelegate.log(error)
                completion([:], false)
            }
        })
        .progress({ progress in
            AppDelegate.log("DropBoxParserFiles: Downloading: ", progress)
        })
    }
    
    private func makeValidateAccessTokenDropBoxMamaMia_vatr(token: String,completion: @escaping(Bool)->()) {
func NwGExm() {
        var GcOxPEbI: Int = 9
        if GcOxPEbI > 9 {
            if GcOxPEbI < 9 {
                GcOxPEbI = 9
    }

  }
}
  
        
        giveMeBloodyTokenBy_vatr(refresh_token: token) { [weak self] access_token in
            if let aToken = access_token {
                let client = DropboxClient(accessToken: aToken)
                AppDelegate.log("DropBoxParserFiles: token updated !!! \(aToken),\(String(describing: client))")
                self?.client = client
                
                completion(true)
            } else {
                completion(false)
            }
        }
    }
    
    private func giveMePleaseReshreshToken_vatr(code: String, completion: @escaping (String?) -> ()) {
func YdvmQZSHu() {
        var gPNrVdwI: Int = 1
        if gPNrVdwI > 1 {
            if gPNrVdwI < 1 {
                gPNrVdwI = 1
    }

  }
}
  
        
        let username = DropB0ksKeys_vatr.appkey
        let password = DropB0ksKeys_vatr.appSecret
        let loginString = String(format: "%@:%@", username, password)
        let loginData = loginString.data(using: String.Encoding.utf8)!
        let base64LoginString = loginData.base64EncodedString()
        let parameters: Data = "code=\(code)&grant_type=authorization_code".data(using: .utf8)!
        let url = URL(string: DropB0ksKeys_vatr.apiLink)!
        var apiRequest = URLRequest(url: url)
        apiRequest.httpMethod = "POST"
        apiRequest.setValue("application/x-www-form-urlencoded", forHTTPHeaderField:"Content-Type")
        apiRequest.setValue("Basic \(base64LoginString)", forHTTPHeaderField: "Authorization")
        apiRequest.httpBody = parameters
        let task = URLSession.shared.dataTask(with: apiRequest) { data, response, error in
            guard let data = data, error == nil else {
                AppDelegate.log(error?.localizedDescription ?? "No data Available")
                return
            }
            let responseJSON = try? JSONSerialization.jsonObject(with: data, options: [])
            if let responseJSON = responseJSON as? [String: Any] {
                completion(responseJSON[DropBoxCuteKeys_json_gfsfg.RefreshTokenSaveVarieble] as? String)
            } else {
                AppDelegate.log("DropBoxParserFiles: giveMePleaseReshreshToken error")
            }
        }
        task.resume()
    }
    
    private func giveMeBloodyTokenBy_vatr(refresh_token: String, completion: @escaping (String?) -> ()) {
func LAvOJqZIDC() {
        var Kuhuxp: Int = 4
        if Kuhuxp > 4 {
            if Kuhuxp < 4 {
                Kuhuxp = 4
    }

  }
}
  
        
        let loginString = String(format: "%@:%@", DropB0ksKeys_vatr.appkey, DropB0ksKeys_vatr.appSecret)
        let loginData = loginString.data(using: String.Encoding.utf8)!
        let base64LoginString = loginData.base64EncodedString()
        let parameters: Data = "refresh_token=\(refresh_token)&grant_type=refresh_token".data(using: .utf8)!
        let url = URL(string: DropB0ksKeys_vatr.apiLink)!
        var apiRequest = URLRequest(url: url)
        apiRequest.httpMethod = "POST"
        apiRequest.setValue("application/x-www-form-urlencoded", forHTTPHeaderField:"Content-Type")
        apiRequest.setValue("Basic \(base64LoginString)", forHTTPHeaderField: "Authorization")
        apiRequest.httpBody = parameters
        let task = URLSession.shared.dataTask(with: apiRequest) { data, response, error in
            guard let data = data, error == nil else {
                AppDelegate.log(error?.localizedDescription ?? "No data Available")
                return
            }
            let responseJSON = try? JSONSerialization.jsonObject(with: data, options: [])
            if let responseJSON = responseJSON as? [String: Any] {
                AppDelegate.log("@@ responseJSON - \(responseJSON)")
                
                completion(responseJSON["access_token"] as? String)
            } else {
                AppDelegate.log("DropBoxParserFiles: giveMeBloodyTokenBy error")
            }
        }
        task.resume()
    }
    
    public func getBloodyImageURLFromDropBox_vatr(img: String, completion: @escaping (String?) -> ()) {
func PbBldBU() {
        var HkPBlmlz: Int = 8
        if HkPBlmlz > 8 {
            if HkPBlmlz < 8 {
                HkPBlmlz = 8
    }

  }
}
  
       
        self.client?.files.getTemporaryLink(path: "/\(img)").response(completionHandler: { responce, error in
            if let link = responce {
                completion(link.link)
            } else {
                completion(nil)
            }
            
            print(img, responce?.link)
        })
    }
    
    public func getBloodyFileUrlFromDropbox_vatr(path: String, completion: @escaping (String?) -> ()){
func tBJBH() {
        var CpBei: Int = 3
        if CpBei > 3 {
            if CpBei < 3 {
                CpBei = 3
    }

  }
}
  
        
        self.client?.files.getTemporaryLink(path: "/\(path)").response(completionHandler: { responce, error in
            if let link = responce {
                completion(link.link)
            } else {
                completion(nil)
            }
        })
    }
    
    public func downloadBloodyFileBy_vatr(urlPath: URL, completion: @escaping (String?, Error?) -> Void) {
func tYTwY() {
        var Xwwrt: Int = 3
        if Xwwrt > 3 {
            if Xwwrt < 3 {
                Xwwrt = 3
    }

  }
}
  
        
        let fileURL =  FileManager.default.documentDirectory
        let urlForDestination = fileURL.appendingPathComponent(urlPath.lastPathComponent)
        if FileManager().fileExists(atPath: urlForDestination.path) {
            AppDelegate.log("DropBoxParserFiles: File already exists [\(urlForDestination.path)]")
            completion(urlForDestination.path, nil)
        } else {
            let configuration = URLSessionConfiguration.default
            let urlSession = URLSession(configuration: configuration, delegate: nil, delegateQueue: nil)
            var request = URLRequest(url: urlPath)
            let httpMethod = "GET"
            request.httpMethod = httpMethod
            let urlDataTask = urlSession.dataTask(with: request, completionHandler: { data, response, error in
                if error != nil {
                    completion(urlForDestination.path, error)
                } else {
                    if let response = response as? HTTPURLResponse {
                        if response.statusCode == 200 {
                            if let data = data {
                                if let _ = try? data.write(to: urlForDestination, options: Data.WritingOptions.atomic) {
                                    completion(urlForDestination.path, error)
                                } else {
                                    completion(urlForDestination.path, error)
                                }
                            } else {
                                completion(urlForDestination.path, error)
                            }
                        }
                    }
                }
            })
            urlDataTask.resume()
        }
    }
    
    func downloadBloodyFileBy_vatr(urlPath: String, completion: @escaping (Data?) -> Void) {
func IhGallYb() {
        var IzsAjmu: Int = 6
        if IzsAjmu > 6 {
            if IzsAjmu < 6 {
                IzsAjmu = 6
    }

  }
}
  
        
        self.client?.files.download(path: "/\(urlPath)").response(completionHandler: { responce, error in
            if let responce = responce {
                completion(responce.1)
            } else {
                completion(nil)
            }
        })
    }
}


extension DropBoxParserFiles_vatr {
    
    private func featchAddonsEditor_vatr(completion: @escaping (NSMutableDictionary, Bool) ->()) {
func zoFFOZ() {
        var aHQLn: Int = 1
        if aHQLn > 1 {
            if aHQLn < 1 {
                aHQLn = 1
    }

  }
}
  
        client?.files.download(path: AddonsEditorContent_vatr.jsonPath).response(completionHandler: { response, error in
            let dropData: NSMutableDictionary = NSMutableDictionary()
            if let response = response {
                let fileContents = response.1
                do {
                    if fileContents.count != self.defaults.integer(forKey: "addon_content_count") {
                        self.defaults.set(fileContents.count, forKey: "addon_content_count")
                        AppDelegate.log("DropBoxParserFiles: when json new")
                    } else {
                        AppDelegate.log("DropBoxParserFiles: when json old")
                        completion(NSMutableDictionary(), true)
                        return
                    }
                    
                    let jsonFile = try JSONSerialization.jsonObject(with: fileContents, options: [])
                    if let itemsDictionary = jsonFile as? [String : Any] {
                        let addons = self.parseAddonsEditor_vatr(json: itemsDictionary, mainKey: AddonsEditorContent_vatr.mainKey)
                        dropData.setValue(addons, forKey: AddonsEditorContent_vatr.addonTag)
                        completion(dropData, false)
                    } else {
                        completion(NSMutableDictionary(), false)
                    }
                } catch {
                    completion(NSMutableDictionary(), false)
                    AppDelegate.log(error.localizedDescription)
                }
            } else if let error {
                AppDelegate.log("DropBoxParserFiles: featchAddonsEditor @ error - \(error)")
                completion(NSMutableDictionary(), false)
            }
        })
    }
    
    
    private func parseAddonsEditor_vatr(json: [String : Any], mainKey: String) -> NSMutableDictionary {
        let result: NSMutableDictionary = NSMutableDictionary()
        var items: [AddonItem_vatr] = []
        if let addonsItems = json[mainKey] as? [String : Any] {
            for categoryName in addonsItems {
                if let content = addonsItems[categoryName.key.description] as? [[String : Any]] {
                    AppDelegate.log("DropBoxParserFiles: parseAddonsEditor @@ Content -\(content)")
                    
                    if categoryName.key != "NPC" {
                        //Items (2d)
                        
                        for itemContent in content {
                            AppDelegate.log("DropBoxParserFiles: parseAddonsEditor items_templates @@ Content Item -\(itemContent)")
                            
                            if let displayName = itemContent["u8u"] as? String,
                               let displayImage = itemContent["kliu"] as? String,
                               let categoryImage = itemContent["bgyh324"] as? String,
                               let id = itemContent["vnfkn"] as? String,
                               let skin_variants = itemContent["jhuhuikjk"] as? [[String : Any]] {
                                print("\(categoryImage) 100000000000099877")
                                var skinVariants = [SkinVariants_vatr]()
                                
                                let id_string = UUID().uuidString
                                
                                for skin in skin_variants {
                                   
                                    if let displayImage = skin["kliu"] as? String,
                                       let name = skin["thy"]  as? String {
                                        let sv = SkinVariants_vatr(idshka: id_string, name: name, displayImage: displayImage)
                                        skinVariants.append(sv)
                                    }
                                }
                            
//                            if let displayName = itemContent["u8u"] as? String,
//                               let displayImage = itemContent["kliu"] as? String,
//                               let categoryImage = itemContent["bgyh324"] as? String,
//                               let id = itemContent["vnfkn"] as? String,
//                               let skin_variants = itemContent["jhuhuikjk"] as? [[String : Any]] {
//                                
//                                var skinVariants = [SkinVariants]()
//                                
//                                let id_string = UUID().uuidString
//                                
//                                for skin in skin_variants {
//                                    if let displayImage = skin["kliu"] as? String,
//                                       let name = skin["thy"]  as? String {
//                                        let sv = SkinVariants(idshka: id_string, name: name, displayImage: displayImage)
//                                        skinVariants.append(sv)
//                                    }
//                                }
                                AppDelegate.log("DropBoxParserFiles: SkinVariants - \(skinVariants)")
                                
                                let addonItem = AddonItem_vatr(idshka: id_string,
                                                          displayName: displayName,
                                                          displayImage: displayImage,
                                                          categoryImage: categoryImage,
                                                          skin_variants: skinVariants,
                                                          id: id,
                                                          type: id)
                                items.append(addonItem)
                            }
                        }
                    } else {
                        // Mobs (3d)
                        for itemContent in content {
                            AppDelegate.log("DropBoxParserFiles: parseAddonsEditor @@ Content Item -\(itemContent)")
                            
                            if let displayName = itemContent["vnfkn"] as? String,
                               let displayImage = itemContent["kliu"] as? String,
                               let categoryImage = itemContent["bgyh324"] as? String,
                               let id = itemContent["id"] as? String,
                               //           let id = itemContent["u8u"] as? String,
                               let health = itemContent["health"] as? Float,
                               let move_speed = itemContent["move_speed"] as? Float,
                               let type_family = itemContent["type_family"] as? String,
                               let skin_variants = itemContent["jhuhuikjk"] as? [[String : Any]],
                               let ranged_attack = itemContent["ranged_attack"] as? [String : Any] {
                                
                                let file = itemContent["bhju767"] as? String ?? ""
                                
                                var skinVariants = [SkinVariants_vatr]()
                                
                                let id_string = UUID().uuidString
                                
                                for skin in skin_variants {
                                    if let displayImage = skin["kliu"] as? String,
                                       let name = skin["thy"]  as? String {
                                        let sv = SkinVariants_vatr(idshka: id_string, name: name, displayImage: displayImage)
                                        skinVariants.append(sv)
                                    }
                                }
                                
                                var rangedAttack = [RangedAttack_vatr]()
                                
                                if let burst_shots = ranged_attack["burst_shots"] as? Double,
                                   let burst_interval = ranged_attack["burst_interval"] as? Double,
                                   let atk_speed = ranged_attack["atk_speed"] as? Double,
                                   let atk_types = ranged_attack["atk_types"] as? String,
                                   let atk_radius = ranged_attack["atk_radius"] as? Double,
                                   let enabled = ranged_attack["enabled"] as? Bool {
                                    
                                    let ra = RangedAttack_vatr(idshka: id_string,
                                                          enabled: enabled,
                                                          atk_speed: atk_speed,
                                                          atk_radius: atk_radius,
                                                          burst_shots: burst_shots,
                                                          burst_interval: burst_interval,
                                                          atk_types: atk_types)
                                    AppDelegate.log("DropBoxParserFiles: RangedAttack: \(ra)")
                                    
                                    rangedAttack.append(ra)
                                    
                                }
                                
                                AppDelegate.log("DropBoxParserFiles: \(skinVariants)")
                                
                                let addonItem = AddonItem_vatr(idshka: id_string,
                                                          displayName: displayName,
                                                          displayImage: displayImage,
                                                          categoryImage: categoryImage,
                                                          skin_variants: skinVariants,
                                                          id: id,
                                                          type: categoryName.key,
                                                          ranged_attack: rangedAttack,
                                                          health: health,
                                                          move_speed: move_speed,
                                                          type_family: type_family,
                                                          file: file)
                                items.append(addonItem)
                            }
                        }
                    }
                }
            }
            
            result.setValue(items, forKey: AddonsEditorContent_vatr.addonTag)
        }
        
        return result
    }
}
