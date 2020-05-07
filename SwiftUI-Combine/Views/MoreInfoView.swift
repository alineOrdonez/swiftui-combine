//
//  MoreInfoView.swift
//  SwiftUI-Combine
//
//  Created by Aline Ordoñez on 06/05/20.
//  Copyright © 2020 Aline Ordoñez. All rights reserved.
//

import SwiftUI

struct MoreInfoView: View {
    
    @State var showSafari = false
    
    let character: Character
    
    init(character: Character) {
        self.character = character
    }
    
    var body: some View {
        
        let url: Character.Urls = self.character.urls!.filter{$0.type == "wiki"}.first!
        let detail = self.character.detail.isEmpty ? "No information available" : self.character.detail
        
        return VStack(spacing: 50) {
            Text(detail).font(.system(size: 20))
            Button(action: {
                self.showSafari = true
            }) {
                Text("More Info")
            }
            .sheet(isPresented: $showSafari) {
                SafariView(string: url.url)
            }
            
        }
    }
}

struct MoreInfoView_Previews: PreviewProvider {
    static var previews: some View {
        MoreInfoView(character: Character(id: 1010699, name: "Aaron Stack", detail: "AIM is a terrorist organization bent on destroying the world.", modified: "1969-12-31T19:00:00-0500", urls: [Character.Urls(type:"wiki", url:"https://www.marvel.com/characters/agent-x-nijo?utm_campaign=apiRef&utm_source=5d6eeb58aab1b013e83e7ae8fe7daa41")], thumbnail: Thumbnail(path: "http://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784", imgExtension: "jpg"), comics: Comic.getAll()))
    }
}
