
import Foundation
import RealmSwift

class AddonsRealmSession_vatr: Object, Identifiable {
    @Persisted(primaryKey: true) var id = ""
    @Persisted var addonImages: String
//    @Persisted var addonImages: List<String>
    @Persisted var addonDescription: String
    @Persisted var addonTitle: String
    @Persisted var isNew: Bool
    @Persisted var isFavorite: Bool
    @Persisted var addonImageData: Data?
    @Persisted var filterCategory: String
    @Persisted var file: String

    convenience init(addonImages: String, addonDescription: String, addonTitle: String, isNew: Bool, isFavorite: Bool, addonImageData: Data?, filterCategory: String, file: String) {
//    convenience init(addonImages: [String], addonDescription: String, addonTitle: String, isNew: Bool, isFavorite: Bool, addonImageData: Data?, filterCategory: String, file: String) {
        self.init()
        self.id = UUID().uuidString
        self.addonImages = addonImages
//        self.addonImages.append(objectsIn: addonImages)
        self.addonDescription = addonDescription
        self.addonTitle = addonTitle
        self.isNew = isNew
        self.isFavorite = isFavorite
        self.addonImageData = addonImageData
        self.filterCategory = filterCategory
        self.file = file
    }
}

struct AddonsSession_vatr: Identifiable {
    let id: String
    let addonImages: String
//    let addonImages: [String]
    let addonDescription: String
    let addonTitle: String
    let isNew: Bool
    let isFavorite: Bool
    let addonImageData: Data?
    let filterCategory: String
    let file: String
}
