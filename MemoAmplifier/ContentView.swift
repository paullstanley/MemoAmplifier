//
//  ContentView.swift
//  MemoAmplifier
//
//  Created by Paull Stanley on 8/17/22.
//

import SwiftUI

struct ContentView: View {
    @State var engagementUseCases: EngagementTypeUseCases? = .callback
    
    var body: some View {
        Group {
            ZStack {
                NavigationView {
                    List(0..<4) { item in
                        NavigationLink(destination: EngagementTypeUsesCasesView(engagementUseCase: EngagementTypeUseCases.allCases[item]),
                                       tag: EngagementTypeUseCases.allCases[item],selection: $engagementUseCases) {
                            Label(GlobalConstants.sideBarItems[item], systemImage: GlobalConstants.sideBarIcons[item])
                        }
                    }.listStyle(SidebarListStyle())
                    .id(UUID())
                }
                .navigationTitle("")
                
            }
            .scaleEffect()
            .toolbar(content: toolbarContent)
            .onAppear {
                engagementUseCases = .callback
            }
        }
    }
    
    //Function that controls the logic to showing/hiding sidebar
    private func toggleSidebar() {
#if os(iOS)
#else
        NSApp.keyWindow?.tryToPerform(#selector(NSSplitViewController.toggleSidebar(_:)), with: nil)
#endif
    }
}

extension ContentView {
    @ToolbarContentBuilder
    private func toolbarContent()-> some ToolbarContent {
        ToolbarItem(placement: .navigation) {
            Button(action: {
                withAnimation {
                    toggleSidebar()
                }
            }, label: {
                Text("\(Image(systemName: "sidebar.leading"))")
            })
        }
        ToolbarItem(placement: .primaryAction) {
            Text(GlobalConstants.seasonalMessage)
        }
    }
}

enum EngagementTypeUseCases: String {
    static let allCases = [callback, email, message, transfer]
    case callback = "CB_"
    case email = "EMAIL_"
    case message = "MESSAGE_"
    case transfer = "TRANSFER_"
}


//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
