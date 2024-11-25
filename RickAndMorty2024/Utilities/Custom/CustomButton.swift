//
//  CustomButton.swift
//  RickAndMorty2024
//
//  Created by Jose Maria Mata on 24/9/24.
//

import SwiftUI

struct CustomButton: View {
    let title: String
    let action: () -> Void
    let disabled: Bool
    
    init(title: String, disabled: Bool, action: @escaping () -> Void) {
        self.title = title
        self.action = action
        self.disabled = disabled
    }
    
    var body: some View {
        Button {
            action()
        } label: {
            VStack {
                if disabled {
                    Text(title)
                        .simpleGray()
                        .padding(5)
                } else {
                    Text(title)
                        .simpleBlack()
                        .padding(5)
                }
            }
        }
        .padding(.horizontal, 10)
        .background(disabled ? .disableGray : .lightBlue)
        .clipShape(Capsule())
        .overlay(
            Capsule()
                .stroke(Color.gray, lineWidth: disabled ? 0 : 2)
        )
        .disabled(disabled)
    }
}

#Preview {
    CustomButton(title: "Title", disabled: false) {
        
    }
}
