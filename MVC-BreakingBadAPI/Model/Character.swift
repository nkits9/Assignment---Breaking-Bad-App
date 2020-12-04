//
//  NetworkCharactersManager.swift
//  MVC-BreakingBadAPI
//
//  Created by MOHIT SHARMA on 04/12/20.
//
import Foundation

struct Character: Codable, Hashable {
    let name: String
    let occupation: [String]
    let img: String
    let status: String
    let nickname: String
    let appearance: [Int]
    let portrayed: String
    
    static func loadCharacter(by name: String, completion: @escaping (Character?, Error?) -> Void) {
        NetworkCharacterManager.getCharacter(name: name) { result in
            switch result {
            case .success(let characters):
                completion(characters.first, nil)
            case.failure(let error):
                completion(nil, error)
            }
        }
    }
}

