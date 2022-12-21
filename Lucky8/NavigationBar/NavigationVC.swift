//
//  NavigationVC.swift
//  Lucky8
//
//  Created by Vitaliy Griza on 20.12.2022.
//

import UIKit

class NavigationVC: UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let appearance = UINavigationBarAppearance()
        appearance.configureWithTransparentBackground()
        appearance.backgroundColor = .mainBgColor
        appearance.titleTextAttributes = [
            .font: UIFont.rounded(ofSize: 26, weight: .heavy),
            .foregroundColor: UIColor.mainTextColor
        ]
        navigationBar.tintColor = .mainTextColor
        navigationBar.standardAppearance = appearance
        navigationBar.scrollEdgeAppearance = appearance
        navigationBar.isHidden = false
    }
    override var preferredStatusBarStyle: UIStatusBarStyle {
        .lightContent
    }
}

