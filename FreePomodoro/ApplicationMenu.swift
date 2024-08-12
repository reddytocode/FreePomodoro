//
//  ApplicationMenu.swift
//  FreePomodoro
//
//  Created by Reddy Tintaya Conde on 11/8/24.
//

import Foundation
import SwiftUI

class ApplicationMenu: NSObject {
    let menu = NSMenu()
    
    func createMenu() -> NSMenu {
        let helloWorldView = ContentView()
        let topView = NSHostingController(rootView: helloWorldView)
        topView.view.frame.size = CGSize(width: 225, height: 225)
        
        let customMenuItem = NSMenuItem()
        customMenuItem.view = topView.view
        
        menu.addItem(customMenuItem)  // Add the customMenuItem to the menu
        menu.addItem(NSMenuItem.separator())
        
        return menu
    }
}

