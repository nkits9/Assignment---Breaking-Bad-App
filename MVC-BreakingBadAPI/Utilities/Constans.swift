//
//  NetworkCharactersManager.swift
//  MVC-BreakingBadAPI
//
//  Created by MOHIT SHARMA on 04/12/20.
//
import UIKit

enum Images {
    static let bbLogo = UIImage(named: "bbLogo")
    static let placeholder = UIImage(named: "placeholder")
    static let testWhite = UIImage(named: "testWhite")
    static let heartIcon = UIImage(named: "heartIcon")
    static let unselectedHeart = UIImage(named: "unselectedHeart")
}

enum AlertTitle {
    static let oops = "Oops..."
    static let error = "Error"
    static let bye = "Bye, bye... "
}

enum AlertMessage {
    static let withoutName = "I do not know characters without a name 👀"
    static let somethingWrong = "Something Wrong, try later"
}

enum EmptyScreen {
    static let empty = "No Favorites?\nAdd one on the search screen."
}
