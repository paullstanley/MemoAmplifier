//
//  HeaderView.swift
//  Magpie
//
//  Created by Paull Stanley on 7/27/22.
//

import SwiftUI

struct HeaderView: View {
    @StateObject var vm = HeaderViewModel()
    @State private var employeeInfoPopoverIsShowing = false
    
    var body: some View {
        Group {
            HStack {
                TextField("Date & Time", text: $vm.dateOfEngagement).modifier(ClearButton(text: $vm.dateOfEngagement))
                TextField("Case Number", text: $vm.caseNumber).modifier(ClearButton(text: $vm.caseNumber))
                TextField("ToolId", text: $vm.id).modifier(ClearButton(text: $vm.id))
                Button(action: {
                    withAnimation {
                        employeeInfoPopoverIsShowing.toggle()
                    }
                }) {
                    Image(systemName: "info.circle")
                }
                .popover(isPresented: $employeeInfoPopoverIsShowing, arrowEdge: .bottom) {
                    EmployeeInfoPopoverView(vm: vm)
                }
                Button(action: {
                    vm.dateOfEngagement = ""
                    vm.caseNumber = ""
                    vm.id = ""
                }, label: {
                    Image(systemName: "xmark.circle")
                })
            }
            .padding(10)
        }
    }
}
