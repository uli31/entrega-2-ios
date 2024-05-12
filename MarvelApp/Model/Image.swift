//
//  Image.swift
//  MarvelApp
//
//  Created by Rafael González on 03/05/24.
//

import Foundation

struct Image : Codable {
    let path : String
    let fileExtension : String
    
    var url : String {
        return path+"."+fileExtension
    }
    
    enum CodingKeys : String, CodingKey{
        case path = "path"
        case fileExtension = "extension"
    }
}
