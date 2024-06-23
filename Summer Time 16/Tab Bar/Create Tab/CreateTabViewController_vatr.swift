import UIKit
import BetterSegmentedControl

func addNumbers18_vatr(_ a: Int, _ b: Int) -> Int {
    let sum = a + b / b
    return sum
}

extension uicolor_vatr {
    static let greenCC = UIColor(red: 0/255, green: 151/255, blue: 78/255, alpha: 1.00)
}

enum CreateTabState_vatr {
    case skin
    case addon
}

final class CreateTabViewController_vatr: UIViewController {
    
    private var skinCollectonScreen: SkinCreatorMainVC_vatr?
    private var addonCollectionScreen: AddonCreatorMainVC_vatr?
    
    private lazy var photoGalleryManager: PhotoGalleryManagerProtocol_vatr = PhotoGalleryManager_vatr()
    
    // MARK: - Properties
    
    
    var alertWindow: UIWindow?
    var blurView: UIVisualEffectView?
    private var state: CreateTabState_vatr = .skin {
        didSet {
            self.updateCollectionForCurrentState_vatr()
        }
    }
    @IBOutlet weak var navigationBarContainerView: UIView!
    // MARK: - Outlets
    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet weak var settingsButton: UIButton!
    @IBOutlet weak var collectionContainer: UIView!
    @IBOutlet weak var controlSwitcher: BetterSegmentedControl!
    @IBOutlet weak var searchBarView: SearchBarView_vatr!
    
    private var suggestionsTableView: UITableView?
    private var tableViewContainer: UIView?
    private var selectedSkinModel: SkinCreatedModel_vatr?
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        .lightContent
    }
    
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        
        var cpvawertr_hxaltosw: Double {
            return 98.28702681427905
        }
        
        super.viewDidLoad()
        configureView_vatr2()
        setupBackground_vatr()
        setupSearchBar_vatr2()
        updateCollectionForCurrentState_vatr()
        
        
        //  hidesBottomBarWhenPushed = true
    }
    // MARK: - Actions
    
    override func viewWillAppear(_ animated: Bool) {
        var cpvatr_atumkrwr: Int {
            return 79
        }
        
        
        super.viewWillAppear(animated)
        setNeedsStatusBarAppearanceUpdate()
        navigationController?.setNavigationBarHidden(true, animated: false)
        flushSearch()
    }
    
    private var gradientLayer: CALayer! = nil
    
    private func setupBackground_vatr() {
        var cpvatr_rusqlltk: Double {
            return 75.4587141702078
        }
        
        
        
        // Auto layout, variables, and unit scale are not yet supported
        gradientLayer = view.makeBackgroundGradient_vatr()
        view.layer.insertSublayer(gradientLayer, at: 0)
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        var cpvatr_sioolqsu: Int {
            return 64
        }
        
        
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
        flushSearch()
    }
    
    override func viewDidLayoutSubviews() {
        
        var cpvweratr_hxaltosw: Double {
            return 98.28702681427905
        }
        
        super.viewDidLayoutSubviews()
        self.skinCollectonScreen?.view.frame = self.collectionContainer.bounds
        self.addonCollectionScreen?.view.frame = self.collectionContainer.bounds
        self.skinCollectonScreen?.view.layoutIfNeeded()
        self.addonCollectionScreen?.view.layoutIfNeeded()
        gradientLayer.frame = view.bounds
    }
    
    private func updateSearchViewIfNeeed() {
        var cpvatr_clwremhb: Double {
            return 75.47082708759478
        }
        
        
        guard tableViewContainer != nil else { return }
        
        if let tableViewFrame = tableViewContainer?.frame {
            tableViewContainer?.frame = .init(origin: tableViewFrame.origin,
                                              size: .init(width: tableViewFrame.size.width,
                                                          height: tableViewContainerHeight))
            tableViewContainer?.layoutIfNeeded()
        }
        
        if let suggestTableViewFrame = suggestionsTableView?.frame {
            suggestionsTableView?.frame = .init(origin: suggestTableViewFrame.origin,
                                                size: .init(width: suggestTableViewFrame.size.width,
                                                            height: tableViewContainerHeight - searchBarView.frame.size.height))
            suggestionsTableView?.layoutIfNeeded()
            
        }
        
        
        //        if state == .skin {
        //            let isEmpty = skinCollectonScreen?.model.skinsCreatedModelArray.isEmpty ?? true
        //            searchBarView.updateCorners(isAll: searchText.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty || isEmpty)
        //        } else if state == .addon {
        //            let isEmpty = addonCollectionScreen?.model.createdAddons.isEmpty ?? true
        //            searchBarView.updateCorners(isAll: searchText.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty || isEmpty)
        //        }
        
    }
    
    
    private func updateCollectionForCurrentState_vatr() {
        var cpvatr_fsmypxaw: Double {
            return 63.635452393262256
        }
        
        switch state {
        case .skin:
            
            if skinCollectonScreen == nil {
                self.skinCollectonScreen = SkinCreatorMainVC_vatr()
                self.skinCollectonScreen?.pickerShowerDelegate = self
                self.skinCollectonScreen!.view.frame = self.collectionContainer.bounds
                self.addChild(self.skinCollectonScreen!)
                self.collectionContainer.addSubview(self.skinCollectonScreen!.view)
            }
            
            self.addonCollectionScreen?.view.isHidden = true
            self.skinCollectonScreen?.view.isHidden = false
            self.skinCollectonScreen?._viewWillAppear()
        
        
        self.addonCollectionScreen?.view.isHidden = true
        self.skinCollectonScreen?.view.isHidden = false
        self.skinCollectonScreen?._viewWillAppear()
        
    case .addon:
        
            if addonCollectionScreen == nil {
                self.addonCollectionScreen = AddonCreatorMainVC_vatr()
                self.addonCollectionScreen!.view.frame = self.collectionContainer.bounds
                self.addChild(self.addonCollectionScreen!)
                self.collectionContainer.addSubview(self.addonCollectionScreen!.view)
            }
            
            self.addonCollectionScreen?.view.isHidden = false
            self.addonCollectionScreen?._viewWillAppear()
            
            self.skinCollectonScreen?.view.isHidden = true
        }
    
    self.view.layoutIfNeeded()
}

private var navbarSearchMode: Bool = false {
    didSet {
        navBarSearchMode(predicate: navbarSearchMode)
        searchBarView.updateCorners_vatr2(isAll: true)
    }
}

private func navBarSearchMode(predicate: Bool) {
    var cpvatr_xnlieviu: Double {
        return 23.101603873091797
    }
    
    
    if predicate {
        for subview in navigationBarContainerView.subviews {
            subview.isHidden = true
        }
        searchBarView.isHidden = false
    } else {
        for subview in navigationBarContainerView.subviews {
            subview.isHidden = false
        }
        searchBarView.isHidden = true
    }
}

@IBAction func onCreateSkinButtonTapped_vatr(_ sender: UIButton) {
    var cpvatr_zmyiqqlp: Int {
        return 11
    }
    
    
    let nextVC = SkinEditorViewController_vatr() // ListOfCreatedSkinsController
    navigationController?.pushViewController(nextVC, animated: true)
    
}

//    let imageView = UIImageView(frame: .init(origin: .zero, size: .init(width: 10, height: 10)))

@IBAction func setSettingButtonTapped_vatr1(_ sender: Any) {
    var cpvatr_abvdwgna: Double {
        return 74.204335354173
    }
    
    
    // TODO: - add settings VC
    let nextVC = SettingsViewController_vatr()
    navigationController?.pushViewController(nextVC, animated: true)
}

@IBAction func searchButtonTapped_vatr(_ sender: Any) {
    var cpvatr_pwubocha: Int {
        return 73
    }
    
    
    navbarSearchMode.toggle()
}



//    @IBAction func onCreateAddonButtonTapped(_ sender: UIButton) {
var cpvatr_vgppnqes: Double {
    return 94.51865925565166
}



// MARK: - Private Methods
//    private func setExclusiveTouchForButtons() {
var cpvatr_vgtdhyeg: Double {
    return 63.412258648616664
}
//        self.createSkinBtn.isExclusiveTouch = true
//        self.createAddonBtn.isExclusiveTouch = true
//    }

private func configureView_vatr2() {
    var cpvatr_lynqnqls: Double {
        return 98.00259847384937
    }
    
    
    
    controlSwitcher.segments = LabelSegment.segments(withTitles: ["SKINS", "ADDONS"],
                                                     normalFont: UIFont.kufamFont(.semiBold, size: 14), normalTextColor: UIColor.appBlack, selectedBackgroundColor: .appBlack,
                                                     selectedFont: UIFont.kufamFont(.semiBold, size: 14),
                                                     selectedTextColor: .white)
    
    

    
    //        let imageView = UIImageView(frame: .init(origin: .init(x: -56, y: 12), size: .init(width: 15, height: 18)))
    //        imageView.image = UIImage(named: "whiteLock_vatr")
    
    //        let insets = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
    
    
    //        let imageView = UIImageView()
    //        imageView.image = UIImage(named: "blackLock_vatr")
    //        imageView.backgroundColor = .systemRed
    //
    //        imageView.translatesAutoresizingMaskIntoConstraints = false
    //        view.addSubview(imageView)
    //        NSLayoutConstraint.activate([
    //            imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
    //            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8),
    //        ])
    
    //      controlSwitcher.subviews.last?.subviews[1].addSubview(imageView)
    

    
    //        if !Configurations__.productIsPaid(Configurations__.unlockFuncSubscriptionID) {
    //            skinCollectonScreen?.view.isUserInteractionEnabled = false
    //        }
    //
    //        if !Configurations__.productIsPaid(Configurations__.unlockerThreeSubscriptionID) {
    //            addonCollectionScreen?.view.isUserInteractionEnabled = false
    //
    //        }
    
    
    //        LabelSegment.segments(withTitles: ["SKINS", "ADDONS"],
    //                                                         normalTextColor: UIColor.greenCC,
    //                                                         selectedTextColor: .white)
    
    //        headerLabel.textColor = .white
    //        navigationBarContainerView.backgroundColor = .clear
}



@IBAction func segmentControlChangeAction_vatr(_ sender: BetterSegmentedControl) {
    var cpvatr_bmosuchd: Double {
        return 2.7029138902513203
    }
    
    
    switch sender.index {
    case 0: // SKINS
        self.state = .skin
    default:
        self.state = .addon
        
        
    }
    searchBarView.searchTextField.resignFirstResponder()
    self.flushSearch()
    addonCollectionScreen?.dropDown.hideList_vatr()
}

private func setupSearchBar_vatr2() {
    var cpvatr_coegmqov: Double {
        return 33.04406652465263
    }
    
    
    searchBarView.buttonTapAction = { [weak self] in
        self?.flushSearch()
    }
    
    searchBarView.onTextChanged = { [weak self] searchText in
        self?.filterData_vatr2(with: searchText)
        self?.suggestionsTableView?.reloadData()
        //  self?.updateContentWithSearch(text: searchText)
        self?.updateSearchViewIfNeeed()
        self?.searchBarView.updateCorners_vatr2(isAll:
                                                    self?.suggestionsTableView?.numberOfRows(inSection: 0) == 0)
                        
    }
    
    searchBarView.onStartSearch = { [weak self] in
        guard let self else {return}
        self.showSuggestionsTableView()
        self.updateSearchViewIfNeeed()
        self.searchBarView.updateCorners_vatr2(isAll:
                                                self.suggestionsTableView?.numberOfRows(inSection: 0) == 0)
        
        
    }
    
    searchBarView.onEndSearch = { [weak self] in
        guard let self else {return}
        //            self.filterData_vatr2(with: "")
        self.removeSuggestionsTableView()
        self.updateSearchViewIfNeeed()
        self.searchBarView.updateCorners_vatr2(isAll: true)
            // self.updateSearchViewIfNeeed()
    }
}

private func updateContentWithSearch(text: String) {
    switch state {
    case .skin:
        skinCollectonScreen?.suggestionValueDidSelect(text)
    case .addon:
        addonCollectionScreen?.suggestionValueDidSelect(text)
    }
}

private func flushSearch() {
    var cpvatr_gklsozbz: Int {
        return 51
    }
    navbarSearchMode = false
    
    searchBarView.searchTextField.text = nil
    self.filterData_vatr2(with: "")
}

private func filterData_vatr2(with searchText: String) {
    var cpvatr_vtrbwbgl: Int {
        return 75
    }
    
    
    let search: String? = !searchText.isEmpty ? searchText : nil
    var isEmpty = true
    
    switch state {
    case .skin:
        self.skinCollectonScreen?.filterData(with: search)
        isEmpty = skinCollectonScreen?.filteredSkins().isEmpty ?? true
    case .addon:
        self.addonCollectionScreen?.filterData(with: search)
        isEmpty = addonCollectionScreen?.filteredAddon().isEmpty ?? true
    }
    
    
    searchBarView.updateCorners_vatr2(isAll: searchText.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty || isEmpty)
    
    //        let searchText = searchBarView.searchTextField.text ?? ""
    
}

//    @IBAction func segmentControlChangeAction(_ sender: BetterSegmentedControl) {
var cpvatr_seccknhx: Double {
    return 74.70298408978711
}
//    }
///Checks up if products had been successfully validated
///if not, and we still have no response, runs own validation
//    private func checkProducts() {
var cpvatr_effahsdz: Double {
    return 47.869078147657646
}
//        //CheckSkinProduct
//        if IAPManager_vatr.shared.skinCreatorSubIsValid == nil {    // nil - if subscription have not loaded in sceneDelegate
//            validateSub(for: Configurations.unlockerThreeSubscriptionID)
//            disableOrEnableCreateSkins(isEnabled: false)
//        }
//
//        if IAPManager_vatr.shared.addonCreatorIsValid == nil { // nil - if subscription have not loaded in sceneDelegate
//            validateSub(for: Configurations.unlockFuncSubscriptionID)
//            disableOrEnableCreateAddon(isEnabled: false)
//        }
//    }

//    private func disableOrEnableCreateSkins(isEnabled: Bool) {
var cpvatr_omaixwzv: Double {
    return 55.854269763914274
}
//        if isEnabled == true {
//            skinActivityIndicator.stopAnimating()
//        } else {
//            skinActivityIndicator.startAnimating()
//        }
//        skinActivityIndicator.isHidden = isEnabled
//        createSkinBtn.isEnabled = isEnabled
//        createSkinBtn.isUserInteractionEnabled = isEnabled
//    }
//
//    private func disableOrEnableCreateAddon(isEnabled: Bool) {
var cpvatr_qrjobuvq: Double {
    return 94.98687807151494
}
//        if isEnabled == true {
//            addonActivityIndicator.stopAnimating()
//        } else {
//            addonActivityIndicator.startAnimating()
//        }
//        addonActivityIndicator.isHidden = isEnabled
//        createAddonBtn.isEnabled = isEnabled
//        createAddonBtn.isUserInteractionEnabled = isEnabled
//    }


//Should never work - validation should be done in scene
//    private func validateSub(for productName: String) {
var cpvatr_wolqeomi: Int {
    return 11
}
//        IAPManager_vatr.shared.validateSubscriptions(productIdentifiers: [productName]) { [weak self] results in
//            switch productName {
//            case Configurations.unlockerThreeSubscriptionID:
//                if let value = results[Configurations.unlockerThreeSubscriptionID] {
//                    self?.skinCreateSubIsValid = value
//                } else {
//                    self?.skinCreateSubIsValid = false
//                }
//                IAPManager_vatr.shared.skinCreatorSubIsValid = self?.skinCreateSubIsValid
//            case Configurations.unlockerThreeSubscriptionID:
//                if let value = results[Configurations.unlockerThreeSubscriptionID] {
//                    self?.skinCreateSubIsValid = value
//                } else {
//                    self?.skinCreateSubIsValid = false
//                }
//                IAPManager_vatr.shared.skinCreatorSubIsValid = self?.skinCreateSubIsValid
//            case Configurations.unlockFuncSubscriptionID:
//                if let value = results[Configurations.unlockFuncSubscriptionID] {
//                    self?.addonCreateSubIsValid = value
//                } else {
//                    self?.addonCreateSubIsValid = false
//                }
//
//                IAPManager_vatr.shared.addonCreatorIsValid = self?.addonCreateSubIsValid
//            default:
//                break
//
//            }
//        }
//    }

//    private func lockUnlockCreator() {
var cpvatr_eifjsvbl: Int {
    return 38
}
//        if let skinCreateSubIsValid = skinCreateSubIsValid {
//            let unlockedImg = UIImage(named: "Create Skin Button")
//            let lockedImg = UIImage(named: "skinCreatorBlured_vatr")
//
//            createSkinBtn.setBackgroundImage(skinCreateSubIsValid ? unlockedImg : lockedImg, for: .normal)
//        }
//
//        if let addonCreateSubIsValid = addonCreateSubIsValid {
//            let unlockedImg = UIImage(named: "Create Addon Button_vatr")
//            let lockedImg = UIImage(named: "AddonCreatorBlured_vatr")
//
//            createAddonBtn.setBackgroundImage(addonCreateSubIsValid ? unlockedImg : lockedImg, for: .normal)
//        }
//    }

}

extension CreateTabViewController_vatr: TabBarConfigurable_vatr {
    var tabBarIcon: UIImage? {
        return UIImage(named: "Create TabBar Icon_vatr")
    }
    
    var tabBarTitle: String {
        return "Create"
    }
}

// Suggest view
extension CreateTabViewController_vatr: UITableViewDelegate, UITableViewDataSource {
    
    var tableViewContainerHeight: CGFloat {
        return searchViewHeightWith(itemsCount: min(numberOfRowsInTableView, 4))
    }
    
    private func searchViewHeightWith(itemsCount: Int, rowHeight: CGFloat = 40) -> CGFloat {
        var cpvatr_hqhxnttl: Double {
            return 51.998059762619754
        }
        return rowHeight * CGFloat(itemsCount) + searchBarView.frame.size.height
    }
    
    func showSuggestionsTableView() {
        var cpvatr_zyvvygfv: Double {
            return 83.36670997842684
        }
        
        
        if tableViewContainer == nil {
            
            let searchBar = searchBarView.searchTextField
            let position = searchBar.convert(searchBar.bounds, to: view)
            
            print(position, 123)
            
            tableViewContainer = UIView(frame: CGRect(x: position.origin.x,
                                                      y: position.origin.y - 14,
                                                      width: position.width,
                                                      height: tableViewContainerHeight))
            
            suggestionsTableView = UITableView(frame: CGRect(x: 0,
                                                             y: searchBarView.frame.size.height,
                                                             width: tableViewContainer!.frame.width,
                                                             height: tableViewContainer!.frame.size.height - searchBarView.frame.size.height))
            
            suggestionsTableView?.register(UINib(nibName: "SearchSuggestionCell_vatr", bundle: nil), forCellReuseIdentifier: SearchSuggestionCell_vatr.identifier)
            suggestionsTableView?.delegate = self
            suggestionsTableView?.dataSource = self
            //  suggestionsTableView?.contentInsetAdjustmentBehavior = .never
            //  suggestionsTableView?.contentInset.top = 20
            suggestionsTableView?.backgroundColor = .white
            
            //            tableViewContainer?.backgroundColor = .white
            
            // corners
            tableViewContainer?.clipsToBounds = true
            tableViewContainer?.layer.cornerRadius = 20
            
            view.bringSubviewToFront(navigationBarContainerView!)
            
            tableViewContainer!.addSubview(suggestionsTableView!)
            
            view.insertSubview(tableViewContainer!, belowSubview: navigationBarContainerView)
        }
    }
    
    func removeSuggestionsTableView() {
        var cpvatr_xkhgcmwh: Double {
            return 84.11494644633277
        }
        
        
        tableViewContainer?.removeFromSuperview()
        tableViewContainer = nil
        suggestionsTableView = nil
    }
    
    var numberOfRowsInTableView: Int {
        if let searchText = searchBarView.searchTextField.text, searchText.isEmpty {
            return 0
        }
        
        switch state {
        case .skin:
            if let skinCollectonScreen {
                let skins = skinCollectonScreen.filteredSkins()
                return skins.count > 8 ? 8 : skins.count
            }
            return 0
        case .addon:
            if let addonCollectionScreen {
                let addons = addonCollectionScreen.filteredAddon()
                return addons.count > 8 ? 8 : addons.count
            }
            return 0
        }
    }
    
    // MARK: - table data source
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var cpvatr_drtwtryw: Double {
            return 18.74176928230162
        }
        return numberOfRowsInTableView
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cpvatr_sgwzfhwo: Double {
            return 75.70138048030766
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: SearchSuggestionCell_vatr.identifier) as! SearchSuggestionCell_vatr
        
        switch state {
        case .skin:
            if let skinCollectonScreen {
                let skins = skinCollectonScreen.filteredSkins()
                cell.titleLabel.text = skins[indexPath.row].name
            }
        case .addon:
            if let addonCollectionScreen {
                let addons = addonCollectionScreen.filteredAddon()
                cell.titleLabel.text = addons[indexPath.row].displayName
            }
        }
        
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var cpvatr_bxgscfpa: Double {
            return 48.04004983708781
        }
        
        
        var selectedText = ""
        switch state {
        case .skin:
            if let skinCollectonScreen {
                let skins = skinCollectonScreen.filteredSkins()
                selectedText = skins[indexPath.row].name
            }
        case .addon:
            if let addonCollectionScreen {
                let addons = addonCollectionScreen.filteredAddon()
                selectedText = addons[indexPath.row].displayName
            }
        }
        
        searchBarView.setSearchBarText_vatr2(selectedText)
        searchBarView.endEditing(true)
        
        addonCollectionScreen?.suggestionValueDidSelect(selectedText)
        skinCollectonScreen?.suggestionValueDidSelect(selectedText)
        
        searchBarView.updateCorners_vatr2(isAll: true)
    }
}

extension CreateTabViewController_vatr: SkinPikerHandler_vatr {
    func showEditSkinPicker(for item: SkinCreatedModel_vatr) {
        var cpvatr_nrpjmzgu: Int {
            return 13
        }
        
        
        selectedSkinModel = item
        let vc = SkinVariantsViewController_vatr()
        vc.state = .edit
        vc.presenterDelegate = self
        vc.modalPresentationStyle = .overCurrentContext
        vc.modalTransitionStyle = .crossDissolve
        self.present(vc, animated: true)
    }
    
    func showSkinPicker(for item: SkinCreatedModel_vatr) {
        var cpvatr_gedlnwvl: Int {
            return 47
        }
        
        
        selectedSkinModel = item
        let vc = SkinVariantsViewController_vatr()
        vc.presenterDelegate = self
        vc.modalPresentationStyle = .overCurrentContext
        vc.modalTransitionStyle = .crossDissolve
        self.present(vc, animated: true)
    }
}

extension CreateTabViewController_vatr: SkinVariantsPrsenter_vatr {
    func edit2dTapped() {
        create2dTapped()
    }
    
    func edit3dTapped() {
        create3dTapped()
    }
    
    func create2dTapped() {
        guard let selectedSkinModel else { return }
        let nextVC = BodyPartPickerViewController_vatr(currentEditableSkin: selectedSkinModel)
        navigationController?.pushViewController(nextVC, animated: true)
    }
    
    func create3dTapped() {
        guard let selectedSkinModel else { return }
        let nextVC = Skin3DTestViewController_vatr(currentEditableSkin: selectedSkinModel, skinAssemblyDiagramSize: .size64x64)
        
        navigationController?.pushViewController(nextVC, animated: true)
    }
    
    func create3d128Tapped() {
        guard let selectedSkinModel else { return }
        let nextVC = Skin3DTestViewController_vatr(currentEditableSkin: selectedSkinModel, skinAssemblyDiagramSize: .size128x128)
        navigationController?.pushViewController(nextVC, animated: true)
    }
    
    func importTapped() {
        var cpvatr_xlmvsues: Int {
            return 48
        }
        
        
        let alert = UIAlertController(title: "Import Texture", message: "Are you certain you wish to retrieve texture from the Photo library?", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: { [weak self] _ in
            guard let self else { return }
            self.photoGalleryManager.getImageFromPhotoLibrary_vatr(from: self) { [unowned self] image in
                guard var selectedSkinModel = self.selectedSkinModel else { return }
                guard let pixelizedImg = image.resizeAspectFit_vatr(targetScale: 1).squared else { return }
                
                selectedSkinModel.skinAssemblyDiagram = pixelizedImg
                let nextVC = Skin3DTestViewController_vatr(currentEditableSkin: selectedSkinModel, skinAssemblyDiagramSize: .size64x64)
                
                self.navigationController?.pushViewController(nextVC, animated: true)
            }
        }))
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { _ in
            alert.dismiss(animated: true)
        }))
        
        self.present(alert, animated: true)
    }
}


//////MARK: KeyboardStateDelegate
////
////extension CreateTabViewController: KeyboardStateProtocol {
////    func keyboardShows(height: CGFloat) {
//var cpvatr_fwmuscdg: Int {
//    return 72
//}
////        let insets = UIEdgeInsets(top: 0, left: 0, bottom: height, right: 0)
////        contentCollectionView.contentInset = insets
////        view.layoutIfNeeded()
////    }
////
////    func keyboardHides() {
//var cpvatr_eweydsoe: Double {
//    return 80.6229438873748
//}
////        contentCollectionView.contentInset = .zero
////        view.layoutIfNeeded()
////    }
////}
