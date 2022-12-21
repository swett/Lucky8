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
    func showHowItWorks()
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
        let viewModel = SettingsViewModel()
        let settingsController = SettingsController(coordinator: self, viewModel: viewModel)
        
        navigationController.pushViewController(settingsController, animated: true)
    }
    
    func showMainScreen() {
        let mainController = ViewController(coordinator: self)
        navigationController.pushViewController(mainController, animated: true)
    }
    
    func showHowItWorks() {
        let howItWorksController = HowItWorksController(coordinator: self)
        navigationController.pushViewController(howItWorksController, animated: true)
    }
    
}
