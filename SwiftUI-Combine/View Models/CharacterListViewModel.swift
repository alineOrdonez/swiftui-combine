//
//  CharacterListViewModel.swift
//  SwiftUI-Combine
//
//  Created by Aline Ordoñez on 05/05/20.
//  Copyright © 2020 Aline Ordoñez. All rights reserved.
//

import Foundation

class CharacterListViewModel: ObservableObject {
    
    @Published var characters = [Character]()
    
    init() {
        fetchCharacters()
    }
    
    func fetchCharacters() {
        fetchAll { result in
            switch result {
            case .failure(let error):
                print(error.errorDescription!)
                break
            case .success(let response):
                if let results = response.data?.results {
                    self.characters = results
                }
                break
            }
        }
    }
    
    func fetchAll(completion: @escaping (Result<CCharactersResponse>) -> Void) {
        let request: CBaseRequest = CBaseRequest(offset: characters.count, limit: 100)
        WebService().makeRequest(with: request, and: EndpointUrl.characters.rawValue, completion: completion)
    }
}
