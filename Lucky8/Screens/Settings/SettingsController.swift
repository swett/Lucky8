//
//  SettingsController.swift
//  Lucky8
//
//  Created by Vitaliy Griza on 20.12.2022.
//

import UIKit

class SettingsController: UIViewController {

    //MARK: UI
    var tableView: UITableView!
    
    //MARK: Coordinator
    private let coordinator: CoordinatorProtocol
    private let viewModel: SettingsViewModelProtocol
    
    init(coordinator: CoordinatorProtocol, viewModel: SettingsViewModelProtocol) {
        self.coordinator = coordinator
        self.viewModel = viewModel
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
    override var preferredStatusBarStyle: UIStatusBarStyle {
        .lightContent
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
        tableView = UITableView().then({ table in
            view.addSubview(table)
            table.backgroundColor = .mainBgColor
            table.register(SettingsCell.self, forCellReuseIdentifier: SettingsCell.id)
            table.dataSource = self
            table.delegate = self
            table.separatorStyle = .none
            table.snp.makeConstraints { make in
                make.edges.equalToSuperview()
            }
        })
    }
}

extension SettingsController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.numberOfRows(in: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SettingsCell.id, for: indexPath) as! SettingsCell
        let cellViewModel = viewModel.model(at: indexPath)
        cell.setup(with: cellViewModel)
        return cell
    }
}

extension SettingsController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            print("0")
            break;
        case 1:
            print("1")
            break;
        case 2:
            coordinator.showHowItWorks()
            break;
        case 3:
            print("3")
            break;
        default:
            print("something Wrong")
        }
        
    }
}

extension SettingsController {
    @objc func backToMainScreen() {
        coordinator.showMainScreen()
    }
}
