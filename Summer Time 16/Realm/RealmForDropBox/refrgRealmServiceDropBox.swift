
import RealmSwift

final class RealmServiceDropBox_vatr {
    private init() {}
    static let shared = RealmServiceDropBox_vatr()
    
    private var realm: Realm = {
        do {
            return try Realm()
        } catch {
            print(error)
            fatalError(error.localizedDescription)
        }
    }()
    
    func create_vatr<T: Object>(_ object: T) {
        do {
            try realm.write {
                realm.add(object)
            }
        } catch {
            AppDelegate.log(error)
        }
    }
    
    func create_vatr<T: Object>(_ object: [T]) {
        do {
            try realm.write {
                realm.add(object)
            }
        } catch {
            AppDelegate.log(error)
        }
    }
    
    func update_vatr<T: Object>(_ object: T, with dictionary: [String: Any?]) {
        do {
            try realm.write {
                for (key, value) in dictionary {
                    object.setValue(value, forKey: key)
                }
            }
        } catch {
            AppDelegate.log(error)
        }
    }
    
    func delete_vatr<T: Object>(_ object: T) {
        do {
            try realm.write {
                realm.delete(object)
            }
        } catch {
            AppDelegate.log(error)
        }
    }
    
    func readAll_vatr<T: Object>(_ object: T.Type) -> Results<T> {
        realm.objects(object)
    }
    
    func read_vatr<T: Object>(_ object: T.Type, id: String) -> T? {
        realm.object(ofType: object, forPrimaryKey: id)
    }
}
