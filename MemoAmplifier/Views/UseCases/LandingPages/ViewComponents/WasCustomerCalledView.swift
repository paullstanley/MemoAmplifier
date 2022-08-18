//
//  WasCustomerCalledView.swift
//  Magpie
//
//  Created by Paull Stanley on 8/3/22.
//

import SwiftUI

//The view that is in charge of deciding which Action Taken drop town to offer depending on what the Amployee chooses for the, Did you call the customer question.
struct WasCustomerCalledView: View {
    @State var actionTakenUseCases: [MessagesUseCaseModel]
    @State var selected = ""
    //Constant array of strings used to loop through the button options and as the text on the buttons.
    var body: some View {
        //Text prompt asking if the cx was called
        HStack {
            Text("Did You Call the Customer?")
                .bold()
                .fixedSize()
                .padding(.horizontal, 5)
        }
        
        HStack {
            //Yes and no buttons laid out by looping through the array of strings "buttons"
            Picker("", selection: $selected) {
                ForEach(0..<WasCustomerCalled.allCases.count) {
                    Text(WasCustomerCalled.allCases[$0].id)
                        .tag(WasCustomerCalled.allCases[$0].id)
                        .fixedSize()
                }.id(UUID())
            }
            .pickerStyle(SegmentedPickerStyle())
            .labelsHidden()
        }
        .padding(.horizontal, 250)
        
        //ZStack in charge of presenting the proper view with the proper drop down for Action Taken
        ZStack {
            //If yes is selected...
            if(self.selected == "Yes") {
                DidCallOutcomeMenu(didCallUseCases: actionTakenUseCases.filter({ $0.key.contains("AT_DC") }))
            } else if(self.selected == "No") { //No is selected...
                if actionTakenUseCases.contains(where: {$0.key.hasPrefix("CB_") })  { //If the parent is callbacks
                    NoCallCallbacksOutcomesMenu(didNotCallUseCases: actionTakenUseCases.filter({ $0.key.contains("AT_NC") }))
                } else if actionTakenUseCases.contains(where: { $0.key.hasPrefix("EMAIL_") }) { //If the parent is Emails
                    NoCallCallbacksOutcomesMenu(didNotCallUseCases: actionTakenUseCases.filter({ $0.key.contains("AT_NC") }))
                } else if actionTakenUseCases.contains(where: { $0.key.hasPrefix("MESSAGE_")}) { //If the parent is Messages
                    NoCallCallbacksOutcomesMenu(didNotCallUseCases: actionTakenUseCases.filter({ $0.key.contains("AT_NC") }))
                }
            }
        }
    }
}

enum WasCustomerCalled: String, Identifiable, CaseIterable {
    case Yes
    case No
    var id: String { self.rawValue }
}
