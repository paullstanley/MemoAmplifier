//
//  EmployeeInfoPopoverView.swift
//  Magpie
//
//  Created by Paull Stanley on 8/12/22.
//  Copyright © 2022 Paull Stanley. All rights reserved.
//

import SwiftUI

struct EmployeeInfoPopoverView: View {
    @ObservedObject var vm: HeaderViewModel
    var body: some View {
        Group {
            VStack(alignment: .leading) {
                HStack {
                    Text(AppState.shared.selectedEmployeeForUseCase.name)
                        .font(.title2)
                        .bold()
                }
//                HStack {
//                    Text("Manager: ").bold()
//                    Text(AppState.shared.selectedEmployeeForUseCase.tmName)
//                }
                HStack {
                    Text("Role: ")
                        .bold()
                    Text(AppState.shared.selectedEmployeeForUseCase.jobRole)
                }
                HStack {
                    Text("Site: ")
                        .bold()
                    Text(AppState.shared.selectedEmployeeForUseCase.siteLocation)
                }
                HStack {
                    Text("Schedule")
                        .bold()
                    Text(AppState.shared.selectedEmployeeForUseCase.schedule)
                }
            }
            .padding(10)
            .frame(minWidth:300)
        }
    }
}
