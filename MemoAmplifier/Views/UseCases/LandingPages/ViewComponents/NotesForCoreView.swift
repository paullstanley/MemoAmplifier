//
//  NotesForCoreView.swift
//  Magpie
//
//  Created by Paull Stanley on 8/4/22.
//

import SwiftUI

//struct NotesForCoreView: View {
//    @EnvironmentObject private var store: CoreDataManager
//    private let snippetUseCase = TransferTextSnippets()
//    
//    var body: some View {
//        Text("Notes for Core:")
//        HStack {
//            ForEach(snippetUseCase.coreNotes.sorted(by: <), id: \.key) { key, value in
//                Button(key) { store.updateCurrentMessageSnippets(coreNotes: value) }
//                    .background(store.currentMessages.first?.coreNotes == value ? Color.accentColor : nil)
//            }
//        }
//    }
//}
