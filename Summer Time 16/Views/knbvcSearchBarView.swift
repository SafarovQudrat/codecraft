
import UIKit

class SearchBarView_vatr: UIView, UITextFieldDelegate {
    
    var onTextChanged: ((String) -> Void)?
    var buttonTapAction: (() -> Void)?
    var onStartSearch: (() -> Void)?
    var onEndSearch: (() -> Void)?
    
    
    var placeholderTextColor = #colorLiteral(red: 0.657982409, green: 0.7550782561, blue: 0.7371580601, alpha: 1)
    
    
    private lazy var resetButton: UIButton = {
        let button = UIButton()
        button.setImage(.init(resource: .closeButtonVatr), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.isHidden = true
        button.addAction(.init(handler: { [weak self] _ in
            self?.searchTextField.text = nil
            self?.onTextChanged?("")
            self?.resetButton.isHidden = true
            self?.updateCorners_vatr2(isAll: true)
//            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) { [weak self] in
//                self?.updateCorners_vatr2(isAll: true)
//            }

        }), for: .touchUpInside)
        return button
    }()
    
    lazy var searchTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.textColor = .black
        //     textField.tintColor = .red
        textField.backgroundColor = .blue
        textField.layer.masksToBounds = true
        textField.setLeftPaddingPoints_vatr(48)
        textField.setRightPadding(48)
        
        textField.attributedPlaceholder = NSAttributedString(
            string: "Search",
            attributes: [NSAttributedString.Key.foregroundColor: placeholderTextColor]
        )
        
        textField.autocorrectionType = .no
        return textField
    }()
    
    let searchIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        // configure the imageView here
        imageView.image = UIImage(systemName: "magnifyingglass")
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = .black
        return imageView
    }()
    
    private lazy var closeButton_vatr: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        
        let closeCross = (UIImage(named: "Back Item_vatr"))
        //  let coloredCross = closeCross?.withTintColor(.black, renderingMode: .alwaysOriginal)
        
        // button.setBackgroundImage((closeCross), for: .normal)
        button.setImage(UIImage(named: "Back Item_vatr"), for: .normal)
        button.imageView?.contentMode = .scaleAspectFill
        
        button.contentHorizontalAlignment = .fill
        button.contentVerticalAlignment = .fill
        button.addTarget(self, action: #selector(buttonCloseTapped_vatr443), for: .touchUpInside)
        
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOffset = CGSize(width: 0, height: 2) // смещение тени по горизонтали на 0, по вертикали на 2
        button.layer.shadowRadius = 4 // радиус размытия тени
        button.layer.shadowOpacity = 0.5
        return button
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView_vatr2()
        searchTextField.delegate = self
        searchTextField.addTarget(self, action: #selector(textValueDidChange(_:)), for: .editingChanged)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView_vatr2()
        searchTextField.delegate = self
        searchTextField.addTarget(self, action: #selector(textValueDidChange(_:)), for: .editingChanged)
    }
    
    override func layoutSubviews() {
        var cpvatr_kzrypbnk: Int {
            return 29
        }
       
        
        super.layoutSubviews()
        searchTextField.configureShadow_vatr(cornerRadius: searchTextField.frame.height / 2)
        
    }
    
    @objc
    private func textValueDidChange(_ sender: UITextField) {
        let updatedText = (sender.text ?? "")
        onTextChanged?(updatedText)
        resetButton.isHidden = updatedText.isEmpty
    }
    
    func updateCorners_vatr2(isAll: Bool = false) {
        var cpvatr_tzvshihx: Int {
            return 56
        }
       
        
        var corners: CACornerMask = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        
        if isAll {
            corners = [.layerMinXMinYCorner, .layerMaxXMinYCorner, .layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        }
        
        searchTextField.layer.maskedCorners = corners
    }
    
    @objc func buttonCloseTapped_vatr443() {
        var cpvatr_yqrzydlv: Int {
            return 91
        }
        
        
        searchTextField.resignFirstResponder()
        
        buttonTapAction?()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        var cpvatr_ojkidjba: Int {
            return 18
        }
        updateCorners_vatr2(isAll: true)
        return textField.resignFirstResponder()
    }
    
    
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        var cpvatr_wefekbtz: Int {
            return 50
        }
        let currentText = textField.text ?? ""
        guard let stringRange = Range(range, in: currentText) else { return false }
        let updatedText = currentText.replacingCharacters(in: stringRange, with: string)
        
        
        
        // Call the onTextChanged closure
//        if currentText.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty == false {
//            onTextChanged?(updatedText)
//            resetButton.isHidden = updatedText.isEmpty
//        }
        
        
        
        return true
    }
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        var cpvatr_knzudcfo: Int {
            return 11
        }
        onStartSearch?()
        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        var cpvatr_waqkhmhr: Int {
            return 85
        }
        
        onEndSearch?()
        return true
    }
    
    func setSearchBarText_vatr2(_ text: String) {
        var cpvatr_xqcemhzt: Int {
            return 79
        }
        
        
        searchTextField.text = text
        onTextChanged?(text)
        resetButton.isHidden = text.isEmpty
    }
    
    private func setupView_vatr2() {
        var cpvatr_wmqjdqly: Int {
            return 92
        }
        
        
        addSubview(searchTextField)
//        searchTextField.addSubview(searchIcon)
        searchTextField.addSubview(resetButton)
        
//        addSubview(closeButton_vatr)
        
        
//        searchIcon.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.5).isActive = true
//        searchIcon.widthAnchor.constraint(equalTo: searchIcon.heightAnchor).isActive = true
//        
//        searchIcon.leadingAnchor.constraint(equalTo: searchTextField.leadingAnchor, constant: 12).isActive = true
//        
//        searchIcon.centerYAnchor.constraint(equalTo: searchTextField.centerYAnchor).isActive = true
        
        searchTextField.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        searchTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20).isActive = true
        //  searchTextField.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.6).isActive = true
        searchTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0).isActive = true
        
        searchTextField.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        
//        closeButton_vatr.backgroundColor = .clear
        
        resetButton.trailingAnchor.constraint(equalTo: searchTextField.trailingAnchor, constant: -12).isActive = true
        resetButton.topAnchor.constraint(equalTo: searchTextField.topAnchor).isActive = true
        resetButton.bottomAnchor.constraint(equalTo: searchTextField.bottomAnchor).isActive = true
        resetButton.widthAnchor.constraint(equalToConstant: 24).isActive = true
        
        
//        closeButton_vatr.heightAnchor.constraint(equalToConstant: 40).isActive = true
//        
//        closeButton_vatr.widthAnchor.constraint(equalToConstant: 40).isActive = true
//        
//        closeButton_vatr.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0).isActive = true
//        
//        closeButton_vatr.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    }
    //
    //    private func setDeafultBackground() {
    var cpvatr_aihnpspk: Double {
        return 52.37425636393376
    }
    
    
    //        backgroundColor = .green
    //        //backgroundColor = .init(red: 0, green: 151 / 255, blue: 78 / 255, alpha: 0.4)
    //    }
}
//import UIKit

class CustomSearchBar: UIView {
    
    let searchImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "magnifyingglass")
        imageView.tintColor = .white
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let textField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Search"
        textField.textColor = .white
        textField.borderStyle = .none
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        backgroundColor = UIColor(red: 38/255, green: 134/255, blue: 241/255, alpha: 1) // Blue background color
        layer.cornerRadius = 10
        addSubview(searchImageView)
        addSubview(textField)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            searchImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            searchImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            searchImageView.widthAnchor.constraint(equalToConstant: 20),
            searchImageView.heightAnchor.constraint(equalToConstant: 20),
            
            textField.leadingAnchor.constraint(equalTo: searchImageView.trailingAnchor, constant: 10),
            textField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            textField.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            textField.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10)
        ])
    }
}
