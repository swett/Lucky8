//
//  UserDefaultHelper.swift
//  Lucky8
//
//  Created by Vitaliy Griza on 23.12.2022.
//

import Foundation

class UserDefaultHelper {
    var defaultData: UserDefaults = UserDefaults.standard
    var predictionsArray:[String] = []
    let keyforLaunch = "validateFirstlunch"
    var isFirst: Bool {
        get {
            return UserDefaults.standard.bool(forKey: keyforLaunch)
        }
        set {
            UserDefaults.standard.set(newValue, forKey: keyforLaunch)
        }
    }
    let keyforVibration = "vibration"
    var isVibration: Bool {
        get {
            return defaultData.bool(forKey: keyforVibration)
        }
        set {
            defaultData.set(newValue, forKey: keyforVibration)
        }
    }
    let keyforPrediction = "prediction"
    var isThemeOfPrediction: String {
        get {
            return defaultData.string(forKey: keyforPrediction) ?? "Work"
        }
        set {
            defaultData.set(newValue, forKey: keyforPrediction)
        }
    }
    
    
    func loadPredictions(with title: String) {
        switch title {
        case "Love" :
            predictionsArray = ["All gonna be okay", "You gonna be hired", "Something is closing", "Belief in this"]
            break
        case "Future" :
            predictionsArray = ["All gonna be okay", "You gonna be hired", "Something is closing", "Belief in this"]
            break
        case "Confidence" :
            predictionsArray = ["All gonna be okay", "You gonna be hired", "Something is closing", "Belief in this"]
            break
        case "Peace" :
            predictionsArray = ["All gonna be okay", "You gonna be hired", "Something is closing", "Belief in this"]
            break
        case "Power" :
            predictionsArray = ["All gonna be okay", "You gonna be hired", "Something is closing", "Belief in this"]
            break
        case "Life" :
            predictionsArray = ["All gonna be okay", "You gonna be hired", "Something is closing", "Belief in this"]
            break
        case "Past" :
            predictionsArray = ["All gonna be okay", "You gonna be hired", "Something is closing", "Belief in this"]
            break
        case "Family" :
            predictionsArray = ["All gonna be okay", "You gonna be hired", "Something is closing", "Belief in this"]
            break
        case "Work" :
            predictionsArray = ["All gonna be okay", "You gonna be hired", "Something is closing", "Belief in this"]
            break
        case "Health" :
            predictionsArray = ["All gonna be okay", "You gonna be hired", "Something is closing", "Belief in this"]
            break
        default:
            print("No real theme")
        }
    }
    
    
    static let shared: UserDefaultHelper = UserDefaultHelper()
    
}
