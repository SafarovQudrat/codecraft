//
//  LoadingView.swift
//  Summer Time 16
//
//  Created by Murtazaev Mirjaloliddin Kamolovich on 21/06/24.
//  Copyright © 2024 app.soft-it. All rights reserved.
//

import UIKit
import Network

class LoadingViewController: UIViewController {
    
    private let backImage: UIImageView = {
        let i = UIImageView(image: UIImage(named: "backImg"))
        i.contentMode = .scaleAspectFill
        return i
    }()
    
    private let loadingLabel: UILabel = {
        let label = UILabel()
        label.text = NSLocalizedString("loading...", comment: "")
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        return label
    }()
    
    private let percentageLabel: UILabel = {
        let label = UILabel()
        label.text = "0%"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 32, weight: .medium)
        return label
    }()
    
    private let progressBar = StripedProgressBar()
    
    private var progress: CGFloat = 0.0 {
        didSet {
            progressBar.progress = progress
            percentageLabel.text = "\(Int(progress * 100))%"
        }
    }
    
    private var noInternetView: NoInternetConnectionView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Gradient.setupGradient(view: view)
        view.addSubview(backImage)
        view.addSubview(loadingLabel)
        view.addSubview(percentageLabel)
        view.addSubview(progressBar)
        
        setupConstraints()
        checkNetworkConnection()
        
        // Simulate loading process
        simulateLoading()
    }
    
    private func setupConstraints() {
        loadingLabel.translatesAutoresizingMaskIntoConstraints = false
        percentageLabel.translatesAutoresizingMaskIntoConstraints = false
        progressBar.translatesAutoresizingMaskIntoConstraints = false
        
        backImage.snp.makeConstraints { make in
            make.left.right.top.bottom.equalToSuperview()
        }
        
        progressBar.layer.cornerRadius = 6
        progressBar.clipsToBounds = true
        progressBar.snp.makeConstraints { make in
            make.centerY.equalTo(view.snp_centerYWithinMargins)
            make.centerX.equalTo(view.snp_centerXWithinMargins)
            make.height.equalTo(12)
            make.width.equalTo(300)
        }
        loadingLabel.snp.makeConstraints { make in
            make.bottom.equalTo(progressBar.snp.top).offset(-30)
            make.left.equalTo(progressBar.snp_leftMargin)
        }
        percentageLabel.snp.makeConstraints { make in
            make.bottom.equalTo(progressBar.snp.top).offset(-30)
            make.right.equalTo(progressBar.snp_rightMargin)
        }
    }
    
    private func simulateLoading() {
        // Simulate loading with a timer
        Timer.scheduledTimer(withTimeInterval: 0.3, repeats: true) { timer in
            if self.progress < 1.0 {
                self.progress += 0.2
            } else {
                timer.invalidate()
                // Loading completed
            }
        }
    }
    
    private func checkNetworkConnection() {
        let monitor = NWPathMonitor()
        let queue = DispatchQueue(label: "NetworkMonitor")
        
        monitor.pathUpdateHandler = { path in
            DispatchQueue.main.async {
                if path.status == .satisfied {
                    print("We're connected!")
                    self.noInternetView?.removeFromSuperview()
                    self.navigationController?.pushViewController(MainViewController(), animated: true)
                } else {
                    print("No connection.")
                    self.showNoInternetConnectionView()
                }
            }
        }
        
        monitor.start(queue: queue)
    }
    
    private func showNoInternetConnectionView() {
        noInternetView = NoInternetConnectionView(frame: view.bounds)
        if let noInternetView = noInternetView {
            view.addSubview(noInternetView)
        } else {
            navigationController?.pushViewController(TabBarViewController_vatr(), animated: true)
        }
    }
}
