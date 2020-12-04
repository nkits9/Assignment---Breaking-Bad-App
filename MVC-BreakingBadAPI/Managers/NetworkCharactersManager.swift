//
//  NetworkCharactersManager.swift
//  MVC-BreakingBadAPI
//
//  Created by MOHIT SHARMA on 04/12/20.
//

import Alamofire

enum NetworkCharactersManager {

    static func getCharacters(completionHandler: @escaping (Result<[Character], Error>) -> Void) {
        AF.request("https://www.breakingbadapi.com/api/characters?limit=20", method: .get).responseJSON { response in
            switch response.result {
            case .success:
                if let jsonData = response.data {
                    do {
                        let characters = try JSONDecoder().decode([Character].self, from: jsonData)
                        completionHandler(.success(characters))
                    } catch let error {
                        completionHandler(.failure(error))
                    }
                }
            case .failure(let error):
                completionHandler(.failure(error))
            }
        }
    }
}
