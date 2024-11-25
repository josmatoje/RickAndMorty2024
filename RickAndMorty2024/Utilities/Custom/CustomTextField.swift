//
//  CustomTextField.swift
//  RickAndMorty2024
//
//  Created by Jose Maria Mata on 24/9/24.
//

import SwiftUI

struct CustomTextField: View {
    
    @Environment(\.colorScheme) var colorScheme
    
    let placeHolder: String
    var text: Binding<String>
    let action: () -> Void
    
    var body: some View {
        HStack {
            TextField(placeHolder, text: text)
                .textFieldStyle(.roundedBorder)
                .border(.blackApp)
                .onChange(of: text.wrappedValue) { _,_ in
                    action()
                }
                .overlay {
                    HStack{
                        Spacer()
                        Button {
                            text.wrappedValue = ""
                        } label: {
                            Image(systemName: "xmark.circle.fill")
                                .tint(.blackApp)
                        }
                        .padding(5)
                    }
                }
                .font(.custom("Bradley Hand", size: 20))
        }
    }
}

#Preview {
    CustomTextField(placeHolder: "Placeholder", text: .constant(""), action: {})
}
