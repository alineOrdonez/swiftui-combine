//
//  ComicDetail.swift
//  SwiftUI-Combine
//
//  Created by Aline Ordoñez on 07/05/20.
//  Copyright © 2020 Aline Ordoñez. All rights reserved.
//

import Foundation

struct CComicDetailResponse: Codable {
    let code: Int
    let status: String
    let data: ResponseData?
    
    struct ResponseData: Codable {
        let offset: Int
        let limit: Int
        let total: Int
        let count: Int
        let results:[ComicDetail]?
    }
}

struct ComicDetail: Codable, Identifiable {
    let id: Int
    let title: String
    let description: String?
    let urls: [Urls]
    let thumbnail: Thumbnail?
    
    struct Urls: Codable, Identifiable, Hashable {
        let id = UUID()
        let type: String
        let url: String
    }
}

extension ComicDetail {
    static func placeholder() -> ComicDetail {
        return ComicDetail(id: 0, title: "", description: "", urls: [ComicDetail.Urls(type: "", url: "http://marvel.com/comics/issue/21366/avengers_the_initiative_2007_14?utm_campaign=apiRef&utm_source=5d6eeb58aab1b013e83e7ae8fe7daa41")], thumbnail: nil)
    }
}
