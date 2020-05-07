//
//  WebService.swift
//  SwiftUI-Combine
//
//  Created by Aline Ordoñez on 05/05/20.
//  Copyright © 2020 Aline Ordoñez. All rights reserved.
//

import Foundation
import Combine

class WebService {
    
    func getStoryById(storyId: String) -> AnyPublisher<CComicDetailResponse, Error> {
        
        let request: CBaseRequest = CBaseRequest(offset: 0, limit: 100)
        var queryString = ""
        do {
            let jsonEncoder = JSONEncoder()
            let body = try jsonEncoder.encode(request.self)
            if let dicParam = try? JSONSerialization.jsonObject(with: body, options: []) as? [String: Any] {
                for (key, value) in dicParam {
                    queryString.append(queryString.isEmpty ? "?": "&")
                    queryString.append("\(key)=\(value)")
                }
            }
        } catch {
            fatalError("Invalid URL")
        }
        guard let url = URL(string: "https://gateway.marvel.com/\(EndpointUrl.comics.rawValue)/\(storyId)\(queryString)".trimmingCharacters(in: .whitespacesAndNewlines)) else {
            fatalError("Invalid URL")
        }
        
        return URLSession.shared.dataTaskPublisher(for: url)
            .receive(on: RunLoop.main)
            .mapError { error -> ServiceError in
                return ServiceError.domainError(description: error.localizedDescription, errorCode: error.errorCode)
            }
            .map(\.data)
            .decode(type: CComicDetailResponse.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
    
    func getCharacters() -> AnyPublisher<CCharactersResponse, Error> {
        
        let request: CBaseRequest = CBaseRequest(offset: 0, limit: 100)
        var queryString = ""
        do {
            let jsonEncoder = JSONEncoder()
            let body = try jsonEncoder.encode(request.self)
            if let dicParam = try? JSONSerialization.jsonObject(with: body, options: []) as? [String: Any] {
                for (key, value) in dicParam {
                    queryString.append(queryString.isEmpty ? "?": "&")
                    queryString.append("\(key)=\(value)")
                }
            }
        } catch {
            fatalError("Invalid URL")
        }
        guard let url = URL(string: "https://gateway.marvel.com/\(EndpointUrl.characters.rawValue)\(queryString)".trimmingCharacters(in: .whitespacesAndNewlines)) else {
            fatalError("Invalid URL")
        }
        
        return URLSession.shared.dataTaskPublisher(for: url)
            .receive(on: RunLoop.main)
            .map(\.data)
            .decode(type: CCharactersResponse.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
}
