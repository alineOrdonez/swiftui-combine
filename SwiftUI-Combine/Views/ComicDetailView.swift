//
//  ComicDetailView.swift
//  SwiftUI-Combine
//
//  Created by Aline Ordoñez on 07/05/20.
//  Copyright © 2020 Aline Ordoñez. All rights reserved.
//

import SwiftUI

struct ComicDetailView: View {
    
    @ObservedObject private var comicDetailVM = ComicDetailViewModel()
    @State var showSafari = false
    var resource: String
    
    init(resource: String) {
        self.resource = resource
    }
    
    var body: some View {
        return VStack {
            Text(comicDetailVM.title)
                .lineLimit(nil)
            Spacer()
            if !comicDetailVM.image.isEmpty {
                ImageView(url: comicDetailVM.image, placeholder: Text("Loading...")).aspectRatio(contentMode: .fit)
            }
            Spacer()
            Text(comicDetailVM.description)
                .padding()
                .lineLimit(nil)
            Form {
                ForEach(comicDetailVM.urls, id: \.self) { url in
                    Section() {
                        Button(action: {
                            self.showSafari = true
                        }) {
                            Text(url.type.capitalized)
                        }
                        .sheet(isPresented: self.$showSafari) {
                            SafariView(string: url.url)
                        }
                    }
                }
            }
        }.onAppear {
                self.comicDetailVM.fetchStoryDetails(resource: self.resource)
        }
    }
}

struct ComicDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ComicDetailView(resource: "http://gateway.marvel.com/v1/public/comics/24571")
    }
}
