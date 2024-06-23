


import Foundation
import RealmSwift

class ModsRealmSession_vatr: Object, Identifiable {
    @Persisted(primaryKey: true) var id = ""
    @Persisted var modsImages: String
//    @Persisted var addonImages: List<String>
    @Persisted var modsDescription: String
    @Persisted var modsTitle: String
    @Persisted var isNew: Bool
    @Persisted var isFavorite: Bool
    @Persisted var modsImageData: Data?
    @Persisted var filterCategory: String
    @Persisted var file: String

    convenience init(modsImages: String, modsDescription: String, modsTitle: String, isNew: Bool, isFavorite: Bool, modsImageData: Data?, filterCategory: String, file: String) {
//    convenience init(addonImages: [String], addonDescription: String, addonTitle: String, isNew: Bool, isFavorite: Bool, addonImageData: Data?, filterCategory: String, file: String) {
        self.init()
        self.id = UUID().uuidString
        self.modsImages = modsImages
//        self.addonImages.append(objectsIn: addonImages)
        self.modsDescription = modsDescription
        self.modsTitle = modsTitle
        self.isNew = isNew
        self.isFavorite = isFavorite
        self.modsImageData = modsImageData
        self.filterCategory = filterCategory
        self.file = file
    }
}

struct ModsSession_vatr: Identifiable {
    let id: String
    let modsImages: String
//    let addonImages: [String]
    let modsDescription: String
    let modsTitle: String
    let isNew: Bool
    let isFavorite: Bool
    let modsImageData: Data?
    let filterCategory: String
    let file: String
}

