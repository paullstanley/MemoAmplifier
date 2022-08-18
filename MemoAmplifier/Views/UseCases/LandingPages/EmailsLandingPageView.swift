//
//  EmailsLandingPageView.swift
//  MagPie
//
//  Created by Paull Stanley on 7/25/22.
//

import SwiftUI

struct EmailsLandingPageView: View {
    let vm = EmailLandingPageViewModel()
    
    var body: some View {
        VStack {
            //Next step for email view specific to the emails
            NextStepPickerView(nextStepUseCases: vm.nextStep)
            //Passing the string "Emails" to the child view in order for it to be able to identity the origin of its parent
            WasCustomerCalledView(actionTakenUseCases: vm.actionTaken)
        }
        .navigationTitle(Text("Emails"))
    }
}
