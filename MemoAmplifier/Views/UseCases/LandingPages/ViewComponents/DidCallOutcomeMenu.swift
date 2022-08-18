//
//  DidCallOutcomeMenu.swift
//  Magpie
//
//  Created by Paull Stanley on 7/26/22.
//

import SwiftUI

struct DidCallOutcomeMenu: View {
    @State var didCallUseCases: [MessagesUseCaseModel]
    @State var selected = ""
    
    var body: some View {
        Group {
            LazyVStack {
                Picker("", selection: $selected) {
                    ForEach(didCallUseCases) { outcome in
                        Text(outcome.userSelection)
                            .tag(outcome.value)
                            .fixedSize()
                    }
                    .id(UUID())
                }
                .onChange(of: selected) { newValue in
                    AppState.shared.selectedMessageForUseCase.actionTaken = selected
                }
                .labelsHidden()
            }
            .padding(.horizontal, 10)
        }
        
    }
}
