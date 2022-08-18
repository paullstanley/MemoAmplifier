//
//  TransfersLandingPageView.swift
//  MagPie
//
//  Created by Paull Stanley on 7/25/22.
//

import SwiftUI

struct TransfersLandingPageView: View {
    let vm = TransfersLandingPageViewModel()
    
    var body: some View {
        VStack {
            ReasonForActionPickerView(reasonForActionUseCases: vm.reasonsForAction)
            //NotesForCoreView()
        }
        .navigationTitle(Text("Transfers"))
    }
}

