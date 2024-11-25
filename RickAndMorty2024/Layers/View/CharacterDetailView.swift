//
//  CharacterDetailView.swift
//  RickAndMorty2024
//
//  Created by Jose Maria Mata on 23/9/24.
//

import SwiftUI

struct CharacterDetailView: View {
    var character: CharacterBO
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                ScrollView {
                    RemoteImage(url: character.image)
                        .frame(width: geometry.size.width, height: geometry.size.height/2)
                    VStack(alignment: .leading) {
                        HStack {
                            Text("Status:")
                                .bold()
                                .padding(.trailing, 10)
                                .padding(.leading, 1)
                                .padding(.vertical, 1)
                            Text(character.status.rawValue)
                            Spacer()
                        }
                        HStack {
                            Text("Specie:")
                                .bold()
                                .padding(.trailing, 10)
                                .padding(.leading, 1)
                                .padding(.vertical, 1)
                            Text(character.species)
                            Spacer()
                        }
                        HStack {
                            Text("Type:")
                                .bold()
                                .padding(.trailing, 10)
                                .padding(.leading, 1)
                                .padding(.vertical, 1)
                            Text(character.type)
                            Spacer()
                        }
                        HStack {
                            Text("Gender:")
                                .bold()
                                .padding(.trailing, 10)
                                .padding(.leading, 1)
                                .padding(.vertical, 1)
                            Text(character.gender.rawValue)
                            Spacer()
                        }
                        HStack {
                            Text("Origin:")
                                .bold()
                                .padding(.trailing, 10)
                                .padding(.leading, 1)
                                .padding(.vertical, 1)
                            Text(character.species)
                            Spacer()
                        }
                        HStack {
                            Text("Location:")
                                .bold()
                                .padding(.trailing, 10)
                                .padding(.leading, 1)
                                .padding(.vertical, 1)
                            Text(character.origin.name)
                            Spacer()
                        }
                        HStack {
                            Text("Created:")
                                .bold()
                                .padding(.trailing, 10)
                                .padding(.leading, 1)
                                .padding(.vertical, 1)
                            Text(character.created?.formatted(.dateTime) ?? "Unknown")
                            Spacer()
                        }
                        HStack{
                            Text("Episodes:")
                                .bold()
                                .padding(.trailing, 10)
                                .padding(.leading, 1)
                                .padding(.vertical, 1)
                            Spacer()
                            NavigationLink {
                                EpisodesView(characterName: character.name, episodes: character.episode)
                            } label: {
                                Text("More")
                            }
                            .padding(10)
                            
                        }
                        if character.episode.count>0 {
                            ScrollView(.horizontal) {
                                LazyHStack {
                                    Rectangle()
                                        .frame(width: 1)
                                    ForEach(character.episode, id: \.?.lastPathComponent) { episode in
                                        HStack {
                                            Text("Episode")
                                            Text(episode?.lastPathComponent ?? "unknown")
                                            Rectangle()
                                                .frame(width: 1)
                                        }
                                    }
                                }
                            }
                            .frame(height: 20)
                        } else {
                            HStack {
                                Rectangle()
                                    .frame(width: 1)
                                Text("Any")
                                Rectangle()
                                    .frame(width: 1)
                            }
                        }
                    }
                    .padding(.horizontal, 20)
                }
            }
            .statusBarHidden(true)
            .navigationBarTitle("\(character.name)", displayMode: .large)
            .background(.backgroundApp)
        }
    }
}

#Preview {
    CharacterDetailView(character: CharacterBO(id: 1, name: "Pepe", status: .alive, species: "Human", type: "Person", gender: .genderless, origin: LocationBO(name: "Tierra", url: URL(string: "")), location: LocationBO(name: "Tierra", url: URL(string: "")), image: URL(string: ""), episode: [], url: URL(string: ""), created: Date()))
}
