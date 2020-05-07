//
//  Character.swift
//  SwiftUI-Combine
//
//  Created by Aline Ordoñez on 05/05/20.
//  Copyright © 2020 Aline Ordoñez. All rights reserved.
//

import Foundation

struct CBaseRequest: Encodable {
    
    let apikey = SecretKey.publicApiKey.rawValue
    let ts: Int64
    let hash: String
    let limit: Int
    let offset: Int
    init(offset:Int = 0, limit:Int = 1) {
        let timestamp = Date().timeIntervalSince1970
        let tsValue = Int64(timestamp * 1000)
        self.ts = tsValue
        
        let keyMD5Value = SecurityHandler.MD5(string: "\(tsValue)" + SecretKey.privateApiKey.rawValue  + self.apikey)
        let hashValue = keyMD5Value.hexEncodedString()
        self.hash = hashValue
        
        self.limit = limit
        self.offset = offset
    }
    
}

struct CCharactersResponse: Codable {
    let code: Int
    let status: String
    let data: ResponseData?
    
    struct ResponseData: Codable {
        let offset: Int
        let limit: Int
        let total: Int
        let count: Int
        let results:[Character]?
    }
}

struct Character: Codable, Identifiable {
    let id: Int
    let name: String
    let detail: String
    let modified: String
    let urls: [Urls]?
    let thumbnail: Thumbnail?
    let comics: Comic?
    
    enum CodingKeys: String, CodingKey {
        case id, name, modified, urls, thumbnail, comics
        case detail = "description"
    }
    
    struct Urls: Codable {
        let type: String
        let url: String
    }
}

struct Thumbnail: Codable {
    let path: String
    let imgExtension: String
    
    enum CodingKeys: String, CodingKey {
        case path
        case imgExtension = "extension"
    }
}

extension Character {
    static func getCharacter() -> Character {
        return Character(id: 1010699, name: "Aaron Stack", detail: "AIM is a terrorist organization bent on destroying the world.", modified: "1969-12-31T19:00:00-0500", urls: nil, thumbnail: Thumbnail(path: "http://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784", imgExtension: "jpg"), comics: Comic.getAll())
    }
}
