//
//  Settings.swift
//  Svetofor
//
//  Created by Андрей Дорогой on 31.10.2023.
//

import Foundation

enum keysUserDefaults {
    static let settingsTime = "settingsTime"
}

struct settingsLightTime: Codable {
    var timeForRed: Int
    var timeForGreen: Int
}

class Settings {
    static var share = Settings()
    private let defaultSet = settingsLightTime(timeForRed: 5, timeForGreen: 5)
    var currentSettings: settingsLightTime {
        get {
            if let data = UserDefaults.standard.object(forKey: keysUserDefaults.settingsTime) as? Data {
                return try! PropertyListDecoder().decode(settingsLightTime.self, from: data)
            } else {
                if let data = try? PropertyListEncoder().encode(defaultSet) {
                    UserDefaults.standard.setValue(data, forKey: keysUserDefaults.settingsTime)
                }
                return defaultSet
            }
        }
        set {
            if let data = try? PropertyListEncoder().encode(newValue) {
                UserDefaults.standard.setValue(data, forKey: keysUserDefaults.settingsTime)
            }
        }
    }
    func resetSet() {
        currentSettings = defaultSet
    }
}

