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
import UserNotifications
@NSApplicationMain

class AppDelegate: NSObject, NSApplicationDelegate {
    
    @IBOutlet weak var statusMenu: NSMenu!
    @IBAction func quitClicked(_ sender: NSMenuItem) {
        NSApplication.shared.terminate(self)
    }
    
    let date = Date()
    let dateFormatter = DateFormatter()
    let statusItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.variableLength)
    let content = UNMutableNotificationContent()
    let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 1, repeats: false)
    let hour = Calendar.current.component(.hour, from: Date())
    
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        statusItem.menu = statusMenu
        dateFormatter.dateFormat = "YYYYMMdd"
        let love = dateFormatter.date(from: "20201027")
        UNUserNotificationCenter
            .current()
            .requestAuthorization(options: [.alert, .badge, .sound], completionHandler:  { (success, error) in
                print("授权" + (success ? "成功" : "失败"))
            })
        content.title = "程序状态"
        content.subtitle = "启动成功"
        content.sound = UNNotificationSound.default
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        UNUserNotificationCenter.current().add(request)
        Timer.every(1.seconds) {
            let todate = self.dateFormatter.string(from: self.date).suffix(4)
            let betweendays = Calendar.current.dateComponents([.day], from: love!, to: Date())
            let days = Int(betweendays.day!)
            self.statusItem.button?.title=String(days) + " " + NSLocalizedString("Days", comment:"")
            switch (todate, days % 365, days % 100) {
            case ("1127", _, _), ("1128", _, _) :
                if (self.hour == 9) {
                self.content.title = "重要提醒"
                self.content.subtitle = "猪猪的生日"
                self.content.sound = UNNotificationSound.default
                let request = UNNotificationRequest(identifier: UUID().uuidString, content: self.content, trigger: self.trigger)
                UNUserNotificationCenter.current().add(request)
                }
                self.statusItem.button!.image = NSImage(named: "birthdaycake")
            case (_, 0, _), (_, _, 0) :
                if (self.hour == 9) {
                self.content.title = "重要提醒"
                self.content.subtitle = "重要日子"
                self.content.sound = UNNotificationSound.default
                let request = UNNotificationRequest(identifier: UUID().uuidString, content: self.content, trigger: self.trigger)
                UNUserNotificationCenter.current().add(request)
                self.statusItem.button!.image = NSImage(named: "pinkheart")
                }
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

