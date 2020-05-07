//
//  ComicDetailViewModel.swift
//  SwiftUI-Combine
//
//  Created by Aline Ordoñez on 07/05/20.
//  Copyright © 2020 Aline Ordoñez. All rights reserved.
//

import Foundation
import Combine

class ComicDetailViewModel: ObservableObject {
    
    var image: String {
        if let thumbnail = self.detail.thumbnail {
            return "\(thumbnail.path).\(thumbnail.imgExtension)"
        } else {
            return ""
        }
    }
    
    var description: String {
        return self.detail.description ?? "Description unavailable"
    }
    
    var title: String {
        return self.detail.title
    }
    
    var urls: [ComicDetail.Urls] {
        return self.detail.urls
    }
    
    private var cancellable: AnyCancellable?
    
    @Published private var detail = ComicDetail.placeholder()
    
    func fetchStoryDetails(resource: String) {
        let resourceId = resource.components(separatedBy: "/")
        let comicId = String(resourceId.last!)
        self.cancellable = WebService().getStoryById(storyId: comicId)
            .sink(receiveCompletion: { _ in }, receiveValue: { detail in
                if let detail = detail.data?.results?.first {
                    self.detail = detail
                }
            })
    }
}
