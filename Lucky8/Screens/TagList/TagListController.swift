//
//  TagListController.swift
//  Lucky8
//
//  Created by Vitaliy Griza on 22.12.2022.
//

import UIKit
import TagListView

class TagListController: UIViewController {

    
    var tagListView: TagListView!
    var titleLabel: UILabel!
    
    //MARK: coordinator
    
    private let coordinator: CoordinatorProtocol
    
    init(coordinator: CoordinatorProtocol) {
        self.coordinator = coordinator
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tagListView.tagViews.forEach { view in
            let gradient = CAGradientLayer()
            gradient.colors = [UIColor.mainButtonColor.cgColor, UIColor.mainSecondaryButtonColor.cgColor]
            gradient.startPoint = CGPoint(x: 0, y: 1)
            gradient.endPoint = CGPoint(x: 1, y: 1)
            gradient.frame = view.layer.frame
            gradient.zPosition = -1
            view.layer.addSublayer(gradient)
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        animate()
    }

    
}

extension TagListController {
    
    func setupUI() {
        view.backgroundColor = .mainBgColor
        
        
        titleLabel = UILabel().then({ label in
            view.addSubview(label)
            label.font = .rounded(ofSize: 20, weight: .black)
            label.alpha = 0
            label.text = "What do you wanna to know?"
            label.textColor = .mainTextColor
            label.snp.makeConstraints { make in
                make.top.equalTo(view.safeAreaLayoutGuide).offset(30)
                make.left.equalToSuperview().inset(28)
            }
        })
    
        tagListView = TagListView().then({ tags in
            view.addSubview(tags)
            tags.alpha = 0
            tags.delegate = self
            tags.alignment = .left
            tags.paddingX = 40
            tags.paddingY = 22
            tags.cornerRadius = 30
            tags.marginY = 23
            tags.marginX = 30
            tags.textFont = .rounded(ofSize: 20, weight: .black)
            tags.addTags(["Love","Future","Confidence","Peace","Power","Life","Past","Family","Work", "Health"])
           
            
            
            tags.snp.makeConstraints { make in
                make.top.equalTo(titleLabel.snp.bottom).offset(29)
                make.left.right.equalToSuperview().inset(20)
                make.height.equalTo(450)
            }
        })
        
        
    }    
    
}

extension TagListController {
    func animate() {
        
        UIView.animate(withDuration: 0.15) {
            self.titleLabel.alpha = 1
        }
        UIView.animate(withDuration: 0.35) {
            self.tagListView.alpha = 1
        }
    }
}



extension TagListController: TagListViewDelegate {
    func tagPressed(_ title: String, tagView: TagView, sender: TagListView) {
        UserDefaultHelper.shared.isThemeOfPrediction = title
        UserDefaultHelper.shared.loadPredictions(with: title)
        coordinator.start()
    }
}
