import Foundation
import UIKit

class NavBar_vatr {
    static func setupNavBar(on viewController: UIViewController, btnImg: String, title: String) {
        let view = viewController.view!
        
        let backBtn: GradientButton = {
            let btn = GradientButton()
            btn.translatesAutoresizingMaskIntoConstraints = false
            btn.layer.masksToBounds = true
            btn.layer.cornerRadius = 5
            btn.setImage(UIImage(named: btnImg), for: .normal)
            btn.addTarget(viewController, action: #selector(viewController.didTapPop), for: .touchUpInside)
            return btn
        }()
        
        let titleLbl: UILabel = {
            let lbl = UILabel()
            lbl.translatesAutoresizingMaskIntoConstraints = false
            lbl.text = title.uppercased()
            lbl.font = UIFont(name: "GillSans-Bold", size: 28)
            lbl.textColor = .white
            lbl.textAlignment = .center
            return lbl
        }()
        Gradient.setupGradient(view: backBtn)
        
        view.addSubview(backBtn)
        view.addSubview(titleLbl)
        
        NSLayoutConstraint.activate([
            titleLbl.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            titleLbl.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLbl.heightAnchor.constraint(equalToConstant: 30),
            
            backBtn.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 5),
            backBtn.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10),
            backBtn.heightAnchor.constraint(equalToConstant: 40),
            backBtn.widthAnchor.constraint(equalToConstant: 40)
        ])
    }
}

extension UIViewController {
    @objc func didTapPop() {
        navigationController?.popViewController(animated: true)
    }
}
