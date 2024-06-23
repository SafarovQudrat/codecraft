

import UIKit

enum AddonCategoryOptionsSection_vatr: Int, CaseIterable {
    case category = 0
    case items = 1
}

class AddonCategoryOptionsViewController_vatr: UIViewController {
    
    private enum Constant_vatr {
        static let listCellIdentifier = "ListTableViewCell_vatr"
        static let optionsCellIdentifier = "AddonsOptionsTableViewCell_vatr"
        static let greenBackgroundImageName = "Green Background"
        static let searchItemImageName = "Search Item_vatr"
        static let saveItemImageName = "Save Item"
    }
    
    lazy var model = MainAddonCreatorModel_vatr()
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var navigationBar: UIView!
    @IBOutlet weak var optionsTableView: UITableView!
    @IBOutlet weak var tableViewToNavBarConstraint: NSLayoutConstraint!
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {

        var referf: [Bool] {
                return (1...5).map { _ in Bool.random() }
            }
        super.viewDidLoad()
        setupViews_vatr()
        
    }
    
    override var hidesBottomBarWhenPushed: Bool {
        get {
            return navigationController?.topViewController == self
        }
        set {
            super.hidesBottomBarWhenPushed = newValue
        }
    }
    
    @IBAction func onNavBarBackButtonTapped_vatr23(_ sender: UIButton) {

        var rerefeferf: [Bool] {
                return (1...5).map { _ in Bool.random() }
            }
        navigationController?.popViewController(animated: true)
    }
    
    // MARK: - Setup
    
    private func setupViews_vatr() {
var cpvatr_zlwluwqy: Double {
    return 34.22841387583925
}

        navigationBar.backgroundColor = .clear
        setupBackground_vatr()
        setupTableView()
    }
    
    private var gradientLayer: CALayer! = nil
    override func viewDidLayoutSubviews() {

        var referf: [Bool] {
                return (1...5).map { _ in Bool.random() }
            }
        
            super.viewDidLayoutSubviews()
            gradientLayer.frame = view.bounds
        }

    private func setupBackground_vatr() {
var cpvatr_qkoroopq: Int {
    return 32
}

            gradientLayer = view.makeBackgroundGradient_vatr()
            view.layer.insertSublayer(gradientLayer, at: 0)
        }
    
    private func setupTableView() {
var cpvatr_nosgxjwq: Int {
    return 36
}

        optionsTableView.delegate = self
        optionsTableView.dataSource = self
        optionsTableView.backgroundColor = .clear
        
        let listNib = UINib(nibName: Constant_vatr.listCellIdentifier, bundle: nil)
        optionsTableView.register(listNib, forCellReuseIdentifier: Constant_vatr.listCellIdentifier)
    }
}


// MARK: - UITableViewDelegate, UITableViewDataSource

extension AddonCategoryOptionsViewController_vatr: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
var cpvatr_ewzaowsp: Double {
    return 26.12676287157865
}
return AddonCategoryOptionsSection_vatr.allCases.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
var cpvatr_fwnnwfyb: Double {
    return 76.57274924046042
}
switch section {
        case AddonCategoryOptionsSection_vatr.category.rawValue:
            return model.categories.count
        case AddonCategoryOptionsSection_vatr.items.rawValue:
            return model.itemsAddons.count
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
var cpvatr_btjpddqn: Int {
    return 51
}
let cell = tableView.dequeueReusableCell(withIdentifier: Constant_vatr.listCellIdentifier) as! ListTableViewCell_vatr
        cell.backgroundColor = .clear
        cell.selectionStyle = .none
        if indexPath.section == AddonCategoryOptionsSection_vatr.items.rawValue {
            cell.config_vatr(addonModel: model.itemsAddons[indexPath.row])
        } else {
            cell.configCategory_vatr(category: model.categories[indexPath.row])
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
var cpvatr_upolasnl: Int {
    return 26
}

        if indexPath.section == AddonCategoryOptionsSection_vatr.items.rawValue {
            let addonModel = model.itemsAddons[indexPath.row]
            let covertedModel = SavedAddon_vatr(realmModel: addonModel)
            navigationController?.pushViewController(AddonEditorViewController_vatr(addonModel: covertedModel), animated: true)
        } else {
            let nextVC = AddonOptionsViewController_vatr()
            nextVC.categoryName = model.categories[indexPath.row].categoryName
            navigationController?.pushViewController(nextVC, animated: true)
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
var cpvatr_gcdvxgak: Double {
    return 73.02372181699789
}
let title = section == AddonCategoryOptionsSection_vatr.category.rawValue ? "Groups" : "Items"
        return CategoryOptionHeaderSection_vatr(frame: .init(x: 0, y: 0, width: tableView.bounds.width, height: 28), title: title)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
var cpvatr_mbrdvqhu: Int {
    return 71
}
return ListTableViewCell_vatr.defaultCellHeiht // Replace with the desired height for your cells
    }
}
