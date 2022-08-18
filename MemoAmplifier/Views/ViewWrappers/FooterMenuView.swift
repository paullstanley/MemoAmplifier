//
//  FooterMenuView.swift
//  Magpie
//
//  Created by Paull Stanley on 7/27/22.
//

import SwiftUI

struct FooterMenuView: View {
    @StateObject var vm = FooterViewModel()
    @State var isScriptPopoverShowing = false
    
    var body: some View {
        Group {
            HStack {
                Button("\(Image(systemName: "line.3.crossed.swirl.circle.fill")) Core") {
                    openCaseInCore()
                }
                Button("\(Image(systemName: "quote.bubble.fill")) Clipboard") {
                    copyToClipBoard()
                }
                Button("\(Image(systemName: "book.fill")) Script") {
                    isScriptPopoverShowing.toggle()
                }
                .popover(isPresented: $isScriptPopoverShowing, arrowEdge: .top) {
                    VoicemailScriptView()
                }
                Spacer()
                Button("\(Image(systemName: "exclamationmark.bubble.fill")) Chat") {
                    sendSlackMessage()
                }
                Button("\(Image(systemName: "paperplane.fill")) Email") {
                        vm.sendEmail()
                }
            }
            .padding(.horizontal, 10)
            .padding(.bottom)
        }
       
    }
    
    func copyToClipBoard() {
        let pb = NSPasteboard.init(name: NSPasteboard.Name.general)
        pb.string(forType: NSPasteboard.PasteboardType.string)
        pb.declareTypes([NSPasteboard.PasteboardType.string], owner: nil)
        pb.setString(AppState.shared.selectedMessageForUseCase.actionTaken, forType: NSPasteboard.PasteboardType.string)
    }
    
    func sendSlackMessage() {
        if  AppState.shared.selectedEmployeeForUseCase.slackURL != "" {
            if case let AppState.shared.selectedEmployeeForUseCase.slackURL = AppState.shared.selectedEmployeeForUseCase.slackURL {
                if let url = URL(string: AppState.shared.selectedEmployeeForUseCase.slackURL) {
                    NSWorkspace.shared.open(url);
                }
                
            }
            
        }
    }
    
    func openCaseInCore() {
        if case let AppState.shared.selectedMessageForUseCase.caseNumber = AppState.shared.selectedMessageForUseCase.caseNumber {
            if let url = URL(string: "ilog://caseId=" + AppState.shared.selectedMessageForUseCase.caseNumber) {
                NSWorkspace.shared.open(url);
            }
        } 
    }
}
