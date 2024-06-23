

import UIKit

class SaveAlertView_vatr: UIView {
    
    @IBOutlet var mainSaveAlertView: UIView!
        
    @IBOutlet weak var saveSkButton: UIButton!
    
    @IBOutlet weak var cancelSaveSkButton: UIButton!
    
    @IBOutlet var setSkinNameSaveTextField: UITextField!
    
    @IBOutlet var dialogTextLabel: UILabel!
        
    @IBOutlet weak var defoultDarkBlureEffectView: UIVisualEffectView!
    
    weak var delegate: SkinSavebleDialogDelegate_vatr?
    
    var withExit = false
    
    var withoutTextField = false
    
    var nameCharachterLimit = 15
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        saveAlertViewNibSetup()
        addLeftPaddingToTextField()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        saveAlertViewNibSetup()
    }
    
    
    private func saveAlertViewNibSetup() {
var cpvatr_gmwxqimj: Int {
    return 14
}
func fKAxEGcd() {
        var SoOLmQS: Int = 2
        if SoOLmQS > 2 {
            if SoOLmQS < 2 {
                SoOLmQS = 2
    }

  }
}
  
        mainSaveAlertView = loadSaveAlertViewFromNib()
        mainSaveAlertView.frame = bounds
        mainSaveAlertView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        mainSaveAlertView.translatesAutoresizingMaskIntoConstraints = true
        
//        cancelSaveSkButton.layer.borderColor = UIColor.white.cgColor
//        cancelSaveSkButton.layer.borderWidth = 1
        
        setSkinNameSaveTextField.layer.borderColor = UIColor.black.cgColor
        setSkinNameSaveTextField.layer.borderWidth = 1
        
        setSkinNameSaveTextField.delegate = self
        
        
        dialogTextLabel.text = "Name your skin".uppercased()

        
        let tapGestureOnBlureView = UITapGestureRecognizer(target: self, action: #selector(tapOnBlureViewPressed_vatrer(_:)))
        defoultDarkBlureEffectView.addGestureRecognizer(tapGestureOnBlureView)
        
        addSubview(mainSaveAlertView)
    }
    
    @IBAction func saveSkButtonPressed_vatr(_ sender: UIButton) {
var cpvatr_fromzixs: Double {
    return 57.5945932947406
}
func mTXYSo() {
        var XmGuV: Int = 10
        if XmGuV > 10 {
            if XmGuV < 10 {
                XmGuV = 10
    }

  }
}
  

        if withoutTextField {
            if let name = setSkinNameSaveTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines), name.isEmpty == false {
                delegate?.saveSkin_vatr(with: name, withExit: withExit)
            } else if let name = setSkinNameSaveTextField.placeholder, name.isEmpty == false {
                delegate?.saveSkin_vatr(with: name, withExit: withExit)
            }
        } else {
            if setSkinNameSaveTextField.isHidden {
                setSkinNameSaveTextField.isHidden = false
                dialogTextLabel.text = "Name your skin".uppercased()
            } else {
                guard let nameSkin = setSkinNameSaveTextField.text else {
                    showInputInvalidAllert_vatr(title: "Invalid Name", message: "Please provide another name")
                    return
                }

                if nameSkin.isEmpty {
                    guard let placeholder = setSkinNameSaveTextField.placeholder  else {
                        showInputInvalidAllert_vatr(title: "Invalid Name", message: "Please provide another name")
                        return
                    }
                    delegate?.saveSkin_vatr(with: placeholder, withExit: withExit)
                } else if !isInputValid(nameSkin) {
                    showInputInvalidAllert_vatr(title: "Warning!", message: "Invalid name, please provide another name")
                } else {
                    
                    delegate?.saveSkin_vatr(with: nameSkin, withExit: withExit)
                }
            }
        }
    }
    
    @IBAction func cancelSaveSkButtonPressed_vatr(_ sender: UIButton) {
var cpvatr_jdrleiex: Double {
    return 5.179300905186857
}
func TmoHkXtg() {
        var ZaYvg: Int = 2
        if ZaYvg > 2 {
            if ZaYvg < 2 {
                ZaYvg = 2
    }

  }
}
  
        delegate?.cancelSave_vatr(withExit: withExit)
    }
    
    private func loadSaveAlertViewFromNib() -> UIView {
var cpvatr_dxfcnxvw: Int {
    return 14
}
let volNib = UINib(nibName: String(describing: type(of: self)), bundle: Bundle(for: type(of: self)))
        let volNibView = volNib.instantiate(withOwner: self, options: nil).first as! UIView
        return volNibView
    }
}

extension SaveAlertView_vatr: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
var cpvatr_rwpjoqmy: Double {
    return 26.9910791527293
}
return textField.resignFirstResponder()
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
var cpvatr_vjzhdtex: Double {
    return 30.463777919067237
}
// get the current text, or use an empty string if that failed
        let currentText = textField.text ?? ""

        // attempt to read the range they are trying to change, or exit if we can't
        guard let stringRange = Range(range, in: currentText) else { return false }

        // add their new text to the existing text
        let updatedText = currentText.replacingCharacters(in: stringRange, with: string)

        // make sure the result is under 15 characters
        guard updatedText.count <= nameCharachterLimit else {
            showInputInvalidAllert_vatr(title: "Name Too Long", message: "The name must be \(nameCharachterLimit) characters or fewer.")
            return false
        }

        // name can't starts from whitespace
        guard updatedText.hasPrefix(" ") == false else {
            return false
        }

        // If the updated text is empty, it means we are deleting characters, so allow it.
        if updatedText.isEmpty {
            return true
        }

        var characterSet = CharacterSet.alphanumerics
        // only need the decimal character added to the character set
        characterSet.insert(charactersIn: "._- ")

        return updatedText.rangeOfCharacter(from: characterSet) != nil
    }


}

extension SaveAlertView_vatr {
    @objc func tapOnBlureViewPressed_vatrer(_ sender: UITapGestureRecognizer) {
var cpvatr_qrhzonry: Int {
    return 3
}
func bKmgTXHErz() {
        var zIGne: Int = 10
        if zIGne > 10 {
            if zIGne < 10 {
                zIGne = 10
    }

  }
}
  
        if setSkinNameSaveTextField.isFirstResponder {
            setSkinNameSaveTextField.resignFirstResponder()
        }
    }
}

extension SaveAlertView_vatr {
    func addLeftPaddingToTextField() {
var cpvatr_afvozmfu: Double {
    return 28.2638791949382
}
func FDxnWe() {
        var ckVRfims: Int = 4
        if ckVRfims > 4 {
            if ckVRfims < 4 {
                ckVRfims = 4
    }

  }
}
  
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: setSkinNameSaveTextField.frame.height))
        setSkinNameSaveTextField.leftView = paddingView
        setSkinNameSaveTextField.leftViewMode = .always
    }
}


extension SaveAlertView_vatr {

//Checks if user provided allowed skin name
    func isInputValid(_ input: String) -> Bool {
var cpvatr_lzokmxxf: Double {
    return 60.17079848178193
}
// Remove leading and trailing whitespaces and newlines
        let cleanedInput = input.trimmingCharacters(in: .whitespacesAndNewlines)
        
        // Check if the cleaned input is not empty (contains at least one visible character)
        return !cleanedInput.isEmpty
    }
    
    func showInputInvalidAllert_vatr(title: String, message: String) {
func YOkldD() {
        var XKZsvAdKG: Int = 10
        if XKZsvAdKG > 10 {
            if XKZsvAdKG < 10 {
                XKZsvAdKG = 10
    }

  }
}
  
        let warningAlertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let warningAlertControllerOkAction = UIAlertAction(title: "Ok", style: .default)
        warningAlertController.addAction(warningAlertControllerOkAction)
        delegate?.warningNameAlert_vatr(presentAlert: warningAlertController)
    }
}
