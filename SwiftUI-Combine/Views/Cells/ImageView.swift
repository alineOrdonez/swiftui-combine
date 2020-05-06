//
//  ImageView.swift
//  SwiftUI-Combine
//
//  Created by Aline Ordoñez on 06/05/20.
//  Copyright © 2020 Aline Ordoñez. All rights reserved.
//

import SwiftUI

struct ImageView<Placeholder: View>: View {
    
    @ObservedObject private var loader: ImageLoader
    private let placeholder: Placeholder?
    
    init(url: String, placeholder: Placeholder? = nil) {
        loader = ImageLoader(url: url)
        self.placeholder = placeholder
    }
    
    var body: some View {
        image.onAppear(perform: loader.load)
            .onDisappear(perform: loader.cancel)
    }
    
    private var image: some View {
        Group {
            if loader.image != nil {
                Image(uiImage: loader.image!)
                    .resizable()
            } else {
                placeholder
            }
        }
    }
}

#if DEBUG
struct ImageView_Previews: PreviewProvider {
    static var previews: some View {
        ImageView(url: "http://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784.jpg", placeholder: Text("Loading..."))
    }
}
#endif
