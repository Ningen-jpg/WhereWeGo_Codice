//
//  City.swift
//  WhereWeGoApptvOS
//
//  Created by Stefano Leva on 18/07/22.
//

import Foundation

struct City: Decodable{
    let name: String
    let video: String
}

extension City{
    static func fetchQuestions() -> [City] {
        return JsonUtility.readJSON(fileName: "Cities") as [City]
    }
}
