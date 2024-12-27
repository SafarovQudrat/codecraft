//
//  NoInternetConnectionView.swift
//  Summer Time 16
//
//  Created by Murtazaev Mirjaloliddin Kamolovich on 21/06/24.
//  Copyright © 2024 app.soft-it. All rights reserved.
//

import UIKit

class NoInternetConnectionView: UIView  {
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "No Wifi")
        imageView.tintColor = .white
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
     let messageBackView: GradientButtonView = {
        let v = GradientButtonView()
        v.layer.cornerRadius = 16
         
        v.layer.borderColor = UIColor.red.cgColor
        v.layer.borderWidth = 2
        return v
    }()
    
    private let messageLabel: UILabel = {
        let label = UILabel()
        label.text = "NO INTERNET CONNECTION!"
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textAlignment = .center
        return label
    }()
    
    private let okButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("OK", for: .normal)
        button.setTitleColor(#colorLiteral(red: 0.09646306187, green: 0.08194283396, blue: 0.8988967538, alpha: 1) , for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.backgroundColor = .white
        button.layer.cornerRadius = 15
        button.addTarget(self, action: #selector(dismiss), for: .touchUpInside)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        setupView()
    }
    
    private func setupView() {
        backgroundColor = .clear.withAlphaComponent(0.6)
        
        addSubview(imageView)
        addSubview(messageBackView)
        messageBackView.addSubview(messageLabel)
        addSubview(okButton)
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        imageView.translatesAutoresizingMaskIntoConstraints = false
        messageLabel.translatesAutoresizingMaskIntoConstraints = false
        okButton.translatesAutoresizingMaskIntoConstraints = false
        
        
        imageView.snp.makeConstraints { make in
            make.top.equalTo(self.safeAreaLayoutGuide.snp.top).offset(130)
            make.centerX.equalTo(self.snp_centerXWithinMargins)
            make.width.height.equalTo(94)
        }
        messageBackView.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp_bottomMargin).offset(88)
            if UIDevice.current.userInterfaceIdiom == .pad  {
                make.left.right.equalToSuperview().inset(20)
            }else {
                make.width.equalTo(335)
            }
            make.height.equalTo(100)
            make.centerX.equalTo(self.snp_centerXWithinMargins)
        }
        messageLabel.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview().inset(24)
            make.left.right.equalToSuperview().inset(20)
        }
        okButton.snp.makeConstraints { make in
            make.top.equalTo(messageBackView.snp_bottomMargin).offset(20)
            if UIDevice.current.userInterfaceIdiom == .pad{
                make.left.right.equalToSuperview().inset(20)
            }else {
                make.width.equalTo(335)
            }
            make.centerX.equalTo(self.snp_centerXWithinMargins)
            make.height.equalTo(50)
        }
        
        

    }
    
    @objc private func dismiss() {
        removeFromSuperview()
    }
}

