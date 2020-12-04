//
//  NetworkCharactersManager.swift
//  MVC-BreakingBadAPI
//
//  Created by MOHIT SHARMA on 04/12/20.
//
struct SearchRequest {
    
    let characterName: String!

    var isValid: Bool {
        characterName.isEmpty 
    }

    var query: String {
        characterName?.trimmingCharacters(in:
            .whitespacesAndNewlines)
            .replacingOccurrences(of: " ", with: "+")
            .lowercased()
            .capitalized ?? ""
    }
}
