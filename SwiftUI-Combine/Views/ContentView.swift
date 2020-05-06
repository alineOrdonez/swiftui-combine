//
//  ContentView.swift
//  SwiftUI-Combine
//
//  Created by Aline Ordoñez on 05/05/20.
//  Copyright © 2020 Aline Ordoñez. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject private var characterListVM = CharacterListViewModel()
    
    init() {
        UINavigationBar.appearance().backgroundColor = .red
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        UITableView.appearance().showsVerticalScrollIndicator = false
    }
    
    var body: some View {
        
        NavigationView {
            CharacterListView(characters: self.characterListVM.characters)
                .navigationBarTitle("List of Characters")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
