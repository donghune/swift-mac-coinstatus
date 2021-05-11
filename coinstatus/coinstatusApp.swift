//
//  coinstatusApp.swift
//  coinstatus
//
//  Created by 유동훈 on 2021/05/11.
//

import Cocoa
import Foundation
import SwiftUI

@main
struct coinstatusApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .onAppear(perform: {
                    setCoins(input: ["KRW-DOGE","KRW-ETC"])
                    
                    let statusItem: NSStatusItem? = NSStatusBar.system.statusItem(withLength: NSStatusItem.variableLength)
                    
                    statusItem?.menu = NSMenu(title: "menu")
                    statusItem?.menu?.addItem(
                        withTitle: "orderABurrito",
                        action: Selector(("openCoinSelectWindow")),
                        keyEquivalent: ""
                    )
                    
                    Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { timer in
                        updateTradePrice { value in
                            statusItem?.button?.title = value
                        }
                    }
                })
        }
    }
    
    func openCoinSelectWindow() {
        
    }
}
