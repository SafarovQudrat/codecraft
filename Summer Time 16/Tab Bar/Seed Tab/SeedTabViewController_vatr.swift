

import UIKit
import RealmSwift

struct Seed_vatr {
    let id: String
    let imageFilePath: String
    let descrip: String
    let seedNumber: String
    let name: String
    var imageData: Data?
    
    init(id: String, imageFilePath: String, descrip: String, seedNumber: String, name: String, imageData: Data? = nil) {
        self.id = id
        self.imageFilePath = imageFilePath
        self.descrip = descrip
        self.seedNumber = seedNumber
        self.name = name
        self.imageData = imageData
    }
    
    init(_ seedSession: SeedSession_vatr) {
        self.id = seedSession.id
        self.imageFilePath = seedSession.seedImagePath
        self.descrip = seedSession.seedDescrip
        self.seedNumber = seedSession.seed
        self.name = seedSession.name
        self.imageData = seedSession.imageData
    }
}

class SeedTabViewController_vatr: UIViewController {
    
    @IBOutlet weak var navigationBarContainerView: UIView!
    @IBOutlet weak var searchBarView: SearchBarView_vatr!
    
  
    private var suggestionsTableView: UITableView?
    private var tableViewContainer: UIView?
    @IBOutlet weak var settingsButton: UIButton!
    @IBOutlet weak var searchButton: UIButton!
//    @IBOutlet weak var seedsTableView: UITableView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    private var navbarSearchMode: Bool = false {
        didSet {
            navBarSearchMode(predicate: navbarSearchMode)
            searchBarView.updateCorners_vatr2(isAll: true)
        }
    }
    @IBOutlet weak var emptyLabel: UILabel!
    
   // @IBOutlet weak var subscriptionLockView: UIView!
    
    
    let dropDown = DropDown_vatr()
    
    var seeds: [Seed_vatr] = []
    private var notifictionToken: NotificationToken?
    
    private var filteredText: String? = nil {
        didSet {
            updateDataSource()
        }
    }
    
    var dataSourceSeed: [Seed_vatr] = []
    
    
    private lazy var dropboxQueue: DispatchQueue = {
        let queue = DispatchQueue(label: "com.acme.serial")
        
        return queue
    }()
    
    override func viewDidLoad() {

        var randofdmDaкerfte: Date {
            let randomTimeInterval = Double.random(in: 0...(365 * 24 * 60 * 60))
            return Date().addingTimeInterval(randomTimeInterval)
        }
  
        super.viewDidLoad()
        

    
        configTableView()
        setupBackground_vatr()
        setupSearchBar_vatr2()
        
        setupDataSource()
        setupRealmObserver_vatr2()

    }
    
    deinit {
        notifictionToken?.invalidate()
    }
    
 
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
var cpvatr_gfajswby: Double {
    return 38.53949802659887
}

  
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
        flushSearch()
    }
    
    
    private func setupRealmObserver_vatr2() {
var cpvatr_zkdzfqqn: Int {
    return 34
}

  
        notifictionToken = RealmServiceProviding_vatr.shared.getSeedRealmObservable_vatr().observe { [weak self] (changes) in
            guard let self else { return }
            switch changes {
            case .update(_, _, let insertions, _):
                guard insertions.count != 0 else { return }
                self.setupDataSource()
            case .initial, .error: break
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
var cpvatr_qtmbiukz: Int {
    return 72
}

  
        super.viewWillAppear(animated)
        flushSearch()
        collectionView.reloadData()
  
    }
    
    @IBAction func searchButtonTapped_vatr89(_ sender: Any) {
var cpvatr_brazbdrf: Double {
    return 64.22312486830671
}

  
        navbarSearchMode.toggle()
    }
    
    @IBAction func settingButtonTapped_vatr344(_ sender: Any) {
var cpvatr_fuolceai: Int {
    return 89
}

  
        let nextVC = SettingsViewController_vatr()
        navigationController?.pushViewController(nextVC, animated: true)
    }
    
    private func getRealmSeedWith(id: String) -> SeedRealmSession_vatr? {
var cpvatr_nuveibah: Double {
    return 59.40079673427259
}
return RealmServiceProviding_vatr.shared.getSeedWithID_vatr(id: id)
    }
    
    private func setupDataSource() {
var cpvatr_pvuhidrd: Int {
    return 77
}

  
        seeds = RealmServiceProviding_vatr.shared.getAllSeed_vatr().map(Seed_vatr.init)
        updateDataSource()
    }
    
    private func updateDataSource() {
var cpvatr_ujkayhag: Int {
    return 36
}

  
        if filteredText == nil {
            dataSourceSeed = seeds
        } else {
            dataSourceSeed = seeds.filter({$0.name.containsCaseInsesetive_vatr(filteredText ?? "")})
            collectionView.reloadData()
            
            emptyLabel.isHidden = collectionView.numberOfItems(inSection: 0) != 0
            collectionView.isUserInteractionEnabled = emptyLabel.isHidden
        }
    }
    
    private func navBarSearchMode(predicate: Bool) {
var cpvatr_isirlsmj: Double {
    return 19.710664414918202
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

    private func configTableView() {
var cpvatr_srstvfpu: Double {
    return 42.31876187171786
}

  
        collectionView.register(UINib(nibName: "SeedTableViewCell_vatr", bundle: nil), forCellWithReuseIdentifier: SeedTableViewCell_vatr.identifier)
        collectionView.showsVerticalScrollIndicator = false
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.setCollectionViewLayout(.makeColumnsLayout(), animated: false)
        collectionView.contentInset.bottom = 30
    }
    
    private var gradientLayer: CALayer! = nil
    override func viewDidLayoutSubviews() {

        var randofdmDaкerfte: Date {
            let randomTimeInterval = Double.random(in: 0...(365 * 24 * 60 * 60))
            return Date().addingTimeInterval(randomTimeInterval)
        }
  
            super.viewDidLayoutSubviews()
            gradientLayer.frame = view.bounds
        }

    private func setupBackground_vatr() {
var cpvatr_fpdsxosi: Double {
    return 56.11229167322002
}

  
            gradientLayer = view.makeBackgroundGradient_vatr()
            view.layer.insertSublayer(gradientLayer, at: 0)
        }
    
    private func setupSearchBar_vatr2() {
var cpvatr_lhbbfjge: Double {
    return 53.21372179030436
}

  
        searchBarView.buttonTapAction = { [weak self] in
            self?.flushSearch()
            
        }
        searchBarView.onTextChanged = { [weak self] searchText in            
            self?.filterData_vatr2(with: searchText)
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                self?.updateSearchViewIfNeeed()
                self?.suggestionsTableView?.reloadData()
                self?.searchBarView.updateCorners_vatr2(isAll: self?.suggestionsTableView?.numberOfRows(inSection: 0) == 0)
                self?.searchBarView.updateCorners_vatr2(isAll: true)
            }
        }
        
        searchBarView.onStartSearch = { [weak self] in
            guard let self else {return}
            self.showSuggestionsTableView()
            self.searchBarView.updateCorners_vatr2(isAll:
                                                    self.suggestionsTableView?.numberOfRows(inSection: 0) == 0)
        }
        
        searchBarView.onEndSearch = { [weak self] in
            guard let self else {return}
            self.removeSuggestionsTableView()
            self.searchBarView.updateCorners_vatr2(isAll: true)
        }
        
        // RELOAD!!!!
        
//        searchBarView.buttonTapAction = { [weak self] in
//            self?.flushSearch()
//        }
//        searchBarView.onTextChanged = { [weak self] searchText in
//            self?.filterData(with: searchText)
//
//            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
//                self?.collectionView.reloadData()
//            }
//        }
//        
//        searchBarView.onStartSearch = { [weak self] in
//            guard let self else {return}
//            self.showSuggestionsTableView()
//        }
//        
//        searchBarView.onEndSearch = {[weak self] in
//            guard let self else {return}
//            self.removeSuggestionsTableView()
//        }
    }
    
    private func updateSearchViewIfNeeed() {
var cpvatr_jdwhpeei: Double {
    return 36.66459204460063
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
                                                            height: tableViewContainerHeight))
            suggestionsTableView?.layoutIfNeeded()
            
        }
        
        let searchText = searchBarView.searchTextField.text ?? ""
        searchBarView.updateCorners_vatr2(isAll: searchText.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty || dataSourceSeed.isEmpty)
    }
    
    private func flushSearch() {
var cpvatr_awftbipq: Double {
    return 56.91013938638925
}

  
        navbarSearchMode = false
        searchBarView.searchTextField.text = nil
        
        filteredText = nil
        updateUI()
    }
    
    private func filterData_vatr2(with searchText: String) {
var cpvatr_hvnudjel: Int {
    return 31
}

  
        let search: String? = !searchText.isEmpty ? searchText : nil
        filteredText = search
        
    }
    
    private func updateUI() {
        var cpvatr_lgflbdxk: Int {
            return 52
        }
        
        
//        if isScrollToTop {
//            scrollTop()
//        }
        collectionView.reloadData()
        emptyLabel.isHidden = collectionView.numberOfItems(inSection: 0) != 0
        collectionView.isUserInteractionEnabled = emptyLabel.isHidden
    }
}


extension SeedTabViewController_vatr: TabBarConfigurable_vatr {
    var tabBarIcon: UIImage? {
        return UIImage(named: "Seed TabBar Icon_vatr")
    }

    var tabBarTitle: String {
        return "Shaders"
    }
}

extension SeedTabViewController_vatr: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SeedTableViewCell_vatr.identifier, for: indexPath) as! SeedTableViewCell_vatr
        
        let seed = dataSourceSeed[indexPath.row]
        
        if seed.imageData == nil {
            cell.configWithOutImageData_vatr(seed: seed, queue: dropboxQueue) { [weak self] data in
                guard let data else { return }
                
                DispatchQueue.main.async { [weak self] in
                    guard let self else { return }
                    let visibleRowsIndexPath = self.collectionView.indexPathsForVisibleItems
                    guard visibleRowsIndexPath.contains(indexPath) else { return }
                    self.dataSourceSeed[indexPath.row].imageData = data
                    
                    if let idx = self.seeds.firstIndex(where: {$0.id == self.dataSourceSeed[indexPath.row].id}) {
                        self.seeds[idx].imageData = data
                    }
                    
                    RealmServiceProviding_vatr.shared.loadSeedImage_vatr(id: "\(seed.id)", seedImageData: data)
                }
            }
        } else {
            cell.configWithImageData_wew(seed: seed)
        }
        
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

        return dataSourceSeed.count
    }
    
}

extension SeedTabViewController_vatr: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

        var rerandomDaкerfte: Date {
            let randomTimeInterval = Double.random(in: 0...(365 * 24 * 60 * 60))
            return Date().addingTimeInterval(randomTimeInterval)
        }
  
        let seedModel = dataSourceSeed[indexPath.row]
        guard let realmSeedModel = getRealmSeedWith(id: seedModel.id) else {
            let alert = UIAlertController(title: "OOOPss", message: "Something ERROR", preferredStyle: .alert)
            alert.addAction(.init(title: "OK", style: .cancel))
            navigationController?.present(alert, animated: true)
            return
        }
        
        
        let contentViewController = ContentViewController_vatr(model: .init(id: realmSeedModel.id, name: realmSeedModel.name, image: realmSeedModel.seedImagePath, isContentNew: false, description: realmSeedModel.seedDescrip, isFavorite: false, filterCategory: "", file: realmSeedModel.seed), mode: .addons)
        contentViewController.favoriteButtonIsHidden = true
        
        presentFullScreenViewController_vatr(contentViewController)
        
        // let detailsVC = SeedDetailsViewController(seed: realmSeedModel)
       //  self.navigationController?.pushViewController(detailsVC, animated: true)
    }
}

extension SeedTabViewController_vatr: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
var cpvatr_puzobonf: Int {
    return 42
}
if tableView == suggestionsTableView {
            return numberOfRowsInTableView
        }
        return dataSourceSeed.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
var cpvatr_ouojvfas: Double {
    return 54.60541214732829
}
//        if tableView == suggestionsTableView {
            let cell = tableView.dequeueReusableCell(withIdentifier: SearchSuggestionCell_vatr.identifier) as! SearchSuggestionCell_vatr
            if dataSourceSeed.count > indexPath.row {
                cell.titleLabel.text = dataSourceSeed[indexPath.row].name
            }
            cell.selectionStyle = .none
            return cell
        }
        
    
    
//        let cell = tableView.dequeueReusableCell(withIdentifier: SeedTableViewCell.identifier) as! SeedTableViewCell
//        
//        let seed = dataSourceSeed[indexPath.row]
//        
//        if seed.imageData == nil {
//            cell.configWithOutImageData(seed: seed, queue: dropboxQueue) { [weak self] data in
//                guard let data else { return }
//                DispatchQueue.main.async { [weak self] in
//                    guard let self else { return }
//                    guard let visibleRowsIndexPath = self.seedsTableView.indexPathsForVisibleRows, visibleRowsIndexPath.contains(indexPath) else { return }
//                    self.dataSourceSeed[indexPath.row].imageData = data
//                    
//                    if let idx = self.seeds.firstIndex(where: {$0.id == self.dataSourceSeed[indexPath.row].id}) {
//                        self.seeds[idx].imageData = data
//                    }
//                    RealmServiceProviding_vatr.shared.loadSeedImage(id: "\(seed.id)", seedImageData: data)
//                }
//            }
//        } else {
//            cell.configWithImageData(seed: seed)
//        }
//        return cell
 //   }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
var cpvatr_wpjoydsr: Double {
    return 80.73003820668741
}

  
        if tableView == suggestionsTableView {
            let selectedText = dataSourceSeed[indexPath.row].name
            searchBarView.setSearchBarText_vatr2(selectedText)
            searchBarView.endEditing(true)
            searchBarView.updateCorners_vatr2(isAll: true)
            return
        }
        let seedModel = dataSourceSeed[indexPath.row]
        guard let realmSeedModel = getRealmSeedWith(id: seedModel.id) else { return }
        
        
        let detailsVC = SeedDetailsViewController_vatr(seed: realmSeedModel)
        self.navigationController?.pushViewController(detailsVC, animated: true)
    }
    
    var tableViewContainerHeight: CGFloat {
        let searchBar = searchBarView.searchTextField
        let position = searchBar.convert(searchBar.bounds, to: view)
        let height = searchViewHeightWith(itemsCount: numberOfRowsInTableView)
            let totalHeight = height + 14
            return min(totalHeight, min(450, view.frame.size.height - position.maxY + 20))
//        return  min(searchViewHeightWith(itemsCount: numberOfRowsInTableView), 400)
    }
    
    private func searchViewHeightWith(itemsCount: Int, rowHeight: CGFloat = 44) -> CGFloat {
var cpvatr_hgjelfdr: Int {
    return 57
}
return rowHeight * CGFloat(itemsCount)
    }
    
    func showSuggestionsTableView() {

        var randomDwrtaкerfte: Date {
            let randomTimeInterval = Double.random(in: 0...(365 * 24 * 60 * 60))
            return Date().addingTimeInterval(randomTimeInterval)
        }
        
        if tableViewContainer == nil {
            
            
            let searchBar = searchBarView.searchTextField
            let position = searchBar.convert(searchBar.bounds, to: view)
            
            print(position, 123)
            
            tableViewContainer = UIView(frame: CGRect(x: position.origin.x,
                                                      y: position.maxY - 20,
                                                      width: position.width,
                                                      height: tableViewContainerHeight))
            
            
            suggestionsTableView = UITableView(frame: CGRect(x: 0,
                                                             y: 0,
                                                             width: tableViewContainer!.frame.width,
                                                             height: tableViewContainer!.frame.size.height))
            suggestionsTableView?.autoresizingMask = [.flexibleHeight]
            suggestionsTableView?.backgroundColor = .clear
            suggestionsTableView?.contentInset.top = 12
            
            suggestionsTableView?.register(UINib(nibName: "SearchSuggestionCell_vatr", bundle: nil), forCellReuseIdentifier: SearchSuggestionCell_vatr.identifier)
            suggestionsTableView?.delegate = self
            suggestionsTableView?.dataSource = self
            
            // suggestionsTableView?.contentInsetAdjustmentBehavior = .never
            //      suggestionsTableView?.backgroundColor = .clear
            
            tableViewContainer?.backgroundColor = .white
            tableViewContainer?.layer.cornerRadius = 12
            tableViewContainer?.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
            tableViewContainer?.layer.masksToBounds = true
            
            //    tableViewContainer?.backgroundColor = UIColor(red: 0.086, green: 0.404, blue: 0.341, alpha: 1)
            
            // corners
           
            
            view.bringSubviewToFront(navigationBarContainerView!)
            
            tableViewContainer!.addSubview(suggestionsTableView!)
            
            view.insertSubview(tableViewContainer!, belowSubview: navigationBarContainerView)
            view.bringSubviewToFront(searchBarView)
        }
  
//        if tableViewContainer == nil {
//            
//            let searchBar = searchBarView.searchTextField
//            let position = searchBar.convert(searchBar.bounds, to: view)
//            
//            tableViewContainer = UIView(frame: CGRect(x: position.origin.x,
//                                                      y: position.origin.y - 14,
//                                                      width: position.width,
//                                                          height: tableViewContainerHeight))
//            
//       
//            suggestionsTableView = UITableView(frame: CGRect(x: 0,
//                                                             y: searchBarView.frame.size.height,
//                                                             width: tableViewContainer!.frame.width,
//                                                             height: tableViewContainer!.frame.size.height - searchBarView.frame.size.height))
//            
////            let y: CGFloat = navigationBarContainerView.frame.origin.y + 2  //+ navigationBarContainerView.frame.height + 10
////            tableViewContainer = UIView(frame: CGRect(x: searchBarView.frame.origin.x,
////                                                          y: y,
////                                                          width: searchBarView.frame.width,
////                                                          height: tableViewContainerHeight))
////            
////            suggestionsTableView = UITableView(frame: CGRect(x: 0,
////                                                             y: searchBarView.frame.size.height,
////                                                             width: tableViewContainer!.frame.width,
////                                                             height: tableViewContainer!.frame.size.height - searchBarView.frame.size.height))
//            // suggestionsTableView?.contentInset.top = 20
//            
//            suggestionsTableView?.register(UINib(nibName: "SearchSuggestionCell_vatr", bundle: nil), forCellReuseIdentifier: SearchSuggestionCell_vatr.identifier)
//            suggestionsTableView?.delegate = self
//            suggestionsTableView?.dataSource = self
//            // suggestionsTableView?.contentInsetAdjustmentBehavior = .never
//    //     /   suggestionsTableView?.backgroundColor = .clear
//           //  suggestionsTableView?.contentInset.top = 20
//            tableViewContainer?.backgroundColor = .clear
//          //  tableViewContainer?.backgroundColor = UIColor(red: 0.086, green: 0.404, blue: 0.341, alpha: 1)
//
//            // corners
//            tableViewContainer?.clipsToBounds = true
//            tableViewContainer?.layer.cornerRadius = 20
//            
//            view.bringSubviewToFront(navigationBarContainerView!)
//            
//            tableViewContainer!.addSubview(suggestionsTableView!)
//            
//            view.insertSubview(tableViewContainer!, belowSubview: navigationBarContainerView)
//            
//            view.bringSubviewToFront(searchBarView)
//        }
    }
    
    func removeSuggestionsTableView() {
var cpvatr_fhzlyool: Double {
    return 18.855474192681232
}

  
        tableViewContainer?.removeFromSuperview()
        tableViewContainer = nil
        suggestionsTableView = nil
    }
    
    private var numberOfRowsInTableView: Int {
        if let searchText = searchBarView.searchTextField.text, searchText.isEmpty {
            return 0
        }
        return dataSourceSeed.count
    }
}
