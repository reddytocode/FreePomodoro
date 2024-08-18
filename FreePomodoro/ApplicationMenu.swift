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
        menu.removeAllItems() // Clear existing items
        
        // Add Settings option
        let settingsMenuItem = NSMenuItem(title: "Settings", action: #selector(openSettings), keyEquivalent: ",")
        settingsMenuItem.target = self
        menu.addItem(settingsMenuItem)
        
        // Add Quit option
        let quitMenuItem = NSMenuItem(title: "Quit", action: #selector(NSApplication.terminate(_:)), keyEquivalent: "q")
        menu.addItem(quitMenuItem)
        
        return menu
    }
    
    @objc func openSettings() {
        print("Opening settings...")
        // Here you would typically open a settings window or view
    }
}
