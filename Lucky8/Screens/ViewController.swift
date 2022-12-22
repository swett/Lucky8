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

    //MARK: UI
    var ballImageView: UIImageView!
    var predictionLabel: UILabel!
    var hintLabel: UILabel!
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
        
        ballImageView = UIImageView().then({ imageView in
            view.addSubview(imageView)
            imageView.image = UIImage(named: "ball")
            imageView.contentMode = .scaleAspectFill
            imageView.snp.makeConstraints { make in
                make.center.equalToSuperview()
                make.left.right.equalToSuperview().inset(40)
            }
        })
        
        predictionLabel = UILabel().then({ label in
            ballImageView.addSubview(label)
            label.text = "All gonna be okay"
            label.font = .rounded(ofSize: 13, weight: .bold)
            label.textColor = UIColor.mainTextColor.withAlphaComponent(0.8)
//            label.backgroundColor = .red
            label.numberOfLines = 2
            label.textAlignment = .center
            
            label.snp.makeConstraints { make in
                make.center.equalToSuperview()
                make.width.equalToSuperview().multipliedBy(0.25)
            }
        })
        
        hintLabel = UILabel().then({ label in
            view.addSubview(label)
            label.text = "Shake the phone and think about your question"
            label.font = .rounded(ofSize: 20, weight: .bold)
            label.textColor = UIColor.mainTextColor.withAlphaComponent(0.8)
            label.textAlignment = .center
            label.numberOfLines = 2
            
            label.snp.makeConstraints { make in
                make.top.equalTo(ballImageView.snp.bottom).offset(48)
                make.left.right.equalToSuperview().inset(40)
                make.centerX.equalToSuperview()
            }
        })
        
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

