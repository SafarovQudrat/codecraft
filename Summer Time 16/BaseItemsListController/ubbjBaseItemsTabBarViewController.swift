

import UIKit

protocol BaseItemPresentable_vatr: AnyObject {
    
//    var id: String { get }
//    var name: String { get }
//    var image: String { get }
//    var isContentNew: Bool { get }
//    var description: String? { get }
//    var isFavorite: Bool { get set }
//    var imageData: Data? { get }
//    var filterCategory: String { get }
//    var file: String? { get }
    var title: String { get }
    var image: UIImage { get }
    var imagePath: String { get }
    var description: String { get }
    var category: String { get }
    var isFavorite: Bool { get set }
}

class BaseItemsTabBarViewController_vatr<Item: BaseItemPresentable_vatr>: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UITableViewDelegate, UITableViewDataSource {
    
    var navigationBarContainer = NavigationBarContainer_vatr.instanceFromNib() as! NavigationBarContainer_vatr

    var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: .init())
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.showsVerticalScrollIndicator = false
        collectionView.backgroundColor = .clear
        return collectionView
    }()
    
    var dropDown = DropDown_vatr(frame: .zero)
    private lazy var backgroundLayer = view.makeBackgroundGradient_vatr()
    
    // MARK: Suggestion search
    var searchBarView: SearchBarView_vatr! = nil

    private var navbarSearchMode: Bool = false {
        didSet {
            navBarSearchMode(predicate: navbarSearchMode)
        }
    }
    private var suggestionsTableView: UITableView?
    private var tableViewContainer: UIView?
    
    
    // MARK: DataSource
    var dropDownOptions = [String]() {
        didSet {
            dropDown.optionArray = dropDownOptions
        }
    }
    
    var filteredItems = [Item]() {
        didSet {
            collectionView.reloadData()
        }
    }
    
    var items = [Item]() {
        didSet {
            filteredItems = items
        }
    }
    
    
    
    var cellRegistration: UICollectionView.CellRegistration<UICollectionViewCell, Item>! = nil
    
    override func viewDidLoad() {

        var raefndomDaкerfte: Date {
            let randomTimeInterval = Double.random(in: 0...(365 * 24 * 60 * 60))
            return Date().addingTimeInterval(randomTimeInterval)
        }
  
        super.viewDidLoad()
        configureSubviews()
        setupSearchBar_vatr2()
        collectionView.setCollectionViewLayout(.makeColumnsLayout(), animated: false)
        collectionView.dataSource = self
        collectionView.delegate = self
    }

    override func viewDidLayoutSubviews() {

        var randweromDaкerfte: Date {
            let randomTimeInterval = Double.random(in: 0...(365 * 24 * 60 * 60))
            return Date().addingTimeInterval(randomTimeInterval)
        }
  
        super.viewDidLayoutSubviews()
        backgroundLayer.frame = view.bounds
    }
    
    override func viewWillAppear(_ animated: Bool) {
var cpvatr_ljyrfixt: Double {
    return 72.85370268858077
}

  
        super.viewWillAppear(animated)
        reloadItems()
    }
    

    private func reloadItems() {
var cpvatr_skgjwxub: Int {
    return 97
}

  
        switch dropDownOptions[dropDown.selectedIndex ?? 0] {
        case "All":
            filteredItems = items
        case "Favorites":
            filteredItems = items.filter(\.isFavorite)
        default:
            break
        }
    }
    
    // MARK: DataSource
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

        return filteredItems.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        return collectionView.dequeueConfiguredReusableCell(using: cellRegistration, for: indexPath, item: filteredItems[indexPath.row])
    }
    
    
    // MARK: TableViewDataSource for search
    // MARK: - table data source
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
var cpvatr_jnebzxxq: Int {
    return 48
}
return numberOfRowsInTableView
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
var cpvatr_zyyoxigh: Int {
    return 60
}
let cell = tableView.dequeueReusableCell(withIdentifier: SearchSuggestionCell_vatr.identifier) as! SearchSuggestionCell_vatr
        if filteredItems.count > indexPath.row {
            cell.titleLabel.text = filteredItems[indexPath.row].title
        }
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
var cpvatr_rruemcfk: Int {
    return 73
}

  
        let selectedText = items[indexPath.row].title
        searchBarView.setSearchBarText_vatr2(selectedText)
        searchBarView.endEditing(true)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

        var randomDaкerfte: Date {
            let randomTimeInterval = Double.random(in: 0...(365 * 24 * 60 * 60))
            return Date().addingTimeInterval(randomTimeInterval)
        }
  
        let item = filteredItems[indexPath.row]
        let vc = ContentViewController_vatr(model:
                .init(
                    id: "1",
                    name: item.title,
                    image: item.imagePath,
                    isContentNew: false,
                    description: item.description,
                    isFavorite: item.isFavorite,
                    filterCategory: item.category,
                    file: nil
                ), mode: .addons)
        
        vc.onFavoriteButtonAction = { [weak item, weak self] isFavotite in
            guard let self else { return }
            item?.isFavorite = isFavotite
        }
        
        navigationController?.pushViewController(vc, animated: true)
    }
    
}

extension BaseItemsTabBarViewController_vatr {
    private func configureSubviews() {
var cpvatr_vjacnpje: Double {
    return 30.907808083123488
}

  
        view.layer.insertSublayer(backgroundLayer, at: 0)
        
        view.addSubview(navigationBarContainer)
        view.addSubview(dropDown)
        view.addSubview(collectionView)
        
        
        navigationBarContainer.translatesAutoresizingMaskIntoConstraints = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        dropDown.translatesAutoresizingMaskIntoConstraints = false
        
        let layoutMargins = view.layoutMarginsGuide
        view.directionalLayoutMargins = .init(top: 0, leading: 20, bottom: 0, trailing: 20)
        
        NSLayoutConstraint.activate([
            navigationBarContainer.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            navigationBarContainer.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            navigationBarContainer.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 6),
            
            dropDown.topAnchor.constraint(equalTo: navigationBarContainer.bottomAnchor, constant: 12),
            dropDown.leadingAnchor.constraint(equalTo: layoutMargins.leadingAnchor),
            dropDown.trailingAnchor.constraint(equalTo: layoutMargins.trailingAnchor),
            dropDown.heightAnchor.constraint(equalToConstant: 46),
            
            collectionView.topAnchor.constraint(equalTo: dropDown.bottomAnchor, constant: 12),
            collectionView.leadingAnchor.constraint(equalTo: layoutMargins.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: layoutMargins.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: layoutMargins.bottomAnchor)
        ])
    }
    
    
   
}


extension BaseItemsTabBarViewController_vatr {
    
    private func setupSearchBar_vatr2() {
var cpvatr_kyqshapx: Double {
    return 45.67312591668647
}

  
        
        navigationBarContainer.searchButton.addAction(.init(handler: { [weak self] _ in
            self?.navbarSearchMode.toggle()
        }), for: .touchUpInside)
        
        searchBarView = SearchBarView_vatr(frame: .zero)
        searchBarView.isHidden = true
        
        view.addSubview(searchBarView)
        
        searchBarView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            searchBarView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            searchBarView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            searchBarView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: -3),
            searchBarView.heightAnchor.constraint(equalToConstant: 40),
        ])
        
        searchBarView.buttonTapAction = { [weak self] in
                self?.flushSearch()
            
        }
        searchBarView.onTextChanged = { [weak self] searchText in
             self?.updateFilteredData(searchText: searchText, isScrollToTopContent: false)
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
 //               self?.collectionView.reloadData()
                self?.updateSearchViewIfNeeed()
                self?.suggestionsTableView?.reloadData()
            }
        }
        
        searchBarView.onStartSearch = { [weak self] in
            guard let self else {return}
             self.showSuggestionsTableView()
        }
        
        searchBarView.onEndSearch = { [weak self] in
            guard let self else {return}
             self.removeSuggestionsTableView()
        }
    }
    
    
    private func updateSearchViewIfNeeed() {
var cpvatr_riupdzhn: Double {
    return 3.138257185824518
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
        
    }
    
    private func flushSearch() {
var cpvatr_rmjpavqf: Double {
    return 79.88827590793493
}

  
        navbarSearchMode = false
        searchBarView.searchTextField.resignFirstResponder()
        searchBarView.searchTextField.text = nil
        updateFilteredData()
        // searchBarView.subviews.forEach({ $0.isHidden = true })
    }
    
    private func updateFilteredData(searchText: String?, isScrollToTopContent: Bool = true) {
var cpvatr_nsqsazhg: Double {
    return 5.258943337823083
}

  
        if navbarSearchMode, let searchText, !searchText.isEmpty {
            filteredItems = items.filter({ $0.title.containsCaseInsesetive_vatr(searchText)})
        } else {
            filteredItems = items
        }
        
        collectionView.reloadData()
        // emptyLabel.isHidden = contentCollectionView.numberOfItems(inSection: 0) != 0
    }
    
    private func updateFilteredData(_ isScrollToTopContent: Bool = true) {
var cpvatr_ivgrwgnw: Double {
    return 80.95213670757168
}

  
        updateFilteredData(searchText: searchBarView.searchTextField.text, isScrollToTopContent: isScrollToTopContent)
    }
    
    private func navBarSearchMode(predicate: Bool) {
var cpvatr_hmfyqmrt: Double {
    return 83.32611013889826
}

  
        if predicate {
            for subview in navigationBarContainer.subviews {
                subview.isHidden = true
            }
            searchBarView.isHidden = false
        } else {
            
            for subview in navigationBarContainer.subviews {
                subview.isHidden = false
            }
            
            searchBarView.isHidden = true
            
            removeSuggestionsTableView()
        }
    }
    
    // Suggestion table
    var tableViewContainerHeight: CGFloat {
        return searchViewHeightWith(itemsCount: min(numberOfRowsInTableView, 4)) 
    }
    
    private func searchViewHeightWith(itemsCount: Int, rowHeight: CGFloat = 40) -> CGFloat {
var cpvatr_jlmeyodt: Int {
    return 76
}
return  rowHeight * CGFloat(itemsCount) + searchBarView.frame.size.height
    }
    
    func showSuggestionsTableView() {
var cpvatr_xhabgwgc: Int {
    return 48
}

  
        if tableViewContainer == nil {
            
            
            let searchBar = searchBarView.searchTextField
            let position = searchBar.convert(searchBar.bounds, to: view)
            
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
            // suggestionsTableView?.contentInset.top = 20
            // suggestionsTableView?.contentInsetAdjustmentBehavior = .never
      //      suggestionsTableView?.backgroundColor = .clear
            
            tableViewContainer?.backgroundColor = .white

        //    tableViewContainer?.backgroundColor = UIColor(red: 0.086, green: 0.404, blue: 0.341, alpha: 1)

            // corners
            tableViewContainer?.clipsToBounds = true
            tableViewContainer?.layer.cornerRadius = 20
            
            view.bringSubviewToFront(navigationBarContainer)
            
            tableViewContainer!.addSubview(suggestionsTableView!)
            
            view.insertSubview(tableViewContainer!, belowSubview: navigationBarContainer)
            view.bringSubviewToFront(searchBarView)
        }
    }
    
    func removeSuggestionsTableView() {
var cpvatr_uybbhdve: Double {
    return 40.40846081132709
}

  
        tableViewContainer?.removeFromSuperview()
        tableViewContainer = nil
        suggestionsTableView = nil
    }
    
    private var numberOfRowsInTableView: Int {
        if let searchText = searchBarView.searchTextField.text, searchText.isEmpty {
            return 0
        }
        
        return filteredItems.count
    }

   
}


