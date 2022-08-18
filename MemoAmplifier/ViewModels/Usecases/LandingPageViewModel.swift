//
//  LandingPageViewModel.swift
//  Magpie
//
//  Created by Paull Stanley on 8/11/22.
//  Copyright © 2022 Paull Stanley. All rights reserved.
//

import Foundation

class LandingPageViewModel: ObservableObject {
    //@Published var engagementType: EngagementTypeUseCases? = .callback
    
    func sanitizeString(string: String)-> String {
        return string
            .trimmingCharacters(in: .whitespacesAndNewlines)
            .filter("0123456789" .contains)
    }
//    
//    func navigateTo(engagement type: EngagementTypeUseCases) {
//        engagementType = type
//        
//    }
    
}
