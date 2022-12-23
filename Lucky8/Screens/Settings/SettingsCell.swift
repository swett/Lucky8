//
//  SettingsCell.swift
//  Lucky8
//
//  Created by Vitaliy Griza on 21.12.2022.
//

import UIKit

class SettingsCell: UITableViewCell {

    private var titleLabel: UILabel!
    var containerView: UIView!
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        configureUI()
        animate()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

private extension SettingsCell {
    func configureUI() {
        contentView.backgroundColor = .mainBgColor
        containerView = UIView().then({ container in
            contentView.addSubview(container)
        
            container.snp.makeConstraints { make in
                make.top.equalToSuperview()
                make.left.right.equalToSuperview().inset(10)
                make.height.equalTo(60)
                make.bottom.equalToSuperview().inset(10)
            }
        })
        
        titleLabel = UILabel().then({ label in
            containerView.addSubview(label)
            label.backgroundColor = .clear
            label.textColor = .mainTextColor
            
            label.font = .rounded(ofSize: 21, weight: .heavy)
            label.alpha = 0
            label.snp.makeConstraints { make in
                
                make.centerY.equalToSuperview()
                make.left.equalToSuperview().inset(15)
            }
        })
    }
}


extension SettingsCell {
    func setup(with viewModel: String) {
        titleLabel.text = viewModel
    }
    
    func animate() {
        UIView.animate(withDuration: 0.65) {
            self.titleLabel.alpha = 1
        }
    }
}



extension SettingsCell {
    static let id = SettingsCell.description()
}
