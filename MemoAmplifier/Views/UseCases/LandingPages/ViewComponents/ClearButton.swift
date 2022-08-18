//
//  ClearButton.swift
//  Magpie
//
//  Created by Paull Stanley on 8/4/22.
//

import SwiftUI
struct ClearButton: ViewModifier {
    @Binding var text: String
    public func body(content: Content)-> some View {
        ZStack(alignment: .trailing) {
            content
            if(!text.isEmpty) {
                Button(action: {
                    self.text = ""
                })
                {
                    Image(systemName: "delete.left")
                }
                .buttonStyle(PlainButtonStyle())
                .padding(.trailing, 8)
            }
        }
    }
}
