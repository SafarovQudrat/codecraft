//
//  MainViewController.swift
//  Summer Time 16
//
//  Created by Murtazaev Mirjaloliddin Kamolovich on 21/06/24.
//  Copyright © 2024 app.soft-it. All rights reserved.
//

import UIKit
import SnapKit

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .blue // Set your preferred background color or gradient
        
        let titleLabel = UILabel()
        titleLabel.text = "MENU"
        titleLabel.font = UIFont.boldSystemFont(ofSize: 24)
        titleLabel.textColor = .white
        view.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(40)
            make.centerX.equalToSuperview()
        }
        
        let buttonTitles = ["MODS", "SHADERS", "CONTENT", "ITEMS", "SKIN EDITOR", "ADDON CREATOR", "SETTINGS"]
        let selectors: [Selector] = [#selector(modsButtonTapped),
                                     #selector(shadersButtonTapped),
                                     #selector(contentButtonTapped),
                                     #selector(itemsButtonTapped),
                                     #selector(skinEditorButtonTapped),
                                     #selector(addonCreatorButtonTapped),
                                     #selector(settingsButtonTapped)]
        
        var lastButton: UIButton?
        
        for (index, title) in buttonTitles.enumerated() {
            let button = createButton(title: title)
            button.addTarget(self, action: selectors[index], for: .touchUpInside)
            view.addSubview(button)
            button.snp.makeConstraints { make in
                if let lastButton = lastButton {
                    make.top.equalTo(lastButton.snp.bottom).offset(16)
                } else {
                    make.top.equalTo(titleLabel.snp.bottom).offset(40)
                }
                make.centerX.equalToSuperview()
                make.width.equalTo(200)
                make.height.equalTo(50)
            }
            lastButton = button
        }
    }
    
    private func createButton(title: String) -> UIButton {
        let button = UIButton(type: .system)
        button.setTitle(title, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 10
        return button
    }
    
    // MARK: - Button Actions
    
    @objc private func modsButtonTapped() {
        let modsVC = ModsTabViewController_vatr()
        navigationController?.pushViewController(modsVC, animated: true)
    }
    
    @objc private func shadersButtonTapped() {
        let shadersVC = SeedTabViewController_vatr()
        navigationController?.pushViewController(shadersVC, animated: true)
    }
    
    @objc private func contentButtonTapped() {
        let contentVC = SeedTabViewController_vatr()
        navigationController?.pushViewController(contentVC, animated: true)
    }
    
    @objc private func itemsButtonTapped() {
        let itemsVC = ItemsTabViewController_vatr()
        navigationController?.pushViewController(itemsVC, animated: true)
    }
    
    @objc private func skinEditorButtonTapped() {
        let skinEditorVC = CreateTabViewController_vatr()
        navigationController?.pushViewController(skinEditorVC, animated: true)
    }
    
    @objc private func addonCreatorButtonTapped() {
        let addonCreatorVC = AddonCreatorMainVC_vatr()
        navigationController?.pushViewController(addonCreatorVC, animated: true)
    }
    
    @objc private func settingsButtonTapped() {
        let settingsVC = SettingsViewController_vatr()
        navigationController?.pushViewController(settingsVC, animated: true)
    }
}
