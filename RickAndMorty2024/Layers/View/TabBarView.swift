//
//  TabView.swift
//  RickAndMorty2024
//
//  Created by Jose Maria Mata on 6/11/24.
//

import SwiftUI

struct TabBarView: View {
    @State var selection = 0
    
    var body: some View {
        TabView(selection: $selection) {
            Group{
                CharactersView()
                    .tabItem {
                        Label("Characters", systemImage: "person.2")
                    }
                
                EpisodesView(characterName: "", episodes: [])
                    .tabItem {
                        Label("Episodes", systemImage: "movieclapper")
                    }
                LocationsView()
                    .tabItem {
                        Label("Locations", systemImage: "location.circle")
                    }
            }
            .toolbar(.visible, for: .tabBar)
        }
        .tint(.greenAccent)
        .safeAreaInset(edge: .bottom) {
            Color.clear
                .frame(height: UIDevice.botomInsetSize + 40)
        }
    }
}

#Preview {
    TabBarView()
}
