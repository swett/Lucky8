//
//  AlertView.swift
//  Lucky8
//
//  Created by Vitaliy Griza on 23.12.2022.
//

import UIKit

class AlertView: UIView {

    var titleLabel: UILabel!
    
    
    
    init() {
        super.init(frame: .zero)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


extension AlertView {
    func setupUI() {
        backgroundColor = .mainBgColor.withAlphaComponent(0.8)
        
        titleLabel = UILabel().then({ label in
            addSubview(label)
            label.font = .rounded(ofSize: 20, weight: .black)
            label.textColor = .mainTextColor
            label.textAlignment = .center
            label.snp.makeConstraints { make in
                make.center.equalToSuperview()
            }
        })
    }
    
    func setupData(with message: String) {
        titleLabel.text = message
    }
}
