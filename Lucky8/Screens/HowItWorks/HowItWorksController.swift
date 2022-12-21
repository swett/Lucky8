//
//  HowItWorksController.swift
//  Lucky8
//
//  Created by Vitaliy Griza on 21.12.2022.
//

import UIKit

class HowItWorksController: UIViewController {

    //MARK: UI
    
    var containerView: UIScrollView!
    var textLabel: UILabel!
    
    let text: String = "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).\n\nIt is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).\n\nIt is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like)."
    
    //MARK: Coordinator
    private let coordinator: CoordinatorProtocol
    
    init (coordinator: CoordinatorProtocol) {
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
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        .lightContent
    }

}


extension HowItWorksController {
    func configureNavigation() {
        let settingsButton = UIButton().then { button in
            button.backgroundColor = .clear
            button.setImage(UIImage(named: "Close"), for: .normal)
            button.setTitle(nil, for: .normal)
            button.addTarget(self, action: #selector(backToSettings), for: .touchUpInside)
            button.snp.makeConstraints { make in
                make.width.height.equalTo(23)
            }
        }
        
        let item = UIBarButtonItem(customView: settingsButton)
        self.navigationItem.title = "Settings"
        self.navigationItem.setLeftBarButton(item, animated: true)
        
        
    }
    
    func setupUI() {
//        view.backgroundColor = .mainBgColor
        containerView = UIScrollView().then({ scroll in
            view.addSubview(scroll)
            scroll.backgroundColor = .mainBgColor
            
            scroll.snp.makeConstraints { make in
                make.edges.equalToSuperview()
            }
        })
        
        let contentView = UIView().then { view in
            containerView.addSubview(view)
            view.snp.makeConstraints { make in
                make.top.bottom.left.equalToSuperview()
                make.width.equalToSuperview()
                
            }
        }
        
        textLabel = UILabel().then({ label in
            contentView.addSubview(label)
            label.textAlignment = .left
            label.numberOfLines = 0
            label.lineBreakMode = .byWordWrapping
            label.font = .rounded(ofSize: 16, weight: .regular)
            label.textColor = .mainTextColor
            label.text = text
            label.snp.makeConstraints { make in
                make.top.bottom.equalToSuperview().inset(20)
                make.left.right.equalToSuperview().inset(32)
//                make.height.equalTo(600)
//                make.width.equalTo(331)
                
            }
        })
    }
}


extension HowItWorksController {
    @objc func backToSettings() {
        coordinator.showSettings()
    }
}
