//
//  EngagementTypeUsesCasesView.swift
//  Magpie
//
//  Created by Paull Stanley on 8/4/22.
//

import SwiftUI

struct EngagementTypeUsesCasesView: View {
    var engagementUseCase: EngagementTypeUseCases
//    @State var isToolIdMissing: Bool = false
    
    var body: some View {
            //Passing along the necessary bound variables to the header view. the $ symbol will allow this child view to update itself dependant on the change of said variable.
        Group {
            HeaderView()
            if engagementUseCase == EngagementTypeUseCases.callback {
                CallbacksLandingPageView()
            } else if engagementUseCase == EngagementTypeUseCases.email {
                EmailsLandingPageView()
            } else if engagementUseCase == EngagementTypeUseCases.message {
                MessagesLandingPageView()
            } else if engagementUseCase == EngagementTypeUseCases.transfer {
                TransfersLandingPageView()
            } else {
                Text("Something went wrong")
            }
            Spacer()
            //Passing the necessary variables onto the footer view. These variables are not needed to be bound since they ultimately rely on the user to submit until they are used.
            FooterMenuView()
//                .alert("Magpie is unable to locate csv file neccessary to run the app. (EmployeeToolID.csv)", isPresented: $isToolIdMissing) {
//                    Button("OK", role: .cancel) {
//                        isToolIdMissing = false
//                    }.onDisappear {
//                        isToolIdMissing = false
//                    }
//                }
        }
            //isToolIdMissing = !FileManager.default.fileExists(atPath: GlobalConstants.toolIdFilePath)
        }
}
