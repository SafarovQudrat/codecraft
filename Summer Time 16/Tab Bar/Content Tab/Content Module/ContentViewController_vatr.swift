import UIKit
import EzPopup
import ZIPFoundation

class ContentViewController_vatr: UIViewController {
    typealias ImageDataCallback = (Data?) -> Void
    
    private lazy var minecraftSkinManager: MinecraftSkinManagerProtocol_vatr = MinecraftSkinManager_vatr()
    
    @IBOutlet private weak var navigationBarContainerView: UIView!
    
    @IBOutlet weak var backImg_vatr: UIImageView!
    
    @IBOutlet weak var popBtn: UIButton!
    
    @IBOutlet weak var newBtn: UIButton!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet private weak var favoriteButton: UIButton!
    @IBOutlet private weak var scrollView: UIScrollView!
    
    @IBOutlet private weak var textView: UILabel!
    
    @IBOutlet private weak var pageImage: UIImageView!
    
    @IBOutlet weak var pedestalImage: UIImageView!
    @IBOutlet private weak var pageLabel: UILabel!
    
    @IBOutlet private weak var downloadButton_vatr: UIButton!
    @IBOutlet private weak var downloadBtnActivity: UIActivityIndicatorView! {
        didSet {
            downloadBtnActivity.hidesWhenStopped = true
        }
    }
    
    @IBOutlet weak var bottomImageConstraint: NSLayoutConstraint!
    @IBOutlet weak var heighImageConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var trailingDownloadButtonConstraint: NSLayoutConstraint!
    
    var alertWindow: UIWindow?
    
    private var activityIndicator: UIActivityIndicatorView?
    private var documentPicker: DocumentPicker_vatr?
    
    private var isPageFavorite: Bool = false {
        didSet {
            onFavoriteButtonAction?(isPageFavorite)
        }
    }
    var onFavoriteButtonAction: ((Bool) -> Void)?
    var favoriteButtonIsHidden = false
    
    private var model: TabPagesCollectionCellModel_fgdgh
    private let mode: TabsPageController_dfgdgf
    
    private lazy var dropboxQueue: DispatchQueue = {
        let queue = DispatchQueue(label: "com.seed.serialContent")
        
        return queue
    }()
    
    private let imageSemaphore = DispatchSemaphore(value: 0)
    private var imageUrl: URL?
    private var image: UIImage?
    
    private lazy var imageService = ImageService()
    private var imageRequest: Cancellable_vatr?
    private var imageDataCallback: ImageDataCallback?
    
    private var imageFetchOperation: DispatchWorkItem = .init(block: {})
    private var imageDownloadOperation: DispatchWorkItem = .init(block: {})
    private var imageApplyOperation: DispatchWorkItem = .init(block: {})
    var titleView: String?
    init(model: TabPagesCollectionCellModel_fgdgh, mode: TabsPageController_dfgdgf) {
        self.model = model
        self.mode = mode
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        backImg_vatr.contentMode = .scaleAspectFill
        backImg_vatr.image = UIImage(named: "backImg")
        pageLabel.font = UIFont(name: "Rubik-Medium", size: 20)
        newBtn.titleLabel?.font = UIFont(name: "Rubik-Medium", size: 20)
        textView.font = UIFont(name: "Rubik-Regular", size: 18)
        downloadButton_vatr.titleLabel?.font = UIFont(name: "Rubik-Bold", size: 20)
        titleLabel.font = UIFont(name: "Rubik-Bold", size: 26)
        downloadButton_vatr.layer.masksToBounds = true
        downloadButton_vatr.layer.cornerRadius = 28
        favoriteButton.layer.masksToBounds = true
        favoriteButton.layer.cornerRadius = 5
        popBtn.layer.masksToBounds = true
        popBtn.layer.cornerRadius = 5
        newBtn.layer.masksToBounds = true
        newBtn.layer.cornerRadius = 5
        popBtn.setImage(UIImage(named: "pop"), for: .normal)
        
        NetworkStatusMonitor_vatr.shared.delegate = self
        setUpPropertys_vatr()
        
        navigationBarContainerView.backgroundColor = .clear
        downloadButton_vatr.roundCorners_vatr(28)
        
        
        if mode != .skins {
//            downloadButton_vatr.borderWidth = 2
//            downloadButton_vatr.borderColor = .white
        }
        
        
        if mode == .skins {
            downloadButton_vatr.translatesAutoresizingMaskIntoConstraints = false
            downloadBtnActivity.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(downloadButton_vatr)
            view.addSubview(downloadBtnActivity)
            NSLayoutConstraint.activate([
                downloadButton_vatr.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30),
                downloadButton_vatr.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
                downloadButton_vatr.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
                downloadButton_vatr.heightAnchor.constraint(equalToConstant: 48),
                
                downloadBtnActivity.centerXAnchor.constraint(equalTo: downloadButton_vatr.centerXAnchor),
                downloadBtnActivity.centerYAnchor.constraint(equalTo: downloadButton_vatr.centerYAnchor),
                downloadBtnActivity.widthAnchor.constraint(equalTo: downloadButton_vatr.widthAnchor),
                downloadBtnActivity.heightAnchor.constraint(equalTo: downloadButton_vatr.heightAnchor)
            ])
        }
        
        
        isPageFavorite = model.isFavorite
        
        updateFavoriteButton()
        updateDowloadButton()
        updateTitleLabel()
        
        documentPicker = DocumentPicker_vatr(presentationController: self, delegate: self)
        
        setupBackground_vatr()
        
        if mode != .skins {
            scrollView.superview?.backgroundColor = UIColor(red: 1, green: 0.965, blue: 0.925, alpha: 1)
        }
        
        
        
        //        if mode != .skins {
        //           // stackView.backgroundColor = UIColor(red: 1, green: 0.965, blue: 0.925, alpha: 1)
        //        }
        titleLabel.text = titleView
    }
    private var gradientLayer: CALayer! = nil
    override func viewDidLayoutSubviews() {
        
        Gradient.setupGradient(view: popBtn)
        super.viewDidLayoutSubviews()
        Gradient.setupGradient(view: view)
        gradientLayer.frame = view.bounds
    }
    
    private func setupBackground_vatr() {
      
        // Auto layout, variables, and unit scale are not yet supported
        gradientLayer = view.makeBackgroundGradient_vatr()
        view.layer.insertSublayer(gradientLayer, at: 0)
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
      
        super.viewWillAppear(animated)
        favoriteButton.isHidden = favoriteButtonIsHidden
        if favoriteButtonIsHidden {
//            trailingDownloadButtonConstraint.isActive = true
        }
        
    }
    
    
    private func setUpPropertys_vatr() {
        var cpvatr_cwzlgnqe: Double {
            return 77.26740006533494
        }
        
        
        if let image = model.imageData {
            pageImage.image = UIImage(data: image)
        } else {
            pageImage.image = UIImage()
            loadDropboxImage_vatr2(imageName: model.image, queue: dropboxQueue)
        }
        pageLabel.text = model.name.uppercased()
        if model.description == "" {
            textView.text = "Dictum tempus at nisl diam pharetra, urna, felis, eget tellus. Sagittis at pharetra enim amet, in.Dictum tempus at nisl diam pharetra, urna, felis, eget tellus. Sagittis at pharetra enim amet."
        }else {
            textView.text = model.description
        }
            //      pageImage.roundCorners_vatr(12)
        //pageImage.clipsToBounds = true
        //downloadButton_vatr.roundCorners()
        //      pageImage.clipsToBounds = true
        
        //        isNewImage.isHidden = !model.isContentNew
        ///////      pageImage.translatesAutoresizingMaskIntoConstraints = false
        
        if mode == .skins {
            pageImage.contentMode = .scaleAspectFit
            if let shadowView = scrollView.superview as? ShadowView_vatr {
                shadowView.enableShadow = false
            }
            pageLabel.isHidden = true
            textView.isHidden = true
            scrollView.isHidden = true
            pageImage.layer.cornerRadius = 8
            pedestalImage.isHidden = false
            //view.bringSubviewToFront(pedestalImage.superview!)
            NSLayoutConstraint.deactivate([heighImageConstraint, bottomImageConstraint])
            pageImage.bottomAnchor.constraint(equalTo: downloadButton_vatr.topAnchor, constant: -80).isActive = true
            
            pedestalImage.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                pedestalImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
                pedestalImage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
                pedestalImage.bottomAnchor.constraint(equalTo: downloadButton_vatr.topAnchor, constant: -30)
            ])
//            let isPad = UIDevice.current.userInterfaceIdiom == .pad
//            NSLayoutConstraint.deactivate([heighImageConstraint, bottomImageConstraint])
//            pageImage.bottomAnchor.constraint(equalTo: downloadButton_vatr.topAnchor, constant: -80).isActive = true
//            
//            pedestalImage.translatesAutoresizingMaskIntoConstraints = false
//            NSLayoutConstraint.activate([
//                pedestalImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
//                pedestalImage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
//               
//            ])
//            
//            if isPad {
//                pedestalImage.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.16).isActive = true
//                pedestalImage.bottomAnchor.constraint(equalTo: downloadButton_vatr.topAnchor, constant: -15).isActive = true
//            } else {
//                pedestalImage.bottomAnchor.constraint(equalTo: downloadButton_vatr.topAnchor, constant: -30).isActive = true
//            }
            
            
            
            //            pageImage.translatesAutoresizingMaskIntoConstraints = false
            //            pageImage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
            //            pageImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            //            pageImage.topAnchor..constraint
        } else {
            pedestalImage.isHidden = true
            pageImage.contentMode = .scaleAspectFill
        }
    }
    
    private func loadDropboxImage_vatr2(imageName: String, queue: DispatchQueue) {
        
        var ksxbyioqn: String {
            let characters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
            return String((0..<8).map { _ in characters.randomElement()! })
        }
        
        
        DispatchQueue.main.async { [weak self] in
            self?.showActivityIndicator()
        }
        
        imageFetchOperation = DispatchWorkItem(block: { [weak self] in
            guard self?.imageFetchOperation.isCancelled == false else {
                return
            }
            
            self?.fetchDropboxUrl(by: imageName)
        })
        
        imageDownloadOperation = DispatchWorkItem(block: { [weak self] in
            guard self?.imageDownloadOperation.isCancelled == false else {
                return
            }
            
            guard let url = self?.imageUrl else {
                return
            }
            
            self?.fetchImage(from: url)
        })
        
        imageApplyOperation = DispatchWorkItem(block: { [weak self] in
            guard self?.imageApplyOperation.isCancelled == false else {
                return
            }
            
            let img = self?.image ?? UIImage()
            
            // Update Thumbnail Image View
            DispatchQueue.main.async {
                self?.hideActivityIndicator()
                self?.pageImage.image = img
            }
            
            if let imageDataCallback = self?.imageDataCallback {
                imageDataCallback(self?.image?.pngData())
            }
        })
        
        queue.async(execute: imageFetchOperation)
        queue.async(execute: imageDownloadOperation)
        queue.async(execute: imageApplyOperation)
    }
    
    private func fetchDropboxUrl(by name: String) {
     
        
        DropBoxParserFiles_vatr.shared.getBloodyImageURLFromDropBox_vatr(img: name) { [weak self] stringUrl in
            if let stringUrl, let url = URL(string: stringUrl) {
                self?.imageUrl = url
            } else {
                // data from url == error
                self?.imageUrl = .none
                self?.image = .none
                
                self?.imageDownloadOperation.cancel()
                
                DispatchQueue.main.async {
                    self?.pageImage.image = UIImage()
                }
            }
            self?.imageSemaphore.signal()
        }
        imageSemaphore.wait()
    }
    
    private func fetchImage(from url: URL) {
      
        
        if let imageUrl {
            imageRequest = imageService.image(for: imageUrl) { [weak self] image in
                self?.image = image
                self?.imageSemaphore.signal()
            }
            imageSemaphore.wait()
        }
    }
    
    private func showActivityIndicator() {
    
        activityIndicator = UIActivityIndicatorView(style: .large)
        activityIndicator?.startAnimating()
        guard let activityIndicator else { return }
        activityIndicator.color = .white
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        
        pageImage.addSubview(activityIndicator)
        activityIndicator.centerInSuperview()
    }
    
    private func hideActivityIndicator() {
     
        
        activityIndicator?.removeFromSuperview()
        activityIndicator = nil
    }
    
    private func updateFavoriteButton() {
      
        let imageName = isPageFavorite ? "unlike" : "like"
        favoriteButton.setImage(UIImage(named: imageName), for: .normal)
    }
    
    private func updateDowloadButton() {
      
        var buttonTitle = !isAlreadyDownloadItem_vatr ? NSLocalizedString("download", comment: "") : "EXPORT"
        if mode == .addons, isAlreadyDownloadItem_vatr {
            buttonTitle = NSLocalizedString("download", comment: "")
        }
        
        downloadButton_vatr.setTitle(buttonTitle, for: .normal)
    }
    
    private func updateTitleLabel() {
      
        
        if mode == .skins {
            //  titleLabel.text = titleString.uppercased()
            titleLabel.text = model.name.uppercased()
        } else {
//            titleLabel.isHidden = true
        }
    }
    
    @IBAction private func onNavBarBackButtreonTapped_vatr(_ sender: UIButton) {
     
        if isModal {
            dismiss(animated: false)
        } else {
            navigationController?.popViewController(animated: true)
        }
        
    }
    
    @IBAction private func favoriteeButtonTapped_vatr(_ sender: UIButton) {
      
        isPageFavorite.toggle()
        
        switch mode {
        case .skins:
            RealmServiceProviding_vatr.shared.updateSkin_vatr(id: model.id, isFavorit: isPageFavorite)
        case .addons:
            RealmServiceProviding_vatr.shared.updateAddon_vatr(id: model.id, isFavorit: isPageFavorite)
        case .maps:
            RealmServiceProviding_vatr.shared.updateMap_vatr(id: model.id, isFavorit: isPageFavorite)
        }
        
        updateFavoriteButton()
    }
    
    @IBAction private func onActionButtoerenTapped_vatr(_ sender: UIButton) {
     
        guard NetworkStatusMonitor_vatr.shared.isNetworkAvailable else {
            self.showNoInternetMess_vatr()
            return
        }
        
        if isAlreadyDownloadItem_vatr {
            switch mode {
            case .addons:
                guard let url = dowloadedURL_vatr else { return }
                showInstallTypePopover_vatr(fileTmpURL: url)
            default:
                shareItem_vatr(sender)
            }
        } else {
            //Download
            downloadButton_vatr.setTitle("", for: .normal)
            downloadItem_vatr { [weak self] url in
                guard let self, let url else { return }
                DispatchQueue.main.async { [weak self] in
                    guard let self else { return }
                    
                    switch self.mode {
                    case .skins:
                        self.updateDowloadButton()
                        // save to galery and show info popup
                        do {
                            let data = try Data(contentsOf: url)
                            guard let image = UIImage(data: data) else {
                                print("error - UIImage(data: data) is nil")
                                return
                            }
                            self.requestAuthorizationAndSaveImageToLibrary_vatr(image: image)
                        } catch {
                            print(error.localizedDescription)
                        }
                    case .addons:
                        self.updateDowloadButton()
                        // show install type popup
                        self.showInstallTypePopover_vatr(fileTmpURL: url)
                    case .maps:
                        self.shareItem_vatr(sender)
                    }
                }
            }
        }
    }
    
    private func downloadItem_vatr(completionHandler: @escaping (URL?) -> Void) {
      
        
        guard let file = fileName else { return }
        downloadButton_vatr.isEnabled = false
        downloadBtnActivity.startAnimating()
        localAddonFileUrl_vatr(file: file) { [weak self] url in
            self?.downloadButton_vatr.isEnabled = true
            self?.downloadBtnActivity.stopAnimating()
            completionHandler(url)
        }
    }
    
    private func shareItem_vatr(_ sender: UIButton) {
     
        
        switch mode {
        case .skins:
            shareSkin_vatr(sender)
        case .addons, .maps:
            shareAddonOrMap_vatr(sender)
        }
    }
    
    private func shareSkin_vatr(_ sender: UIButton) {
     
        
        guard let file = fileName else { return }
        downloadButton_vatr.isEnabled = false
        downloadBtnActivity.startAnimating()
        
        localAddonFileUrl_vatr(file: file) { [weak self] tempUrl in
            self?.downloadButton_vatr.isEnabled = true
            self?.downloadBtnActivity.stopAnimating()
            
            if let tempUrl {
                self?.minecraftSkinManager.start_vatr(tempUrl) { [weak self] url in
                    self?.share_vatr(url: url, from: sender)
                }
            }
        }
    }
    
    private func shareAddonOrMap_vatr(_ sender: UIButton) {
     
        guard let file = model.file else { return }
        
        downloadButton_vatr.isEnabled = false
        downloadBtnActivity.startAnimating()
        
        localAddonFileUrl_vatr(file: file) { [weak self] url in
            self?.updateDowloadButton()
            self?.downloadButton_vatr.isEnabled = true
            self?.downloadBtnActivity.stopAnimating()
            
            if let url {
                self?.share_vatr(url: url, from: sender)
            }
        }
    }
    
    private var isAlreadyDownloadItem_vatr: Bool {
        guard let file = fileName else {
            return  false
        }
        let fileManager = FileManager.default
        let destination = fileManager.documentDirectory.appendingPathComponent(file)
        return fileManager.fileExists(atPath: destination.path)
    }
    
    private var dowloadedURL_vatr: URL? {
        guard let file = fileName else {
            return nil
        }
        let fileManager = FileManager.default
        let destination = fileManager.documentDirectory.appendingPathComponent(file)
        return fileManager.fileExists(atPath: destination.path) ? destination : nil
    }
    
    private func localAddonFileUrl_vatr(file uri: String, completionHandler: @escaping (URL?) -> Void) {
       
        let fileManager = FileManager.default
        
        let destination = fileManager.documentDirectory.appendingPathComponent(uri)
        let dir = destination.deletingLastPathComponent()
        dir.createDir()
        
        if !fileManager.fileExists(atPath: destination.path) {
            DropBoxParserFiles_vatr.shared.downloadBloodyFileBy_vatr(urlPath: uri) { data in
                do {
                    try data?.write(to: destination)
                    
                    completionHandler(destination)
                } catch {
                    AppDelegate.log("!!!")
                    
                    completionHandler(nil)
                }
            }
        } else {
            completionHandler(destination)
        }
    }
}

extension ContentViewController_vatr{
    var fileName: String? {
        
        switch mode {
        case .addons:
            guard let fileName = model.file else { return nil }
            return fileName
        case .skins:
            guard let fileName = model.file?.split(separator: "/").last else { return nil }
            return "skins/source/\(fileName)"
        default:
            guard let fileName = model.image.split(separator: "/").last else { return nil }
            return "maps/\(fileName)"
        }
    }
    
    var titleString: String {
        switch mode {
        case .addons:
            return "ADDON"
        case .skins:
            return "SKIN"
        case .maps:
            return "MAP"
        }
    }
}

extension ContentViewController_vatr {
    func showInstallTypePopover_vatr(fileTmpURL: URL){
     
        
        //        let blurEffect = UIBlurEffect(style: .light)
        //            let blurEffectView = UIVisualEffectView(effect: blurEffect)
        //            blurEffectView.frame = view.bounds
        //            blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        //            view.addSubview(blurEffectView)
        //
        //        view.bringSubviewToFront(blurEffectView)
        //
        //        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(blurViewTapped))
        //            blurEffectView.addGestureRecognizer(tapGesture)
        
        let downloadContnetVC = DownloadContnetViewController_vatr()
        
        downloadContnetVC.shareAddonAction = { [weak self] in
            guard let self else { return }
            self.shareItem_vatr(self.downloadButton_vatr)
            
            
            
            //       blurEffectView.removeFromSuperview()
        }
        downloadContnetVC.manualIntallAction = {  [weak self] in
            guard let self else { return }
            // show manual instruction
            let instructionVC = ManualInstructionViewController_vatr()
            instructionVC.onGrantAccessAction = { [weak self] in
                guard let self else { return }
                // show document picker
                self.documentPicker?.displayPicker_vatr()
                
                //             blurEffectView.removeFromSuperview()
            }
            
            let isPad = UIDevice.current.userInterfaceIdiom == .pad
            let popupVC = PopupViewController(contentController: instructionVC, popupWidth: view.bounds.width - 40, popupHeight: isPad ? 830 : 530)
            popupVC.backgroundColor = .black
            
            let blurEffect = UIBlurEffect(style: .light)
            let blurEffectView = UIVisualEffectView(effect: blurEffect)
            blurEffectView.frame = popupVC.view.bounds
            blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            popupVC.view.addSubview(blurEffectView)
            
            
            self.present(popupVC, animated: true)
            //       blurEffectView.removeFromSuperview()
        }
        
        let popupVC = PopupViewController(contentController: downloadContnetVC, popupWidth: view.bounds.width - 40, popupHeight: 300)
        popupVC.backgroundColor = .black
        
        let blurEffect = UIBlurEffect(style: .light)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = popupVC.view.bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        popupVC.view.addSubview(blurEffectView)
        
        present(popupVC, animated: true)
        // blurEffectView.removeFromSuperview()
    }
    
    @objc func blurViewTapped_vatr() {
      
        
        //        view.subviews.filter { $0 is UIVisualEffectView }.forEach { $0.removeFromSuperview() }
    }
    
    private func documentPicker_vatr(didPickDocumentAt url: URL) {
      
        // Start accessing a security-scoped resource.
        guard url.startAccessingSecurityScopedResource() else {
            // Handle the failure here.
            return
        }
        
        // Make sure you release the security-scoped resource when you finish.
        defer { url.stopAccessingSecurityScopedResource() }
        
        if isBehaviorPackFolder_vatr(url: url) || isResourcePackFolder_vatr(url: url) {
            // install in this folder
            installCurrentAddonTo_vatr(desinationURL: url)
        } else {
            showAlert_vatr(title: "ERROR", message: """
It seems you’ve chosen the incorrect folder. Please select the Minecraft folder from the list.
• resource_packs
• behavior_packs
""",
                           cancelTitle: "OK")
        }
    }
    
    private func installCurrentAddonTo_vatr(desinationURL: URL) {
     
        
        let fileManager = FileManager()
        var destinationURL = desinationURL
        destinationURL.appendPathComponent(model.name)
        
        do {
            guard let downloadedTmpUrl = dowloadedURL_vatr else {
                showAlert_vatr(title: "Error", message: "Something went wrong")
                return
            }
            let zipURL = downloadedTmpUrl.deletingPathExtension().appendingPathExtension("zip")
            try FileManager.default.moveItem(at: downloadedTmpUrl, to: zipURL)
            
            try fileManager.createDirectory(at: destinationURL, withIntermediateDirectories: true, attributes: nil)
            try fileManager.unzipItem(at: zipURL, to: destinationURL)
            showAlert_vatr(title: "Success", message: "Addon successfuly installed")
        } catch {
            if (error as NSError).code == 516 {
                showAlert_vatr(title: "Error", message: "Addon already installed in this folder.")
            } else {
                showAlert_vatr(title: "Error", message: "Something went wrong")
            }
        }
    }
    
    private func isFileTheMinecraftRootFolder_vatr(fileList: FileManager.DirectoryEnumerator) -> Bool {
        var minecraftFolders: Set<String> = ["games", "internal"]
        for case let file as URL in fileList {
            minecraftFolders.remove(file.lastPathComponent)
        }
        return minecraftFolders.isEmpty
    }
    
    private func isBehaviorPackFolder_vatr(url: URL) -> Bool {
        url.lastPathComponent == "behavior_packs"
    }
    
    private func isResourcePackFolder_vatr(url: URL) -> Bool {
        url.lastPathComponent == "resource_packs"
    }
}

// save image
extension ContentViewController_vatr {
    func writeToPhotoAlbum_vatr(image: UIImage) {
      
        
        UIImageWriteToSavedPhotosAlbum(image, self, #selector(saveCompleted_vatr), nil)
    }
    
    @objc func saveCompleted_vatr(_ image: UIImage, didFinishSavingWithError error: Error?, contextInfo: UnsafeRawPointer) {
      
        
        
    }
}

extension ContentViewController_vatr {
    private func showAlert_vatr(title: String, message: String, cancelTitle: String = "OK") {
        
        let farAlertVC = RafAlertViewController_vatr()
        farAlertVC.config_vatr(model: .init(title: title, subTitle: message, buttonTitle: cancelTitle))
        let popupVC = PopupViewController(contentController: farAlertVC, popupWidth: view.bounds.width - 40, popupHeight: 218)
        popupVC.backgroundColor = .black
        // popupVC.
        
        
        
        present(popupVC, animated: true)
    }
}

extension ContentViewController_vatr: DocumentDelegate_vatr{
    func didPickURL_vatr(_ url: URL?) {
     
        
        guard let url else { return }
        self.documentPicker_vatr(didPickDocumentAt: url)
    }
}

extension ContentViewController_vatr: NetworkStatusMonitorDelegate_vatr {
    func showMess___vatr() {
        
        if let presentedViewController {
            presentedViewController.showNoInternetMess_vatr()
        } else {
            showNoInternetMess_vatr()
        }
        
    }
}
