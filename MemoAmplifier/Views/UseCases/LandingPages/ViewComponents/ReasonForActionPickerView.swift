//
//  ReasonForActionPickerView.swift
//  Magpie
//
//  Created by Paull Stanley on 8/8/22.
//  Copyright © 2022 Paull Stanley. All rights reserved.
//

import SwiftUI

struct ReasonForActionPickerView: View {
    @State var reasonForActionUseCases: [MessagesUseCaseModel]
    @State var selected = ""
    
    var body: some View {
        Group {
            HStack {
                Text("Reason for Action:")
                    .bold()
                    .fixedSize()
                    .padding(.leading)
              
            }
            .padding(.horizontal)
            
            HStack {
                Picker("", selection: $selected) {
                    ForEach(reasonForActionUseCases) { reason in
                        Text(reason.userSelection)
                            .tag(reason.value)
                            .fixedSize()
                    }
                    .id(UUID())
                }
                .onChange(of: selected) { newValue in
                    AppState.shared.selectedMessageForUseCase.reasonForAction = selected
                }
                .pickerStyle(SegmentedPickerStyle())
                .labelsHidden()
            }
            .padding(.horizontal)
            .padding(.bottom)
        }

    }
}
