//
//  ContentView.swift
//  RickAndMorty2024
//
//  Created by Jose Maria Mata on 23/9/24.
//

import SwiftUI

struct CharactersView: View {
    @ObservedObject var viewModel: CharactersViewModel = CharactersViewModel()
    @State var searching: Bool = false
    
    var body: some View {
        VStack {
//            HStack {
//                CustomButton(title: "Prev", disabled: viewModel.pageInfo?.prev == nil) {
//                    viewModel.loadCharacters(link: viewModel.pageInfo?.prev ?? "")
//                }
//                Spacer()
//                CustomButton(title: "Next", disabled: viewModel.pageInfo?.next == nil) {
//                    
//                        viewModel.loadCharacters(link: viewModel.pageInfo?.next ?? "")
//                }
//            }
//            .padding(.horizontal, 30)
            if viewModel.searching {
                VStack {
                    Spacer()
                    ProgressView()
                        .controlSize(.extraLarge)
                    Spacer()
                }
            }else if let chars = viewModel.characters {
                NavigationView{
                    ScrollView {
                        LazyVStack(spacing: 0, pinnedViews: .sectionHeaders) {
                            Section {
                                ForEach(chars) { character in
                                    NavigationLink {
                                        CharacterDetailView(character: character)
                                    } label: {
                                        CharacterCell(character: character)
                                    }
                                    .tint(.black)
                                }
                            } header: {
                                HeaderView(searchName: $viewModel.searchName) {
                                    if(!viewModel.searching) {
                                        viewModel.searching = true
                                        viewModel.refreshList()
                                    }
                                }
                            }
                            
                        }
                        .navigationDestination(for: CharacterBO.self) { character in
                            CharacterDetailView(character: character)
                        }
                    }
                    .ignoresSafeArea()
                    .onAppear{
                        UIScrollView.appearance().bounces = false
                    }
                    .background(.backgroundApp)
                }
            } else {
                Text(viewModel.error?.localizedDescription ?? "err")
            }
        }
        .background(.backgroundApp)
        .safeAreaInset(edge: .bottom) {
            Color.clear
                .frame(height: UIDevice.botomInsetSize + 40)
        }
    }
    
    struct CharacterCell: View {
        var character: CharacterBO
        
        var body: some View {
            VStack(spacing: 0){
                HStack {
                    RemoteImage(url: character.image)
                        .frame(width: 100, height: 100)
                    Text(character.name)
                        .simpleBlack()
                    Spacer()
                }
                Rectangle()
                    .frame(height: 1)
                    .background(.black)
            }
            .background(LinearGradient(colors: [.backgroundApp, .traslucentBackground, .backgroundApp], startPoint: .top, endPoint: .bottom))
        }
    }
    
    struct HeaderView: View {
        @State var searchName: Binding<String>
        var action: () -> Void
        var body: some View {
            VStack(spacing: 0) {
                Color.darkTopBlue
                    .frame(height: UIDevice.topInsetSize)
                HStack{
                    Spacer()
                    Text("Characters")
                        .titleBlack()
                    Spacer()
                }
                .background {
                    LinearGradient(colors: [.darkGreenAccent, .greenAccent, .darkGreenAccent, .greenAccent, .darkGreenAccent], startPoint: .topLeading, endPoint: .bottomTrailing)
                }
//                .border(.greenAccent, width: 3)
                .mask {
                    RoundedRectangle(cornerRadius: 10, style: .continuous)
                }
                .padding(.horizontal, 20)
                .background(LinearGradient(colors: [.darkTopBlue, .lightBlue], startPoint: .top, endPoint: .bottom))
//                .background(LinearGradient(colors: [.backgroundApp, .traslucentBackground], startPoint: .top, endPoint: .bottom))
                //                                    .padding(.top, UIDevice.topInsetSize)
                //                            .padding(.bottom, 10)
                CustomTextField(
                    placeHolder: "Search name...",
                    text: searchName,
                    action: {
                        action()
                    })
                .padding(20)
                .background(LinearGradient(colors: [.lightBlue, .clear], startPoint: .top, endPoint: .bottom))
//                .background(.ultraThinMaterial)
            }
//            .background(Color.traslucentBackground)
//            .background(.backgroundApp)
        }
    }

}

#Preview {
    CharactersView()
}
