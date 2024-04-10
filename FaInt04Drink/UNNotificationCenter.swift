//
//  UNNotificationCenter.swift
//  FaInt04Drink
//
//  Created by joe on 4/10/24.
//

import Foundation
import UserNotifications

extension UNUserNotificationCenter {
    func addNotificationRequest(by alert: Alert) {
        let content = UNMutableNotificationContent()
        content.title = "Time to drink water💦"
        content.body = "The daily water intake recommended by the World Health Organization is 1.5 to 2 liters."
        content.sound = .default
        content.badge = 1
        
        let component = Calendar.current.dateComponents([.hour, .minute], from: alert.date)
        let trigger = UNCalendarNotificationTrigger(dateMatching: component, repeats: alert.isOn)
        
        let request = UNNotificationRequest(identifier: alert.id, content: content, trigger: trigger)
        
        self.add(request)
    }
}
