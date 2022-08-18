//
//  View+Extensions.swift
//  MemoAmplifier
//
//  Created by Paull Stanley on 8/5/22.
//  Copyright © 2022 Paull Stanley. All rights reserved.
//

import SwiftUI

extension View {
    
    @discardableResult
    func openInWindow(title: String, sender: Any?) -> NSWindow {
        let controller = NSHostingController(rootView: self)
        let win = NSWindow(contentViewController: controller)
        win.contentViewController = controller
        win.title = title
        win.makeKeyAndOrderFront(sender)
        return win
    }
}
