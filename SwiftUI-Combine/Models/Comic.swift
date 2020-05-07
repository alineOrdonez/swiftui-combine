//
//  Comic.swift
//  SwiftUI-Combine
//
//  Created by Aline Ordoñez on 05/05/20.
//  Copyright © 2020 Aline Ordoñez. All rights reserved.
//

import Foundation

struct Comic: Codable, Identifiable {
    let id = UUID()
    let available: Int
    let items: [Item]
    
    enum CodingKeys: String, CodingKey {
        case available, items
    }
    
    struct Item: Codable, Hashable {
        let resourceURI: String
        let name: String
    }
}

extension Comic {
    static func getAll() -> Comic {
        return Comic(available: 12, items: [
            Item(resourceURI: "http://gateway.marvel.com/v1/public/comics/21366", name: "Avengers: The Initiative (2007) #14"),
            Item(resourceURI: "http://gateway.marvel.com/v1/public/comics/24571", name: "Avengers: The Initiative (2007) #14 (SPOTLIGHT VARIANT"),
            Item(resourceURI: "http://gateway.marvel.com/v1/public/comics/21546", name: "Avengers: The Initiative (2007) #15"),
            Item(resourceURI: "http://gateway.marvel.com/v1/public/comics/21741", name: "Avengers: The Initiative (2007) #16"),
            Item(resourceURI: "http://gateway.marvel.com/v1/public/comics/21975", name: "Avengers: The Initiative (2007) #17"),
            Item(resourceURI: "http://gateway.marvel.com/v1/public/comics/22299", name: "Avengers: The Initiative (2007) #18"),
            Item(resourceURI: "http://gateway.marvel.com/v1/public/comics/22300", name: "Avengers: The Initiative (2007) #18 (ZOMBIE VARIANT)"),
            Item(resourceURI: "http://gateway.marvel.com/v1/public/comics/22506", name: "Avengers: The Initiative (2007) #19"),
            Item(resourceURI: "http://gateway.marvel.com/v1/public/comics/8500", name: "Deadpool (1997) #44"),
            Item(resourceURI: "http://gateway.marvel.com/v1/public/comics/10223", name: "Marvel Premiere (1972) #35"),
            Item(resourceURI: "http://gateway.marvel.com/v1/public/comics/10224", name: "Marvel Premiere (1972) #36"),
            Item(resourceURI: "http://gateway.marvel.com/v1/public/comics/10225", name: "Marvel Premiere (1972) #37")
        ])
    }
}
