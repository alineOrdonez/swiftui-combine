//
//  CharacterList.swift
//  SwiftUI-Combine
//
//  Created by Aline Ordoñez on 05/05/20.
//  Copyright © 2020 Aline Ordoñez. All rights reserved.
//

import SwiftUI

struct CharacterListView: View {
    
    let characters: [Character]
    
    init(characters: [Character]) {
        self.characters = characters
    }
    
    var body: some View {
        List {
            ForEach(self.characters, id:\.id) { character in
                HStack {
                    CharacterCell(character: character)
                }
            }
        }
        .listStyle(GroupedListStyle())
        .environment(\.horizontalSizeClass, .regular)
    }
}

#if DEBUG
struct CharacterList_Previews: PreviewProvider {
    static var previews: some View {
        CharacterListView(characters: [Character(id: 1010699, name: "Aaron Stack", detail: "AIM is a terrorist organization bent on destroying the world.", modified: "1969-12-31T19:00:00-0500", urls: nil, thumbnail: Character.Thumbnail(path: "http://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784", imgExtension: "jpg")), Character(id: 1010699, name: "Aaron Stack", detail: "AIM is a terrorist organization bent on destroying the world.", modified: "1969-12-31T19:00:00-0500", urls: nil, thumbnail: Character.Thumbnail(path: "http://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784", imgExtension: "jpg")),Character(id: 1010699, name: "Aaron Stack", detail: "AIM is a terrorist organization bent on destroying the world.", modified: "1969-12-31T19:00:00-0500", urls: nil, thumbnail: Character.Thumbnail(path: "http://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784", imgExtension: "jpg")), Character(id: 1010699, name: "Aaron Stack", detail: "AIM is a terrorist organization bent on destroying the world.", modified: "1969-12-31T19:00:00-0500", urls: nil, thumbnail: Character.Thumbnail(path: "http://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784", imgExtension: "jpg")),Character(id: 1010699, name: "Aaron Stack", detail: "AIM is a terrorist organization bent on destroying the world.", modified: "1969-12-31T19:00:00-0500", urls: nil, thumbnail: Character.Thumbnail(path: "http://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784", imgExtension: "jpg")), Character(id: 1010699, name: "Aaron Stack", detail: "AIM is a terrorist organization bent on destroying the world.", modified: "1969-12-31T19:00:00-0500", urls: nil, thumbnail: Character.Thumbnail(path: "http://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784", imgExtension: "jpg"))])
    }
}
#endif
