//
//  AppDelegate.swift
//  L.O.V.E
//
//  Created by Yuxuan Qiu on 2020/10/8.
//  Copyright © 2020 Yuxuan Qiu. All rights reserved.
//
import Cocoa
import Foundation
import SwiftyTimer
@NSApplicationMain

class AppDelegate: NSObject, NSApplicationDelegate {
    
    @IBOutlet weak var statusMenu: NSMenu!
    @IBAction func quitClicked(_ sender: NSMenuItem) {
        NSApplication.shared.terminate(self)
    }
    
    let date = Date()
    let dateFormatter = DateFormatter()
    let statusItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.variableLength)
    
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        statusItem.menu = statusMenu
        dateFormatter.dateFormat = "YYYYMMdd"
        let love = dateFormatter.date(from: "20201027")
        Timer.every(1.seconds) {
            let todate = self.dateFormatter.string(from: self.date).suffix(4)
            let betweendays = Calendar.current.dateComponents([.day], from: love!, to: Date())
            let days = Int(betweendays.day!)
            self.statusItem.button?.title=String(days) + " " + NSLocalizedString("Days", comment:"")
            switch (todate, days % 365) {
            case ("1127", _), ("1128", _) :
                self.statusItem.button!.image = NSImage(named: "birthdaycake")
            case (_, 0) :
                self.statusItem.button!.image = NSImage(named: "pinkheart")
            default :
                self.statusItem.button!.image = NSImage(named: "heart")
            }
            self.statusItem.button?.imagePosition = NSControl.ImagePosition.imageLeft
       }
        func applicationWillTerminate(_ aNotification: Notification) {
            // Insert code here to tear down your application
        }
    }
}

