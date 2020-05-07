//
//  DetailView.swift
//  SwiftUI-Combine
//
//  Created by Aline Ordoñez on 06/05/20.
//  Copyright © 2020 Aline Ordoñez. All rights reserved.
//

import SwiftUI

struct DetailView: View {
    
    @State private var optionSelected = 0
    @State var showSafari = false
    
    let character: Character
    
    init(character: Character) {
        self.character = character
    }
    
    var body: some View {
        let urls: Character.Urls = self.character.urls![0]
        let detail = self.character.detail.isEmpty ? "No information available" : self.character.detail
        
        return Form {
            Section() {
                Text(detail).font(.system(size: 20))
                
            }
            Section() {
                NavigationLink(destination: ComicListView(comics: self.character.comics!)) {
                    Text("Comics")
                }
            }
            Section() {
                Button(action: {
                    self.showSafari = true
                }) {
                    Text("More Info")
                }
                .sheet(isPresented: $showSafari) {
                    SafariView(string: urls.url)
                }
            }
        }.navigationBarTitle("Detail")
        
//        Form {
//            Section {
//                Picker(selection: $optionSelected, label: Text("")) {
//                    Text("Info").tag(0)
//                    Text("Comics").tag(1)
//                }.pickerStyle(SegmentedPickerStyle())
//
//                if optionSelected == 0 {
//                    MoreInfoView(character: self.character)
//                } else {
//                    ComicListView(comics: self.character.comics!)
//                }
//            }
//        }.navigationBarTitle("Detail")
    }
}


struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(character: Character(id: 1010699, name: "Aaron Stack", detail: "AIM is a terrorist organization bent on destroying the world.", modified: "1969-12-31T19:00:00-0500", urls: [Character.Urls(type:"wiki", url:"http://marvel.com/universe/Agent_X_(Nijo)?utm_campaign=apiRef&utm_source=5d6eeb58aab1b013e83e7ae8fe7daa41")], thumbnail: Thumbnail(path: "http://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784", imgExtension: "jpg"), comics: Comic.getAll()))
    }
}
