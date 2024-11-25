//
//  StateView.swift
//  RickAndMorty2024
//
//  Created by Jose Maria Mata on 21/10/24.
//

import SwiftUI

enum StateScreen{
    case splash
    case access
}

struct StateView: View {
    @State var state: StateScreen = .splash
    
    var body: some View {
        VStack{
            switch state {
            case .splash:
                splash
//                    .transition(.move(edge:.bottom))
                    .transition(.scale(100))
                    .transition(.blurReplace())
            case .access:
                TabBarView()
//                    .transition(.move(edge: .top))
            }
        }
        .animation(.easeInOut(duration: 1), value: state)
    }
    
    var splash: some View {
        ZStack{
            Color.backgroundSplash
            Image("splashIcon")
        }
        .ignoresSafeArea()
        .onAppear{
            Timer.scheduledTimer(withTimeInterval: 3, repeats: false) { _ in
                state = .access
            }
        }
    }
}

#Preview {
    StateView()
}
