//
//  SettingsViewModel.swift
//  Lucky8
//
//  Created by Vitaliy Griza on 21.12.2022.
//

import Foundation


protocol SettingsViewModelProtocol {
    func numberOfRows(in section: Int) -> Int
//    func didSelectRow(at indexPath: IndexPath)
    func model (at indexPath: IndexPath) -> String
}


class SettingsViewModel {
    private var settings: [String] = ["Vibration", "Notifications", "How it works?", "Rate Us"]
    
}

extension SettingsViewModel: SettingsViewModelProtocol {
    func model(at indexPath: IndexPath) -> String  {
        let model = settings[indexPath.row]
        return model
    }
    
    func numberOfRows(in section: Int) -> Int {
        settings.count
    }
    
    
//    func didSelectRow(at indexPath: IndexPath) {
//        <#code#>
//    }
    
    
}
