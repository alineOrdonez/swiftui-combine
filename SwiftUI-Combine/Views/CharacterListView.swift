//
//  CharacterList.swift
//  SwiftUI-Combine
//
//  Created by Aline Ordoñez on 05/05/20.
//  Copyright © 2020 Aline Ordoñez. All rights reserved.
//

import SwiftUI

struct CharacterListView: View {
    
    @State private var searchName: String = ""
    @ObservedObject private var characterListVM = CharacterListViewModel()
    
    let characters: [Character]
    
    init(characters: [Character]) {
        self.characters = characters
    }
    
    var body: some View {
        List {
            SearchBar(text: $searchName)
            ForEach(self.characters.filter {
                self.searchName.isEmpty ? true : $0.name.localizedCaseInsensitiveContains(self.searchName)
            }, id:\.id) { character in
                ZStack {
                    CharacterCell(character: character)
                    NavigationLink(destination: DetailView(character: character)) {
                        EmptyView()
                    }.buttonStyle(PlainButtonStyle())
                }
            }
        }
        .environment(\.horizontalSizeClass, .regular)
    }
}

#if DEBUG
struct CharacterList_Previews: PreviewProvider {
    static var previews: some View {
        CharacterListView(characters: [Character(id: 1010699, name: "Aaron Stack", detail: "AIM is a terrorist organization bent on destroying the world.", modified: "1969-12-31T19:00:00-0500", urls: nil, thumbnail: Thumbnail(path: "http://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784", imgExtension: "jpg"), comics: Comic.getAll()), Character(id: 1010699, name: "Barty Stack", detail: "AIM is a terrorist organization bent on destroying the world.", modified: "1969-12-31T19:00:00-0500", urls: nil, thumbnail: Thumbnail(path: "http://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784", imgExtension: "jpg"), comics: Comic.getAll()),Character(id: 1010699, name: "Aaron Stack", detail: "AIM is a terrorist organization bent on destroying the world.", modified: "1969-12-31T19:00:00-0500", urls: nil, thumbnail: Thumbnail(path: "http://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784", imgExtension: "jpg"), comics: Comic.getAll()), Character(id: 1010699, name: "Aaron Stack", detail: "AIM is a terrorist organization bent on destroying the world.", modified: "1969-12-31T19:00:00-0500", urls: nil, thumbnail: Thumbnail(path: "http://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784", imgExtension: "jpg"), comics: Comic.getAll()),Character(id: 1010699, name: "Aaron Stack", detail: "AIM is a terrorist organization bent on destroying the world.", modified: "1969-12-31T19:00:00-0500", urls: nil, thumbnail: Thumbnail(path: "http://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784", imgExtension: "jpg"), comics: Comic.getAll()), Character(id: 1010699, name: "Aaron Stack", detail: "AIM is a terrorist organization bent on destroying the world.", modified: "1969-12-31T19:00:00-0500", urls: nil, thumbnail: Thumbnail(path: "http://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784", imgExtension: "jpg"), comics: Comic.getAll())])
    }
}
#endif
