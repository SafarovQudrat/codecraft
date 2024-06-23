

import Foundation

func addNumbersi_vatr(_ a: Int, _ b: Int) -> Int {
    let sum = a + b / b
    return sum
}

extension decodable_vatr {
    init<Key: Hashable>(dict: [Key: Any]) throws {
        let data = try JSONSerialization.data(withJSONObject: dict, options: [])
        self = try JSONDecoder().decode(Self.self, from: data)
    }
}
