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
    
    private let loadingLabel: UILabel = {
        let label = UILabel()
        label.text = "Loading..."
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        return label
    }()
    
    private let percentageLabel: UILabel = {
        let label = UILabel()
        label.text = "0%"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 18, weight: .medium)
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
        
        view.backgroundColor = UIColor(red: 0.0, green: 0.5, blue: 1.0, alpha: 1.0)
        
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
        
        NSLayoutConstraint.activate([
            loadingLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loadingLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -30),
            
            percentageLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            percentageLabel.topAnchor.constraint(equalTo: loadingLabel.bottomAnchor, constant: 10),
            
            progressBar.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            progressBar.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            progressBar.topAnchor.constraint(equalTo: percentageLabel.bottomAnchor, constant: 20),
            progressBar.heightAnchor.constraint(equalToConstant: 10)
        ])
    }
    
    private func simulateLoading() {
        // Simulate loading with a timer
        Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { timer in
            if self.progress < 1.0 {
                self.progress += 0.01
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
