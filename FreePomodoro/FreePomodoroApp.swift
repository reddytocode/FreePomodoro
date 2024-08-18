//
//  FreePomodoroApp.swift
//  FreePomodoro
//
//  Created by Reddy Tintaya Conde on 11/8/24.
//

import SwiftUI

@main
struct FreePomodoroApp: App {
    @NSApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    var body: some Scene {
        Settings {
            EmptyView()
        }
    }
}


class AppDelegate: NSObject, NSApplicationDelegate {
    static private(set) var instance: AppDelegate!
    lazy var statusBarItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.variableLength)
    let menu = ApplicationMenu()
    
    func applicationDidFinishLaunching(_ notification: Notification) {
        AppDelegate.instance = self
        
        // Image icon
        let symbolConfig = NSImage.SymbolConfiguration(pointSize: 18, weight: .regular)
        let image = NSImage(systemSymbolName: "timer", accessibilityDescription: "Pomodoro app")?.withSymbolConfiguration(symbolConfig)
        image?.isTemplate = true
        
        statusBarItem.button?.image =  image
        statusBarItem.button?.imagePosition = .imageLeading
        
        statusBarItem.button?.action = #selector(togglePopover(_:))
        
        statusBarItem.button?.sendAction(on: [.leftMouseUp, .rightMouseUp])
        statusBarItem.button?.target = self
        
        //        statusBarItem.menu = menu.createMenu()
    }
    
    @objc func togglePopover(_ sender: AnyObject?) {
        if let event = NSApp.currentEvent {
            if event.type == .rightMouseUp {
                print("right click")
                statusBarItem.menu = menu.createMenu()
                statusBarItem.button?.performClick(nil)
            } else {
                print("left click")
                statusBarItem.menu = menu.createMenu()
                // Left click: Show counter
                let contentView = ContentView()
                let popover = NSPopover()
                popover.contentSize = NSSize(width: 200, height: 150)
                popover.behavior = .transient
                popover.contentViewController = NSHostingController(rootView: contentView)
                popover.show(relativeTo: statusBarItem.button!.bounds, of: statusBarItem.button!, preferredEdge: .minY)
            }
        }
    }
}
