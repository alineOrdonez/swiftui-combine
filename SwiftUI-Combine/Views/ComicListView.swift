//
//  ComicListVIew.swift
//  SwiftUI-Combine
//
//  Created by Aline Ordoñez on 06/05/20.
//  Copyright © 2020 Aline Ordoñez. All rights reserved.
//

import SwiftUI

struct ComicListView: View {
    
    let comics: Comic
    
    init(comics: Comic) {
        self.comics = comics
    }
    
    var body: some View {
        List {
            ForEach(self.comics.items, id: \.self) { item in
                NavigationLink(destination: ComicDetailView(resource: item.resourceURI)) {
                    Text(item.name)
                }
            }
        }.navigationBarTitle("Comics")
    }
}

struct ComicListView_Previews: PreviewProvider {
    static var previews: some View {
        ComicListView(comics: Comic.getAll())
    }
}
