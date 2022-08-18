//
//  MessagesLandingPageView.swift
//  MagPie
//
//  Created by Paull Stanley on 7/25/22.
//

import SwiftUI

struct MessagesLandingPageView: View {
    let vm = MessagessLandingPageViewModel()

    var body: some View {
        VStack {
            //Reason for action view specific to the messages
            ReasonForActionPickerView(reasonForActionUseCases: vm.reasonsForAction)
            //Next step for email view specific to emails
            NextStepPickerView(nextStepUseCases: vm.nextStep)
            //Passing the string "Messages" to the child view in order for it to be able to identity the origin of its parent
            WasCustomerCalledView(actionTakenUseCases: vm.actionTaken)
        }
        .navigationTitle(Text("Messages"))
    }
}
