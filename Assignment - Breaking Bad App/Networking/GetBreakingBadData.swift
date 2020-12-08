//
//  GetBreakingBadData.swift
//  Assignment - Breaking Bad App
//
//  Created by MOHIT SHARMA on 04/12/20.
//

import UIKit

func getBreakingBadData(completionForResponse: @escaping (_ characters: [BBCharacter]) -> Void) {
    
    var BBCharacters = [BBCharacter]()
    
    let url = URL(string: "https://www.breakingbadapi.com/api/characters?limit=20")
    
    var request = URLRequest(url: url!)
    
    request.httpMethod = "GET"
    
    URLSession.shared.dataTask(with: request) { data, response, error in
        guard error == nil else {
            print("error while requesting data", error?.localizedDescription as Any)
            return
        }
        
        guard let statusCode = (response as? HTTPURLResponse)?.statusCode, statusCode >= 200 && statusCode <= 299 else {
            print("status code was other than 2xx", (response as! HTTPURLResponse).statusCode,"🍅")
            return
        }
        
        guard let data = data else {
            print("request for data failed")
            return
        }
        
        print(String(data: data, encoding: .utf8)!, "🀄️")
        
        let parsedResult : [[String: AnyObject]]!
        
        do {
            parsedResult = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [[String: AnyObject]]
        } catch {
            print("error parsing data", error.localizedDescription)
            return
        }
        
//        print("✅ ", parsedResult, " ✅")
    

        for character in parsedResult {
            guard let name = character["name"] as? String else {
                return
            }
            guard let birthday = character["birthday"] as? String else {
                return
            }
            guard let status = character["status"] as? String else {
                return
            }
            guard let image = character["img"] as? String else {
                return
            }
            let bbCharacter = BBCharacter(name: name, birthday: birthday, status: status, image: image)
            BBCharacters.append(bbCharacter)
        }
        
        completionForResponse(BBCharacters)
                
    }.resume()
}

