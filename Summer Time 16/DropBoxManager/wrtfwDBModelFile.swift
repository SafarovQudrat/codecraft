

import Foundation

struct DropBoxCuteKeys_json_gfsfg {

    static let skinMainKey = "zbqnoo"
    static let addonMainKey = "p7gqz"
    static let mapMainKey = "bsy5n_"
    static let seedMainKey = "r658gi"
    static let itemMainKey = "_rsk"
    static let modMainKey = "l9apzo78_p"

    static let noData = "noData"
    
    static let skin = "skins"
//    static let seed = "Shaders"
    static let seed = "shaders"
    static let addon = "addons"
    static let map = "maps"
    static let item = "items"
    static let mod = "mods"

    static let RefreshTokenSaveVarieble = "refresh_token"
    static let pathMods = "/mods"
}

enum DropBoxCategoryType_egeg {
    case skins, addons, maps, addonsEditor, seeds, items, mods
    
    var getKey: String {
        switch self {
        case .skins:
            return DropBoxCuteKeys_json_gfsfg.skin
        case .addons:
            return DropBoxCuteKeys_json_gfsfg.addon
        case .maps:
            return DropBoxCuteKeys_json_gfsfg.map
        case .addonsEditor:
            return "addon_creator"
        case .seeds:
            return DropBoxCuteKeys_json_gfsfg.seed
        case .items:
            return DropBoxCuteKeys_json_gfsfg.item
        case .mods:
            return DropBoxCuteKeys_json_gfsfg.mod
        }
    }
    
    var path : String {
        switch self {
        case .skins:
            return ""
 //           return DropBoxCuteKeys_json.pathMods
        case .addons:
            return DropBoxCuteKeys_json_gfsfg.pathMods
    //        return ""
        case .maps:
          //  return DropBoxCuteKeys_json.pathMods
            return ""
        case .addonsEditor:
            return ""
        case .seeds:
            return ""
        case .items:
            return ""
        case .mods:
            return ""
        }
    }
}


struct ItemsContent_vatr {
    static let itemImages = "yb7"
    static let itemDescription = "afx"
    static let itemTitle = "m5in"
    static let isNew = "Popular"
    static let file = "sm9rl9"
}

struct DropBoxItems_vatr: Equatable, Codable {
    let itemImages: String
//    let addonImages: [String]
    let itemDescription: String
    let itemTitle: String
    let isNew: Bool
    let filterCategory: String
    let file: String
}

struct ModsContent_vatr {
    static let modImages = "i0fe"
    static let modDescription = "e1d76"
    static let modTitle = "7-rb_"
    static let isNew = "Popular"
    static let file = "6zm"
}

struct DropBoxMods_vatr: Equatable, Codable {
    let modImages: String
//    let addonImages: [String]
    let modDescription: String
    let modTitle: String
    let isNew: Bool
    let filterCategory: String
    let file: String
}

struct SkinContent_vatr {
    static let skinSourceImage = "ut96qjql"
    static let skinImage = "9oc0vepbk"
    static let isNew = "Popular"
    static let skinName = "jft"
}

struct DropBoxSkins_vatr: Equatable, Codable {
    let skinName: String
    let skinSourceImage: String
    let skinImage: String
    let isNew: Bool
    let filterCategory: String
}

struct SeedContent_vatr {
//    static let imagePath = "co2"
//    static let descrip = "3cbhb"
//    static let name = "hybk6"
//    static let seed = "8x045ehh2r"
//    static let isNew = "Popular"
    static let seedImage = "co2"
    static let seedDescrip = "3cbhb"
    static let seedName = "hybk6"
    static let seed = "8x045ehh2r"
    static let isNew = "Popular"
}

struct DropBoxSeed_vatr: Equatable, Codable {
    let imagePath: String
    let descrip: String
    let name: String
    let seed: String
    let isNew: Bool
}

struct AddonsContent_vatr {
    static let addonImages = "v-4bmq12"
    static let addonDescription = "kof37"
    static let addonTitle = "_1il"
    static let isNew = "Popular"
    static let file = "8lsv"
}

struct DropBoxAddons_vatr: Equatable, Codable {
    let addonImages: String
//    let addonImages: [String]
    let addonDescription: String
    let addonTitle: String
    let isNew: Bool
    let filterCategory: String
    let file: String
}

struct MapsContent_vatr {
    static let mapImages = "nmrqlcg"
    static let mapDescription = "4-v9nja"
    static let mapTitle = "xvx-c4rk"
    static let isNew = "Popular"
    static let file = "_8_k5"
}

struct DropBoxMaps_vatr: Equatable, Codable {
    let mapImages: String
  //  let mapImages: [String]
    let mapDescription: String
    let mapTitle: String
    let isNew: Bool
    let filterCategory: String
    let file: String
}


// Addon Editor Keys

struct AddonsEditorContent_vatr {
    static let jsonPath = "/addon_creator/crafty.json"
    static let mainKey = "vbdfjjg-90"
    static let addonMakerFolder = "addon_creator/"
    static let addonTag = "addon_creator"
    static let mcAddonFilePath = "addon_creator/"
    
//    static let jsonPath = "/Addon_Maker/addon_maker.json"
//    static let mainKey = "vbdfjjg-90"
//    static let addonMakerFolder = "Addon_Maker/"
//    static let addonTag = "AddonsEditor"
//    static let mcAddonFilePath = "Addon_Maker/"
}

struct AddonItem_vatr: Equatable, Codable {
    var idshka = String()
    var displayName = String()
    var displayImage = String()
    var categoryImage = String()
    var skin_variants = [SkinVariants_vatr]()
    var id = String()
    var type = String()
    var ranged_attack = [RangedAttack_vatr]()
    var health = Float()
    var move_speed = Float()
    var type_family = String()
    var file = String()
}

struct SkinVariants_vatr: Equatable, Codable {
    var idshka = String()
    var name = String()
    var displayImage = String()
}

struct RangedAttack_vatr: Equatable, Codable {
    var idshka = String()
    var enabled = Bool()
    var atk_speed = Double()
    var atk_radius = Double()
    var burst_shots = Double()
    var burst_interval = Double()
    var atk_types = String()
}
