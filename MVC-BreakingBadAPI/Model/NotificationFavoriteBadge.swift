//
//  NetworkCharactersManager.swift
//  MVC-BreakingBadAPI
//
//  Created by MOHIT SHARMA on 04/12/20.
//
import Foundation

enum NotificationFavoriteBadge {
    
    static func addObserver(with selector: Selector, observer: Any) {
        NotificationCenter.default.addObserver(observer, selector: selector, name: .favoritesBadgeChange, object: nil)
    }
    
    static func post() {
        NotificationCenter.default.post(name: .favoritesBadgeChange, object: nil)
    }
}

extension NotificationCenter {

}
