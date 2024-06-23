
import Foundation
import RealmSwift

class ItemsRealmSession_vatr: Object, Identifiable {
    @Persisted(primaryKey: true) var id = ""
    @Persisted var itemsImages: String
//    @Persisted var addonImages: List<String>
    @Persisted var itemsDescription: String
    @Persisted var itemsTitle: String
    @Persisted var isNew: Bool
    @Persisted var isFavorite: Bool
    @Persisted var itemsImageData: Data?
    @Persisted var filterCategory: String
    @Persisted var file: String

    convenience init(itemsImages: String, itemsDescription: String, itemsTitle: String, isNew: Bool, isFavorite: Bool, itemsImageData: Data?, filterCategory: String, file: String) {
//    convenience init(addonImages: [String], addonDescription: String, addonTitle: String, isNew: Bool, isFavorite: Bool, addonImageData: Data?, filterCategory: String, file: String) {
        self.init()
        self.id = UUID().uuidString
        self.itemsImages = itemsImages
//        self.addonImages.append(objectsIn: addonImages)
        self.itemsDescription = itemsDescription
        self.itemsTitle = itemsTitle
        self.isNew = isNew
        self.isFavorite = isFavorite
        self.itemsImageData = itemsImageData
        self.filterCategory = filterCategory
        self.file = file
    }
}

class ItemsSession_vatr: Identifiable {
    let id: String
    let itemsImages: String
//    let addonImages: [String]
    let itemsDescription: String
    let itemsTitle: String
    let isNew: Bool
    let isFavorite: Bool
    let itemsImageData: Data?
    let filterCategory: String
    let file: String
    
    init(id: String, itemsImages: String, itemsDescription: String, itemsTitle: String, isNew: Bool, isFavorite: Bool, itemsImageData: Data?, filterCategory: String, file: String) {
        self.id = id
        self.itemsImages = itemsImages
        self.itemsDescription = itemsDescription
        self.itemsTitle = itemsTitle
        self.isNew = isNew
        self.isFavorite = isFavorite
        self.itemsImageData = itemsImageData
        self.filterCategory = filterCategory
        self.file = file
    }
}

