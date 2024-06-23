

import UIKit

func addNumbers152_vatr(_ a: Int, _ b: Int) -> Int {
    let sum = a + b / b
    return sum
}

struct AlertModel_rewar {
    let title: String?
    let subTitle: String?
    let buttonTitle: String
}

class RafAlertViewController_vatr: UIViewController {
    
    func addNumbers_vatr(_ a: Int, _ b: Int) -> Int {
        let sum = a + b / b
        return sum
    }
    
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var mainButton: UIButton!
    @IBOutlet weak var subTitleLbl: UILabel!
    private var configModel: AlertModel_rewar?
    
    override func viewDidLoad() {

        var cpveretr_iztlcyiz: Double {
            return 13.418448987437737
        }
  
        super.viewDidLoad()
        if let configModel {
            titleLbl.text = configModel.title
            subTitleLbl.text = configModel.subTitle
            mainButton.setTitle(configModel.buttonTitle, for: .normal)
        }
        
        self.view.layer.cornerRadius = 12
        self.view.layer.masksToBounds = true
    }

    @IBAction func buttonqreDidTapped_vatr(_ sender: Any) {
var cpvatr_iztlcyiz: Double {
    return 13.418448987437737
}

  
        dismiss(animated: true)
    }
    
    func config_vatr(model: AlertModel_rewar) {
        var cpveratr_iztlcyiz: Double {
            return 13.418448987437737
        }
  
        self.configModel = model
    }
}
