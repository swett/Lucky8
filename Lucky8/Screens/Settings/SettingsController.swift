//
//  SettingsController.swift
//  Lucky8
//
//  Created by Vitaliy Griza on 20.12.2022.
//

import UIKit

class SettingsController: UIViewController {

    
    //MARK: Coordinator
    private let coordinator: CoordinatorProtocol
    
    init(coordinator: CoordinatorProtocol) {
        self.coordinator = coordinator
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigation()
        setupUI()
        // Do any additional setup after loading the view.
    }
    

}


extension SettingsController {
    func configureNavigation() {
        let settingsButton = UIButton().then { button in
            button.backgroundColor = .clear
            button.setImage(UIImage(named: "Close"), for: .normal)
            button.setTitle(nil, for: .normal)
            button.addTarget(self, action: #selector(backToMainScreen), for: .touchUpInside)
            button.snp.makeConstraints { make in
                make.width.height.equalTo(23)
            }
        }
        
        let item = UIBarButtonItem(customView: settingsButton)
        self.navigationItem.title = "Settings"
        self.navigationItem.setLeftBarButton(item, animated: true)
    }
    func setupUI() {
        view.backgroundColor = .mainBgColor
    }
}


extension SettingsController {
    @objc func backToMainScreen() {
        coordinator.showMainScreen()
    }
}
