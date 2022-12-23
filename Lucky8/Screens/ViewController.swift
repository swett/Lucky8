//
//  ViewController.swift
//  Lucky8
//
//  Created by Vitaliy Griza on 20.12.2022.
//

import UIKit
import Then
import SnapKit
import AudioToolbox

class ViewController: UIViewController {

    //MARK: UI
    var ballImageView: UIImageView!
    var predictionLabel: UILabel!
    var hintLabel: UILabel!
    
    //MARK: Predictions
    var predictions:[String] = ["All gonna be okay", "You gonna be hired", "Something is closing", "Belief in this"]
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
        self.becomeFirstResponder()
        setupNavigationBar()
        setupUI()
        springAnimation()
    }
    override var preferredStatusBarStyle: UIStatusBarStyle {
        .lightContent
    }
    override var canBecomeFirstResponder: Bool {
        get {
            return true
        }
    }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if motion == .motionShake {
            print("shake")
            //MARK: Two varients to make vibration sound
            shakeAnimation()
//            AudioServicesPlayAlertSound(SystemSoundID(kSystemSoundID_Vibrate))
            UIImpactFeedbackGenerator(style: .medium).impactOccurred()
            print("vibrated")
            self.predictionLabel.text = predictions.randomElement()
        }
    }
}

extension ViewController {
    func setupUI() {
        view.backgroundColor = .mainBgColor
        
        ballImageView = UIImageView().then({ imageView in
            view.addSubview(imageView)
            imageView.image = UIImage(named: "ball")
            imageView.contentMode = .scaleAspectFill
            imageView.alpha = 1
            imageView.snp.makeConstraints { make in
                make.center.equalToSuperview().inset(-300)
                make.left.right.equalToSuperview().inset(40)
            }
        })
        
        predictionLabel = UILabel().then({ label in
            ballImageView.addSubview(label)
            label.text = ""
            label.font = .rounded(ofSize: 13, weight: .bold)
            label.textColor = UIColor.mainTextColor.withAlphaComponent(0.8)
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
            label.alpha = 0
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
    func springAnimation() {
        UIView.animate(withDuration: 1, delay: 1, usingSpringWithDamping: 0.5, initialSpringVelocity: 5, options: .curveEaseInOut) {
            self.ballImageView.snp.updateConstraints { make in
                make.center.equalToSuperview()
                make.left.right.equalToSuperview().inset(40)
            }
            self.ballImageView.layoutIfNeeded()
        } completion: { com in
            UIView.animate(withDuration: 0.15) {
                self.hintLabel.alpha = 1
            }
        }

    }
    
    func shakeAnimation() {
        let animation = CABasicAnimation(keyPath: "position")
        animation.duration = 0.07
        animation.repeatCount = 4
        animation.autoreverses = true
        animation.fromValue = NSValue(cgPoint: CGPoint(x: ballImageView.center.x - 10, y: ballImageView.center.y))
        animation.toValue = NSValue(cgPoint: CGPoint(x: ballImageView.center.x + 10, y: ballImageView.center.y))

        ballImageView.layer.add(animation, forKey: "position")
    }
}


extension ViewController {
    
    @objc func goToSettings() {
        coordinator.showSettings()
    }
    
}

