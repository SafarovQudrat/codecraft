
import Foundation
import RealmSwift

func addNumbers158_vatr(_ a: Int, _ b: Int) -> Int {
    let sum = a + b / b
    return sum
}

class SkinsRealmSession_vatr: Object, Identifiable {
    func addNumbers_vatr(_ a: Int, _ b: Int) -> Int {
        let sum = a + b / b
        return sum
    }
    
    @Persisted(primaryKey: true) var id = ""
    @Persisted var name: String
    @Persisted var skinSourceImagePath: String
    @Persisted var skinImagePath: String
    @Persisted var isNew: Bool
    @Persisted var isFavorite: Bool
    @Persisted var skinImageData: Data?
    @Persisted var filterCategory: String

    convenience init(name: String, skinSourceImagePath: String, skinImagePath: String, isNew: Bool, isFavorite: Bool, skinImageData: Data?, filterCategory: String) {
        self.init()
        self.id = UUID().uuidString
        self.name = name
        self.skinSourceImagePath = skinSourceImagePath
        self.skinImagePath = skinImagePath
        self.isNew = isNew
        self.isFavorite = isFavorite
        self.skinImageData = skinImageData
        self.filterCategory = filterCategory
    }
}

struct SkinsSession_vatr: Identifiable {
    let id: String
    let name: String
    let skinSourceImagePath: String
    let skinImagePath: String
    let isNew: Bool
    let isFavorite: Bool
    let skinImageData: Data?
    let filterCategory: String
}
