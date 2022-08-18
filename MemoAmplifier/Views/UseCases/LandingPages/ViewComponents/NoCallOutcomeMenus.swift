//
//  NoCallOutcomeMenus.swift
//  Magpie
//
//  Created by Paull Stanley on 7/26/22.
//

import SwiftUI

//View for the Callbacks dropdown menu for the possible outcomes of a commitment that did not require contacting the cx
struct NoCallCallbacksOutcomesMenu: View {
    @State var didNotCallUseCases: [MessagesUseCaseModel]
    @State var selected = ""
    
    var body: some View {
        LazyVStack {
            Picker("", selection: $selected) {
                ForEach(didNotCallUseCases) { action in
                    Text(action.userSelection)
                        .tag(action.value)
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
        .padding(.bottom, 10)
    }
}

//View for the Emails dropdown menu for the possible outcomes of a commitment that did not require contacting the cx
struct NoCallEmailsOutcomesMenu: View {
    @State var didNotCallUseCases: [MessagesUseCaseModel]
    @State var selected = ""
    
    var body: some View {
        LazyVStack {
            Picker("", selection: $selected) {
                ForEach(didNotCallUseCases) { action in
                    Text(action.userSelection)
                        .tag(action.value)
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
        .padding(.bottom, 10)
    }
}

//View for the Messages dropdown menu for the possible outcomes of a commitment that did not require contacting the cx
struct NoCallMessagesOutcomesMenu: View {
    @State var didNotCallUseCases: [MessagesUseCaseModel]
    @State var selected = ""
    
    var body: some View {
        LazyVStack {
            Picker("", selection: $selected) {
                ForEach(didNotCallUseCases) { action in
                    Text(action.userSelection)
                        .tag(action.value)
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
        .padding(.bottom, 10)
    }
}
