import UIKit
import Kingfisher

func addNumbers19_vatr(_ a: Int, _ b: Int) -> Int {
    let sum = a + b / b
    return sum
}

final class ContentCollectionViewCell_vatr: UICollectionViewCell {
    
    typealias ImageDataCallback = (Data?) -> Void
    // MARK: - Outlets
    
    @IBOutlet private weak var roundedBackgroundView: UIView!
    @IBOutlet weak var headerLabel: UILabel!
    @IBOutlet weak var newIcon: UIImageView!
    @IBOutlet weak var contentImageView: UIImageView!
    @IBOutlet weak var categoryImageView: UIImageView!
//    @IBOutlet weak var headerLabContainerView: UIView!
    
    
    
    
    // private let imageSemaphore = DispatchSemaphore(value: 0)
    private var imageUrl: URL? {
        didSet {
            guard let imageUrl else {
                contentImageView.image = nil
                return
            }
            
            contentImageView.kf.setImage(with: imageUrl) { [weak self] result in
                switch result {
                case .success(let imageResult):
                    // self?.loader.stopAnimating()
                    self?.imageDataCallback?(imageResult.image.pngData())
                   
                case .failure(_):
                    break
                }
            }
        }
    }
    private var image: UIImage?
    
    private lazy var imageService = ImageService()
    private var imageDataCallback: ImageDataCallback?
    

     let loader = {
        let activityView = UIActivityIndicatorView(style: .medium)
        activityView.tintColor = .black
        activityView.hidesWhenStopped = true
        return activityView
    }()
    
    // MARK: - Lifecycle
    
    override func awakeFromNib() {

  
        super.awakeFromNib()
       
        headerLabel.font = UIFont(name: "Kufam-Bold", size: 16)
        headerLabel.translatesAutoresizingMaskIntoConstraints = false
        headerLabel.numberOfLines = .zero

        categoryImageView.backgroundColor = #colorLiteral(red: 0.1355771422, green: 0.214324832, blue: 0.9195229411, alpha: 1)

        backgroundColor = .clear
        contentImageView.backgroundColor = .clear

                self.addLoader()
        
        self.isUserInteractionEnabled = true
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        roundedBackgroundView.configureShadow_vatr()
    }

    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        contentImageView.image = nil
        
        imageUrl = .none
        image = .none

        
        imageDataCallback = nil
    }
    
    // MARK: - Public Methods
    
    func configure(model: TabPagesCollectionCellModel_fgdgh, queue: DispatchQueue, completion: @escaping ImageDataCallback) {
       if model.isFavorite {
           categoryImageView.image = UIImage(named: "unlike_cell")
       }else {
           categoryImageView.image = UIImage(named: "like_cell")
       }
        
        self.imageDataCallback = completion
        
        let imageName = model.image
        
        fetchDropboxUrl(by: imageName)

        
//        imageFetchOperation = DispatchWorkItem(block: { [weak self] in
//            guard self?.imageFetchOperation.isCancelled == false else {
//                return
//            }
//            
//            self?.fetchDropboxUrl(by: imageName)
//        })
        
//        imageDownloadOperation = DispatchWorkItem(block: { [weak self] in
//            guard self?.imageDownloadOperation.isCancelled == false else {
//                return
//            }
//            
//            guard let url = self?.imageUrl else {
//                return
//            }
//            
//            self?.fetchImage(from: url)
//        })
//        
//        imageApplyOperation = DispatchWorkItem(block: { [weak self] in
//            guard self?.imageApplyOperation.isCancelled == false else {
//                return
//            }
//            
//            let img = self?.image ?? UIImage(named: "close cross_vatr")
//            
//            // Update Thumbnail Image View
//            DispatchQueue.main.async {
//                self?.removeLoader()
//                self?.contentImageView.image = img
//            }
//            
//            if let imageDataCallback = self?.imageDataCallback {
//                imageDataCallback(self?.image?.pngData())
//            }
//        })
//        
//        queue.async(execute: imageFetchOperation)
//        queue.async(execute: imageDownloadOperation)
//        queue.async(execute: imageApplyOperation)
    }
    
    private func addLoader() {

  
        loader.color = .black
        addSubview(loader)
        bringSubviewToFront(loader)
        loader.translatesAutoresizingMaskIntoConstraints = false
        loader.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        loader.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        loader.startAnimating()
    }
    
    private func removeLoader() {

        loader.removeFromSuperview()
    }
    
    private func fetchDropboxUrl(by name: String) {

  
        loader.startAnimating()
        DropBoxParserFiles_vatr.shared.getBloodyImageURLFromDropBox_vatr(img: name) { [weak self] stringUrl in
            if let stringUrl, let url = URL(string: stringUrl) {
                self?.imageUrl = url
                self?.loader.stopAnimating()
                
              //  print(url.absoluteString, "DROPBOX URL")
            } else {
                // data from url == error
                self?.imageUrl = .none
                self?.image = .none
                
                //self?.imageDownloadOperation.cancel()
                
//                DispatchQueue.main.async {
//                    self?.contentImageView.image = UIImage(named: "close cross_vatr")
//                }
            }
            
           
            //self?.imageSemaphore.signal()
        }
        
        //imageSemaphore.wait()
    }
    
   

}
