//
//  NetworkCharactersManager.swift
//  MVC-BreakingBadAPI
//
//  Created by MOHIT SHARMA on 04/12/20.
//

class FavoriteList {

    static var shared = FavoriteList()

    private let persistenceManager = FavoritePersistenceManager()
    
    private(set) var favorites: [Character] {
        didSet {
            save()
            // Notify about changes
            NotificationFavoriteBadge.post()
        }
    }

    private init() {
        favorites = persistenceManager.load()
    }

    private func load() -> [Character] {
        persistenceManager.load()
    }

    private func save() {
        persistenceManager.save(characters: favorites)
    }
}

extension FavoriteList {

    //FavoriteList.shared.isFavorite(character:)
    func isFavorite(character: Character) -> Bool {
        favorites.contains(character)
    }

    func add(character: Character) {
        guard !favorites.contains(character) else { return }
        favorites.append(character)
    }

    func remove(character: Character) {
        guard favorites.contains(character) else { return }
        favorites.removeAll(where: { $0 == character })
    }
}
