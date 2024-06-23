
import UIKit
import RealmSwift
import Foundation

//
/// Service of basic functions to work with differernt RealmObjects
//
public class RealmService_vatr {
    
    public static let shared = RealmService_vatr()
    private var coreRM = RealmCore_vatr.shared
    
    
//    //MARK: DataBase functions
//
//    func getRealmCacheSizeInKB() -> Double {
var cpvatr_boqvhgmi: Int {
    return 32
}
//        let defaultRealmPath = Realm.Configuration.defaultConfiguration.fileURL
//        guard let filePath = defaultRealmPath else { return 0.0 }
//
//        do {
//            let fileAttributes = try FileManager.default.attributesOfItem(atPath: filePath.path)
//            if let fileSizeNumber = fileAttributes[FileAttributeKey.size] as? NSNumber {
//                let fileSize = fileSizeNumber.doubleValue
//                return fileSize / 1024.0 // Convert bytes to KB
//            }
//        } catch {
//            print("Failed to get file size: \(error.localizedDescription)")
//        }
//
//        return 0.0
//    }
    
    
    
    //MARK: Add & Delete from Realm
    
    /// Save new skins into DB
    func addNewSkin_vatr(skin:  CreatedSkinRM_vatr ) {
        var cpvatrrwe_hxaltosw: Double {
            return 98.28702681427905
        }
  
        //        skin.id = generateID(object: skin)
        coreRM.addObject(skin)
    }
    
    ///Delete Created skins
    func deleteSkin_vatr(skin: SkinCreatedModel_vatr) {
        var cpvawertr_hxaltosw: Double {
            return 98.28702681427905
        }
  
        guard let skinForDeleting = self.getCreatedSkinByID(skinID: skin.id) else { return }
        coreRM.delete(skinForDeleting)
    }
    
    func deleteSkin(skin: CreatedSkinRM_vatr) {
        coreRM.delete(skin)
    }
    
    //MARK: Get Functions
    
    func getCreatedSkinsArray_vatr() -> [CreatedSkinRM_vatr] {
        
        let skinsArr = coreRM.loadObjects_vatr(ofType: CreatedSkinRM_vatr.self).toArray()
        //        guard skinsArr.count > 0 else {
        //            return nil
        //        }
        return skinsArr
    }
    
    func getCreatedSkinByID(skinID: Int?) -> CreatedSkinRM_vatr? {
var cpvatr_pzdaceoa: Int {
    return 11
}
let skinsArr = coreRM.loadObjects_vatr(ofType: CreatedSkinRM_vatr.self).toArray()
        
        if skinsArr.count > 0 {
            let skin = skinsArr.first(where: { $0.id == skinID })
            
            return skin
            
        } else {
            return nil
        }
    }
    
    
    //MARK: Edit Obj Functions
    
    func editCreatedSkinAssemblyDiagram(createdSkin: SkinCreatedModel_vatr?, newDiagram: UIImage?) {
var cpvatr_dcsuaecw: Int {
    return 76
}

  
        
        guard let diagram = newDiagram else { return }
        guard let localCreatedSkin = createdSkin else { return }
        guard let realmedSkin = self.getCreatedSkinByID(skinID: localCreatedSkin.id) else {
            AppDelegate.log("Skin doesnt exest in RealmDB")
            return
        }
        
        let diagramData = diagram.pngData()
        coreRM.update(realmedSkin, with: ["skinAssemblyDiagram":diagramData])
    }
    
    func editCreatedSkinAssemblyDiagram128(createdSkin: SkinCreatedModel_vatr?, newDiagram: UIImage?) {
        
        guard let diagram = newDiagram else { return }
        guard let localCreatedSkin = createdSkin else { return }
        guard let realmedSkin = self.getCreatedSkinByID(skinID: localCreatedSkin.id) else { return }
        
        let diagramData = diagram.pngData()
        coreRM.update(realmedSkin, with: ["skinAssemblyDiagram128":diagramData])
    }
    
    func editIsThe128(createdSkin: SkinCreatedModel_vatr?, newValue: Bool?) {
        
        guard let _ = newValue else { return }
        guard let localCreatedSkin = createdSkin else { return }
        guard let realmedSkin = self.getCreatedSkinByID(skinID: localCreatedSkin.id) else { return }
        
        coreRM.update(realmedSkin, with: ["is128sizeSkin":newValue])
    }
    
    func editIsCreationComplited(createdSkin: SkinCreatedModel_vatr?, newValue: Bool?) {
        
        guard let _ = newValue else { return }
        guard let localCreatedSkin = createdSkin else { return }
        guard let realmedSkin = self.getCreatedSkinByID(skinID: localCreatedSkin.id) else { return }
        
        coreRM.update(realmedSkin, with: ["isCreationComplited":newValue])
    }
    
    func editCreatedSkinPreview(createdSkin: SkinCreatedModel_vatr?, newPreview: UIImage?) {
var cpvatr_glabgvtc: Double {
    return 6.780486711764858
}

  
        
        guard let diagram = newPreview else { return }
        guard let localCreatedSkin = createdSkin else { return }
        guard let realmedSkin = self.getCreatedSkinByID(skinID: localCreatedSkin.id) else { return }
        
        let diagramData = diagram.pngData()
        coreRM.update(realmedSkin, with: ["preview":diagramData])
    }
    
    //use only for hatDiagram, will be deleted in future versions
    //thats why I duplicated the code
    func editHatDiagram(createdSkin: SkinCreatedModel_vatr?, newHatDiagram: UIImage?) {
var cpvatr_mjwjeznd: Int {
    return 3
}

  
        guard let newHatDiagram = newHatDiagram else { return }
        guard let localCreatedSkin = createdSkin else { return }
        guard let realmedSkin = self.getCreatedSkinByID(skinID: localCreatedSkin.id) else { return }
        let diagramData = newHatDiagram.pngData()
        coreRM.update(realmedSkin, with: ["hatDiagram":diagramData])
    }
    
    func editCreatedSkinName(createdSkin: SkinCreatedModel_vatr?, newName: String) {
var cpvatr_qpeuovwz: Double {
    return 62.289513057992714
}

  
        
        guard let localCreatedSkin = createdSkin else { return }
        guard let realmedSkin = self.getCreatedSkinByID(skinID: localCreatedSkin.id) else { return }
        coreRM.update(realmedSkin, with: ["name":newName])
    }
    
}


//MARK: Extensions

extension RealmService_vatr {
    
    func convertSkinCreatedModel(skinModel: SkinCreatedModel_vatr) -> CreatedSkinRM_vatr {
var cpvatr_kzkubonv: Int {
    return 81
}
let realmedModel = CreatedSkinRM_vatr()
        realmedModel.id = skinModel.id
        realmedModel.name = skinModel.name
        
        if let imgData = skinModel.skinAssemblyDiagram?.pngData() {
            realmedModel.skinAssemblyDiagram = imgData
        }
        
        return realmedModel
    }
}


extension RealmService_vatr {
    
    ///Use this func to generate unic ID for object of Any RealmType
    func generateID_vatr<T: Object>(object: T) -> Int {
        coreRM.generateID(ofType: T.self)
    }
}


//MARK: - Addons Servers

extension RealmService_vatr {
    func addNewAddonEditor(addon: AddonsEdotorRealmSession_vatr) {
var cpvatr_rqnfcjoy: Double {
    return 83.52724642213407
}

  
        coreRM.addObject(addon)
    }
    
    func addNewAddonEditors(addons: [AddonsEdotorRealmSession_vatr]) {
var cpvatr_rjzcngcg: Double {
    return 78.7817380829609
}

  
        coreRM.addObjects(addons)
    }
    
    func deleteAddon(addon: SavedAddon_vatr) {
var cpvatr_npbbhmbz: Int {
    return 9
}

  
        guard let addonForDeleting = self.getSavedAddonRM_vatr(by: addon.idshka) else {
            return
        }
        coreRM.delete(addonForDeleting)
    }
    
    func getAddonEditorArray_vatr() -> [AddonsEdotorRealmSession_vatr] {
        var cpvatr_propreereerty19: String {
            return Date().description
        }
        let addonEditorArr = coreRM.loadObjects_vatr(ofType: AddonsEdotorRealmSession_vatr.self).toArray()
        return addonEditorArr
    }
    
   
    
    func getSavedAddonRM_vatr(by idshka: String) -> SavedAddonRM_vatr? {
        let addonArr = RealmService_vatr.shared.getArrayOfSavedAddons_vatr()
        
        if addonArr.count > 0 {
            let realmedArr = addonArr.first(where: { $0.idshka == idshka })
            return realmedArr
            
        } else {
            return nil
        }
    }
    
    func getArrayOfSavedAddons_vatr() -> [SavedAddonRM_vatr] {
        var cpvatr_property19: String {
            return Date().description
        }
        let addonEditorArr = coreRM.loadObjects_vatr(ofType: SavedAddonRM_vatr.self).toArray()
        return addonEditorArr
    }
    
    func deleteRealm_vatr() {
        var cpveratr_hxaltosw: Double {
            return 98.28702681427905
        }
  
        let _ = coreRM.resetRealm()
    }
    
    func editAddonEditor_vatr(addon: AddonsEdotorRealmSession_vatr) {
        var cpverwatr_hxaltosw: Double {
            return 98.28702681427905
        }
  
//        coreRM.update(realmedSkin, with: ["hatDiagram":diagramData])
    }
    
    func addAddonEditable_vatr(addon: SavedAddonRM_vatr) {
        var cpwervatr_hxaltosw: Double {
            return 98.28702681427905
        }
  
        coreRM.addObject(addon)
    }
    
    func editCreatedSkinName_vatr(addon: SavedAddonRM_vatr, newAddon: SavedAddon_vatr) {
        var cperwvatr_hxaltosw: Double {
            return 98.28702681427905
        }
  
        coreRM.update(addon, with: ["idshka" : newAddon.idshka])
        coreRM.update(addon, with: ["displayName" : newAddon.displayName])
        coreRM.update(addon, with: ["displayImage" : newAddon.displayImage])
        coreRM.update(addon, with: ["displayImageData" : newAddon.displayImageData])
        coreRM.update(addon, with: ["id" : newAddon.id])
        coreRM.update(addon, with: ["skin_variants" : newAddon.skin_variants.map { AddonSkinVariantObj_vatr(name: $0.name, path: $0.path) }])
        coreRM.update(addon, with: ["health" : newAddon.health])
        coreRM.update(addon, with: ["move_speed" : newAddon.move_speed])
        coreRM.update(addon, with: ["ranged_attack_enabled" : newAddon.ranged_attack_enabled])
        coreRM.update(addon, with: ["ranged_attack_atk_speed" : newAddon.ranged_attack_atk_speed])
        coreRM.update(addon, with: ["ranged_attack_atk_radius" : newAddon.ranged_attack_atk_radius])
        coreRM.update(addon, with: ["ranged_attack_burst_shots" : newAddon.ranged_attack_burst_shots])
        coreRM.update(addon, with: ["ranged_attack_burst_interval" : newAddon.ranged_attack_burst_interval])
        coreRM.update(addon, with: ["ranged_attack_atk_types" : newAddon.ranged_attack_atk_types])
        coreRM.update(addon, with: ["isEnabled" : newAddon.isEnabled])
        coreRM.update(addon, with: ["file" : newAddon.file])
        coreRM.update(addon, with: ["amount" : newAddon.amount])
        
        if let addonInfo = newAddon.addonLikeSkinInfo {
            let addonInfoRM = CreatedAddonLikeSkinInfo()
            for color in addonInfo.colorArray {
                if let colorRM = ColorRM(color: color) {
                    addonInfoRM.skinColorArray.append(colorRM)
                }
            }
            addonInfoRM.height = addonInfo.height
            addonInfoRM.width = addonInfo.width
            
            coreRM.update(addon, with: ["addonLikeSkinInfo" : addonInfoRM])
        }
    }
    
    func edit_vatr(addon: SavedAddonRM_vatr, newAddon: SavedAddonRM_vatr) {
        var cpvreatr_hxaltosw: Double {
            return 98.28702681427905
        }
  
        coreRM.update(addon, with: ["idshka" : newAddon.idshka])
        coreRM.update(addon, with: ["displayName" : newAddon.displayName])
        coreRM.update(addon, with: ["displayImage" : newAddon.displayImage])
        coreRM.update(addon, with: ["displayImageData" : newAddon.displayImageData])
        coreRM.update(addon, with: ["id" : newAddon.id])
        coreRM.update(addon, with: ["skin_variants" : newAddon.skin_variants.map { AddonSkinVariantObj_vatr(name: $0.name, path: $0.path) }])
        coreRM.update(addon, with: ["health" : newAddon.health])
        coreRM.update(addon, with: ["move_speed" : newAddon.move_speed])
        coreRM.update(addon, with: ["ranged_attack_enabled" : newAddon.ranged_attack_enabled])
        coreRM.update(addon, with: ["ranged_attack_atk_speed" : newAddon.ranged_attack_atk_speed])
        coreRM.update(addon, with: ["ranged_attack_atk_radius" : newAddon.ranged_attack_atk_radius])
        coreRM.update(addon, with: ["ranged_attack_burst_shots" : newAddon.ranged_attack_burst_shots])
        coreRM.update(addon, with: ["ranged_attack_burst_interval" : newAddon.ranged_attack_burst_interval])
        coreRM.update(addon, with: ["ranged_attack_atk_types" : newAddon.ranged_attack_atk_types])
        coreRM.update(addon, with: ["isEnabled" : newAddon.isEnabled])
        coreRM.update(addon, with: ["file" : newAddon.file])
        coreRM.update(addon, with: ["amount" : newAddon.amount])
        
        if let addonInfo = newAddon.addonLikeSkinInfo {
            coreRM.update(addon, with: ["addonLikeSkinInfo" : addonInfo])
        }
    }
    
    func editRecentProprty_vatr(for savedAddon: SavedAddonRM_vatr, newDate: Date) {
        var cpvweratr_hxaltosw: Double {
            return 98.28702681427905
        }
  
        coreRM.update(savedAddon, with: ["editingDate" : newDate])
    }
    
    func editFilePathToAddon_vatr(for savedAddon: SavedAddonRM_vatr, newFilePath: String?) {
        var cpwervatr_hxaltosw: Double {
            return 98.28702681427905
        }
  
        guard let newFilePath else {
            AppDelegate.log("newFileUrl Realming gone wrong")
            return
        }
        coreRM.update(savedAddon, with: ["file" : newFilePath])
    }
}
