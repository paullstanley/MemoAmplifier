//
//  CallbacksLandingPageView.swift
//  Magpie
//
//  Created by Paull Stanley on 7/25/22.
//

import SwiftUI

struct CallbacksLandingPageView: View {
    @State var vm = CallbacksLandingPageViewModel()
    
    var body: some View {
        Group {
            VStack {
                //Reason for action view specific to the callbacks
                ReasonForActionPickerView(reasonForActionUseCases: vm.reasonsForAction)
                //Next step for email view specific to callbacks
                NextStepPickerView(nextStepUseCases: vm.nextStep)
                //Passing the string "Callbacks" to the child view in order for it to be able to identity the origin of its parent
                WasCustomerCalledView(actionTakenUseCases: vm.actionTaken)
            }
            .navigationTitle(Text("Callbacks"))
        }
        }
        
}

