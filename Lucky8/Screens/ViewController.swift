//
//  ViewController.swift
//  Lucky8
//
//  Created by Vitaliy Griza on 20.12.2022.
//

import UIKit
import Then
import SnapKit

class ViewController: UIViewController {

    //MARK: coordinator
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
        // Do any additional setup after loading the view.
        setupNavigationBar()
        setupUI()
    }
    override var preferredStatusBarStyle: UIStatusBarStyle {
        .lightContent
    }

}

extension ViewController {
    func setupUI() {
        view.backgroundColor = .mainBgColor
    }
    
    func setupNavigationBar() {
        let settingsButton = UIButton().then { button in
            button.backgroundColor = .clear
            button.setImage(UIImage(named: "Settings"), for: .normal)
            button.setTitle(nil, for: .normal)
            button.addTarget(self, action: #selector(goToSettings), for: .touchUpInside)
            button.snp.makeConstraints { make in
                make.width.height.equalTo(35)
            }
        }
        
        let item = UIBarButtonItem(customView: settingsButton)
        self.navigationItem.hidesBackButton = true
        self.navigationItem.title = "Mistery Luck"
        self.navigationItem.setRightBarButton(item, animated: true)
    }
}

extension ViewController {
    
    @objc func goToSettings() {
        coordinator.showSettings()
    }
    
}

