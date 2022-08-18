//
//  NextStepPickerView.swift
//  Magpie
//
//  Created by Paull Stanley on 8/8/22.
//  Copyright © 2022 Paull Stanley. All rights reserved.
//

import SwiftUI

struct NextStepPickerView: View {
    @State var nextStepUseCases: [MessagesUseCaseModel]
    @State var selected = ""
    
    var body: some View {
        Group {
            HStack {
                Text("Next step for email:")
                .bold()
                .fixedSize()
                .padding(.leading)
            Spacer()
            }
            .padding(.horizontal)
            HStack {
                Picker("", selection: $selected) {
                    ForEach(nextStepUseCases) { nextStep in
                        Text(nextStep.userSelection)
                            .tag(nextStep.value)
                        .fixedSize()
                    }
                    .id(UUID())
                }
                .onChange(of: selected) { newValue in
                    AppState.shared.selectedMessageForUseCase.nextStep = selected
                }
                .pickerStyle(SegmentedPickerStyle())
                .labelsHidden()
            }
            .padding(.horizontal)
            .padding(.bottom)
        }
        
    }
}
