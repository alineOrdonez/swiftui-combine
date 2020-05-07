//
//  CharacterListViewModel.swift
//  SwiftUI-Combine
//
//  Created by Aline Ordoñez on 05/05/20.
//  Copyright © 2020 Aline Ordoñez. All rights reserved.
//

import Foundation
import Combine

class CharacterListViewModel: ObservableObject {
    
    private var cancellable: AnyCancellable?
    
    @Published var characters = [Character]()
    
    init() {
        fetchCharacters()
    }
    
    func fetchCharacters() {
        self.cancellable = WebService().getCharacters()
            .sink(receiveCompletion: { _ in }, receiveValue: { detail in
                if let characters = detail.data?.results {
                    self.characters = characters
                }
            })
    }
}
