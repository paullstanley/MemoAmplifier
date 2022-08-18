//
//  VoicemailScriptView.swift
//  Magpie
//
//  Created by Paull Stanley on 8/12/22.
//  Copyright © 2022 Paull Stanley. All rights reserved.
//

import SwiftUI

struct VoicemailScriptView: View {
    let nextScheduledWorkDay = ScheduleLogic().nextScheduledDay
    var body: some View {
        Group {
            Text("Hello, this is **\(AppState.shared.USER_FIRST_NAME)**, calling from AppleCare regarding your callback with **\(attributedString(from:AppState.shared.selectedEmployeeForUseCase.name))**. They are currently unavailable, so I am contacting you on their behalf. Their expected day back in office is **\(attributedString(from: String(describing: nextScheduledWorkDay)))**, and they will be contacting you when they are available. If at any time you would prefer to speak with someone else, or you need immediate assistance please call \(attributedString(from: "888-8888-88888")) and provide the answering employee your case number if you have it. Thank you and have a great day! \n\n\n\n\n\n\n\n\n")
                .font(.callout)
                .lineLimit(10)
        }
        .frame(maxWidth: 300)
        .padding(10)
        
    }
    func attributedString(from string: String) -> AttributedString {
        do {
            var text = try AttributedString(markdown: string)
            text.foregroundColor = .red
            return text
        } catch {
            return ""
        }
    }
}

