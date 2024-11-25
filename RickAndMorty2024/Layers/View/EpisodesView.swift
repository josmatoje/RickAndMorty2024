//
//  EpisodesView.swift
//  RickAndMorty2024
//
//  Created by Jose Maria Mata on 25/9/24.
//

import SwiftUI

struct EpisodesView: View {
    let characterName: String
    let episodes: [URL?]
    @ObservedObject var viewModel: EpisodeViewModel = EpisodeViewModel()
    
    var body: some View {
        VStack{
            if let episodes = viewModel.episodes {
                ScrollView {
                    LazyVStack {
                        ForEach(episodes) { episode in
                            EpisodeCell(episode: episode)
                        }
                    }
                }
            } else {
                Text(viewModel.error?.localizedDescription ?? "err")
            }
        }
        .onAppear{
            viewModel.loadEpisodes(urls: episodes)
        }
        .navigationBarTitle("Episode list from \(characterName)", displayMode: .inline)
        .background(.backgroundApp)
    }
    
    struct EpisodeCell: View {
        var episode: EpisodeBO
        
        var body: some View {
            VStack{
                HStack {
                    VStack(alignment: .leading) {
                        Text(episode.name)
                            .simpleBlack()
                        
                        Text(episode.airDate?.formatted(date: .abbreviated, time: .omitted) ?? "Unknown")
                    }
                    Spacer()
                    Text(episode.episode)
                        .font(.monospaced(.subheadline)())
                }
                .padding(20)
                Rectangle()
                    .frame(height: 1)
                    .background(.black)
            }
        }
    }
}

#Preview {
    EpisodesView(characterName: "Pepe", episodes: [URL(string: "https://rickandmortyapi.com/api/episode/1"),URL(string: "https://rickandmortyapi.com/api/episode/2")])
}
