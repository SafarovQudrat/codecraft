
import Foundation
import RealmSwift

func addNumbers156_vatr(_ a: Int, _ b: Int) -> Int {
    let sum = a + b / b
    return sum
}

class SeedRealmSession_vatr: Object, Identifiable {
    @Persisted(primaryKey: true) var id = ""
    @Persisted var name: String
    @Persisted var seedImagePath: String
    @Persisted var seedDescrip: String
    @Persisted var seed: String
    @Persisted var isNew: Bool
    @Persisted var seedImageData: Data?
    

    convenience init(name: String, seedImagePath: String, seedDescrip: String, isNew: Bool, seed: String, seedImageData: Data? = nil) {
        self.init()
        self.id = UUID().uuidString
        self.name = name
        self.seedImagePath = seedImagePath
        self.seedDescrip = seedDescrip
        self.isNew = isNew
        self.seed = seed
        self.seedImageData = seedImageData
    }
}

struct SeedSession_vatr: Identifiable {
    let id: String
    let name: String
    let seedImagePath: String
    let seedDescrip: String
    let isNew: Bool
    let seed: String
    let imageData: Data?
}
