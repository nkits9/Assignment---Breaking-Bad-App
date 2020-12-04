//
//  NetworkCharactersManager.swift
//  MVC-BreakingBadAPI
//
//  Created by MOHIT SHARMA on 04/12/20.
//

import Foundation

struct FavoritePersistenceManager {
    enum Keys: String {
        case favorites
    }
    private let userDefaults: UserDefaults

    init(userDefaults: UserDefaults = .standard) {
        self.userDefaults = userDefaults
    }


    func save(characters: [Character]) {
        userDefaults.set(
            try? PropertyListEncoder().encode(
                characters
            ),
            forKey: Keys.favorites.rawValue
        )
    }

    func load() -> [Character] {
        if let data = userDefaults.value(forKey: Keys.favorites.rawValue) as? Data {
            return try! PropertyListDecoder().decode([Character].self, from: data)
        }
        else {
            return []
        }
    }
}
