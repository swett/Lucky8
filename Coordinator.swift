//
//  Coordinator.swift
//  Lucky8
//
//  Created by Vitaliy Griza on 20.12.2022.
//

import Foundation
import UIKit



protocol CoordinatorProtocol {
    var rootViewController: UIViewController? { get }
    
    func start()
    func showSettings()
    func showMainScreen()
}




final class Coordinator {
    
    private let navigationController: UINavigationController
    
    init(navigationController: NavigationVC) {
        self.navigationController = navigationController
    }
    
    
}

extension Coordinator: CoordinatorProtocol {
    var rootViewController: UIViewController? {
        navigationController
    }
    
    func start() {
        
        let mainController = ViewController(coordinator: self)
        navigationController.pushViewController(mainController, animated: true)
    }
    
    func showSettings() {
        let settingsController = SettingsController(coordinator: self)
        
        navigationController.pushViewController(settingsController, animated: true)
    }
    
    func showMainScreen() {
        let mainController = ViewController(coordinator: self)
        navigationController.pushViewController(mainController, animated: true)
    }
    
}
