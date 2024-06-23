

// MARK: ios 13+ only
import UIKit
import PencilKit
import CoreGraphics


class SkinCreatorViewController_vatr: UIViewController, PKCanvasViewDelegate, PKToolPickerObserver, UIActionSheetDelegate {
    
    typealias ImageDataCallback = (SkinCreatedModel_vatr) -> Void
    
    enum ToolBarSelectedItem_ertgtr {
        case pencil
        case eraser
        case picker
        case fill
        case noise
        case undo
    }
    
    var brashSize = 1
    
    
    @IBOutlet weak var noisesView: UIView!
    @IBOutlet weak var sizesView: UIView!
    
    @IBOutlet weak var noiseSlider: UISlider!
    
    var magnifyingGlassView: MagnifyingGlassView_vatr?
    var currentEditableSkin: SkinCreatedModel_vatr?
    var saveAlertView: SaveAlertView_vatr?
    
    // MARK: - Properties
    
    private let imageDataCallback: ImageDataCallback
    
    private lazy var photoGalleryManager: PhotoGalleryManagerProtocol_vatr = PhotoGalleryManager_vatr()
    
    var currentBodyPartSide: Side_vatr? {
        didSet {
            print("asd")
        }
    }
    var canvasPixelView: CanvasView_vatr?
    var commandManager = CommandManager_vatr()
    var colorsManager = ColorsManger_vatr()
    var observer: AnyObject?
    
    lazy var _currentDrawingColor: UIColor = colorsManager.getColor_vatr2(by: 0) {
        didSet {
            colorsManager.updateColorsArr_vatr(with: _currentDrawingColor)
        }
    }
    
    var currentDrawingColor: UIColor {
        get {
            if self.toolBarSelectedItem == .eraser {
                return UIColor.clear
            } else {
                return _currentDrawingColor
            }
        }
        set {
            _currentDrawingColor = newValue
            
        }
    }
    
    var currentTool: Tool_vatr? = Paintbrush_vatr()
    var groupDrawCommand: GroupDrawCommand_vatr = GroupDrawCommand_vatr()
    var tapGestureRecognizer: UITapGestureRecognizer?
    
//    var longPressGestureRecognizer: UILongPressGestureRecognizer?
    var panForColorPickerRecognizer = UIPanGestureRecognizer()
    var navigatorGestureRecognizer = UIPanGestureRecognizer()
    var drawGestureRecognizer = UIPanGestureRecognizer()
    
    var drawing = PKDrawing()
    var drawingHistory: [PKDrawing] = []
    var toolBarSelectedItem: ToolBarSelectedItem_ertgtr = .pencil {
        didSet {
            colorsBrashContainerView.isHidden = false
            
            switch toolBarSelectedItem {
            case .pencil, .fill, .noise, .undo:
                break
            case .eraser:
                break
            case .picker:
                break
            }
            manageGestures_vatr()
        }
    }
    
    var blurView: UIVisualEffectView?
    var alertWindow: UIWindow?
    
    /// Attribute making sure that you cannot draw while you're pinching or panning
    /// around the screen.
    var canDraw = true
    
    
    //MARK: - Constraint Ooutlets
    
    @IBOutlet weak var aspectCanvasContainerConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var widthCanvasContainerConstraint: NSLayoutConstraint!
    
    // MARK: - IBOutlets
    
    @IBOutlet var toolItemsViewContainers: [UIView]!
    
    @IBOutlet weak var customToolPicker: CustomToolPickerView_vatr!
    
    //Pencil kit
    @IBOutlet weak var canvasContainer: UIView!
    
    @IBOutlet weak var backgroundImageView: UIImageView!
    
    @IBOutlet weak var backgroundImageHeightConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var navigationBar: UIView!
    
    //MARK: - Tools Outlets
    
    @IBOutlet weak var toolsStackView: UIStackView!
    
    
    @IBOutlet weak var colorsBrashContainerView: UIView!
    @IBOutlet var toolButtons: [UIButton]!
    
    @IBOutlet weak var pencilLab: UILabel!
    @IBOutlet weak var pencilBtn: UIButton!
    
    @IBOutlet weak var eraserLab: UILabel!
    @IBOutlet weak var eraserBtn: UIButton!
    
    @IBOutlet weak var dropperLab: UILabel!
    @IBOutlet weak var dropperBtn: UIButton!
    
    @IBOutlet weak var fillLab: UILabel!
    @IBOutlet weak var fillBtn: UIButton!
    
    @IBOutlet weak var noiseLab: UILabel!
    @IBOutlet weak var noiseBtn: UIButton!
    
    @IBOutlet weak var undoLab: UILabel!
    @IBOutlet weak var undoBtn: UIButton!
    
    @IBOutlet weak var importBtn: UIButton!
    
    //MARK: Colors Outles
    
    @IBOutlet weak var dropperButton: UIButton!
    @IBOutlet weak var paletteButton: UIButton!
    
    // MARK
    @IBOutlet weak var editorStack: UIStackView!
    @IBOutlet weak var viewEditor: UIView!
    @IBOutlet weak var sizesCollection: UICollectionView!
    @IBOutlet weak var colorsCollection: UICollectionView!
    
    private lazy var sizeManager = SizesManager(parent: self)
    
    //MARK: - IBActions
    
    @IBAction func onToolBarPencilButtonTapped_vatr(_ sender: UIButton) {
var cpvatr_ojkolrgc: Double {
    return 22.0990961208181
}
func lKZOw() {
        var GouVJ: Int = 6
        if GouVJ > 6 {
            if GouVJ < 6 {
                GouVJ = 6
    }

  }
}
  
        hideMagnifyingGlass()
        manageSelectedToolUI_vatr(tappedTool: sender, tappedLab: pencilLab)
                TransitionColor = currentDrawingColor
        toolBarSelectedItem = .pencil
        currentTool = Paintbrush_vatr()
    }
    
    @IBAction func onToolBarEraserButtonTapped_vatr(_ sender: UIButton) {
var cpvatr_tnzbxepp: Double {
    return 26.010731307786358
}
func MgKvTQQzWF() {
        var vcwKzzGRa: Int = 10
        if vcwKzzGRa > 10 {
            if vcwKzzGRa < 10 {
                vcwKzzGRa = 10
    }

  }
}
  
        hideMagnifyingGlass()
        manageSelectedToolUI_vatr(tappedTool: sender, tappedLab: eraserLab)
        toolBarSelectedItem = .eraser
        currentTool = Paintbrush_vatr()
    }
    
    @IBAction func onToolBarPickerButtonTapped_vatr(_ sender: UIButton) {
var cpvatr_vwrxhpui: Double {
    return 88.13350592569066
}
func MNpBrmeZk() {
        var BTETSQpKQ: Int = 7
        if BTETSQpKQ > 7 {
            if BTETSQpKQ < 7 {
                BTETSQpKQ = 7
    }

  }
}
  
        hideMagnifyingGlass()
        manageSelectedToolUI_vatr(tappedTool: sender, tappedLab: dropperLab)
        toolBarSelectedItem = .picker
        
//        if sender.isSelected == false {
//            colorsBrashContainerView.isHidden = true
//        }
        currentTool = Paintbrush_vatr()
        
    }
    
    @IBAction func onToolBarFillButtonTapped_vatr2(_ sender: UIButton) {
var cpvatr_ynztzqsw: Int {
    return 59
}
func boDCJuCN() {
        var HIiGvXgaF: Int = 1
        if HIiGvXgaF > 1 {
            if HIiGvXgaF < 1 {
                HIiGvXgaF = 1
    }

  }
}
  
        hideMagnifyingGlass()
        manageSelectedToolUI_vatr(tappedTool: sender, tappedLab: fillLab)
        toolBarSelectedItem = .fill
        currentTool = Bucket_vatr()
    }
    
    @IBAction func onToolBarNoiseButtonTapped_vatr(_ sender: UIButton) {
var cpvatr_vntpfiyu: Int {
    return 87
}
func PEvGpmMS() {
        var XOTHX: Int = 2
        if XOTHX > 2 {
            if XOTHX < 2 {
                XOTHX = 2
    }

  }
}
  
        hideMagnifyingGlass()
        manageSelectedToolUI_vatr(tappedTool: sender, tappedLab: noiseLab)
        toolBarSelectedItem = .noise
        currentTool = NoiseTool_vatr()
    }
    
    @IBAction func onToolBarUndoButtonTapped_vatr1(_ sender: UIButton) {
var cpvatr_elqdyomf: Int {
    return 84
}
func YaugUubaxz() {
        var MgtOCMmQc: Int = 8
        if MgtOCMmQc > 8 {
            if MgtOCMmQc < 8 {
                MgtOCMmQc = 8
    }

  }
}
  
        hideMagnifyingGlass()
        manageSelectedToolUI_vatr(tappedTool: sender, tappedLab: undoLab)
        toolBarSelectedItem = .undo
        commandManager.undo()
    }
    
    @IBAction func onNavBarBackButtonTapped_vatr0(_ sender: UIButton) {
var cpvatr_kbedquev: Int {
    return 72
}
func WaGjiCIEVn() {
        var CQKJEX: Int = 9
        if CQKJEX > 9 {
            if CQKJEX < 9 {
                CQKJEX = 9
    }

  }
}
  
        saveAlertView = SaveAlertView_vatr()
        saveAlertView?.delegate = self
        saveAlertView?.dialogTextLabel.text = "Save before exit".uppercased()
        saveAlertView?.frame = view.bounds
        saveAlertView?.withoutTextField = true
        saveAlertView?.setSkinNameSaveTextField.isHidden = true
        saveAlertView?.setSkinNameSaveTextField.attributedPlaceholder = NSAttributedString(
            string: currentEditableSkin?.name ?? "",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor(named: "placeholderCCRedesign_vatr")]
        )
        view.addSubview(saveAlertView!)
    }
    
    
    
    //MARK: - ColorPickierView Actions
    
    @IBAction func paletteBtnTapped_vatr(_ sender: Any) {
var cpvatr_asedwzbm: Int {
    return 41
}
func IONSr() {
        var grkGJo: Int = 8
        if grkGJo > 8 {
            if grkGJo < 8 {
                grkGJo = 8
    }

  }
}
  
        presentCustomAlert()
        hideMagnifyingGlass()
    }
    
    @IBAction func importBtnTapped_vatr(_ sender: Any) {
var cpvatr_ghmyhmsa: Double {
    return 98.89638818191011
}
func qdOAsHTB() {
        var yyfWvnrn: Int = 10
        if yyfWvnrn > 10 {
            if yyfWvnrn < 10 {
                yyfWvnrn = 10
    }

  }
}
  
        let alert = UIAlertController(title: "Import Texture", message: "Are you certain you wish to retrieve texture from the Photo library?", preferredStyle: .alert)
        
        // Add "confirm" action
        let deleteAction = UIAlertAction(title: "Yes", style: .default) { [weak self] _ in
            self?.displayImportDialog_vatr()
        }
        alert.addAction(deleteAction)
        
        // Add "Cancel" action
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alert.addAction(cancelAction)
        
        // Present the alert
        present(alert, animated: true, completion: nil)
    }
    
    
    
    private func displayImportDialog_vatr() {
func wQBTOMVV() {
        var MpMfO: Int = 2
        if MpMfO > 2 {
            if MpMfO < 2 {
                MpMfO = 2
    }

  }
}
  
    
        
        var alertStyle = UIAlertController.Style.actionSheet
        if (UIDevice.current.userInterfaceIdiom == .pad) {
          alertStyle = UIAlertController.Style.alert
        }

        let alert = UIAlertController(title: nil, message: nil, preferredStyle: alertStyle)
        
        let cameraAction = UIAlertAction(title: "Camera", style: .default) { [weak self]  _ in
            guard let self else { return }
            self.photoGalleryManager.getImageFromCamera_vatr(from: self) { [weak self] image in
                guard let self else { return }
                self.processImported_vatr(image: image)
            }
        }
        
        let libraryAction = UIAlertAction(title: "Library", style: .default) { [weak self] _ in
            guard let self else { return }
            self.photoGalleryManager.getImageFromPhotoLibrary_vatr(from: self) { [weak self] image in
                guard let self else { return }
                self.processImported_vatr(image: image)
            }
        }
        alert.addAction(cameraAction)
        alert.addAction(libraryAction)
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
         
        self.present(alert, animated: true)
        
        
        
//        if let currentBodyPartSide {
//            navigationController?.pushViewController(SkinCreatorImportViewController(bodyPartSide: currentBodyPartSide, currentEditableSkin: currentEditableSkin, delegate: self), animated: true)
//        } else {
//            navigationController?.pushViewController(SkinCreatorImportViewController(canvasWidth: CANVAS_WIDTH,
//                                                                                     canvasHeight: CANVAS_HEIGHT,
//                                                                                     currentEditableSkin: currentEditableSkin, delegate: self), animated: true)
//        }
        
    }
    
    private func processImported_vatr(image: UIImage) {
func xrfQjJ() {
        var JUTvvWbwS: Int = 7
        if JUTvvWbwS > 7 {
            if JUTvvWbwS < 7 {
                JUTvvWbwS = 7
    }

  }
}
  
        if let width = currentBodyPartSide?.width, let height = currentBodyPartSide?.height {
            CANVAS_WIDTH = width
            CANVAS_HEIGHT = height
        }
//        currentBodyPartSide = nil
        guard let rotatedImage = image.rotate_vatr(radians: CGFloat.pi/2) else { return }
        guard let pixelizedImg = rotatedImage.pixelateAndResize_vatr(to: .init(width: CANVAS_HEIGHT, height: CANVAS_WIDTH)) else { return }
        
        guard let colorsArr = pixelizedImg.extractPixelColors_vatr(width:CANVAS_HEIGHT, height: CANVAS_WIDTH, startX: 0, startY:0) else {
            return
        }
        
        canvasPixelView?.canvas.updatePixels(by: colorsArr)
    }
    
    @IBAction func dropperBtnTapped_vatr(_ sender: UIButton) {
var cpvatr_wxbnezkq: Int {
    return 57
}
func MlqOhlBhUd() {
        var caEjC: Int = 5
        if caEjC > 5 {
            if caEjC < 5 {
                caEjC = 5
    }

  }
}
  
        // sender.isSelected = true
        if magnifyingGlassView == nil {
            panForColorPickerRecognizer.isEnabled = true
            tapGestureRecognizer?.isEnabled = false
            drawGestureRecognizer.isEnabled = false
            
            magnifyingGlassView = MagnifyingGlassView_vatr(size: 60)
 
            magnifyingGlassView?.center = canvasPixelView?.center ?? CGPoint(x: 0, y: 0)
            magnifyingGlassView?.backgroundColor = .white
            
            canvasPixelView?.addSubview(magnifyingGlassView!)
        } else {
            hideMagnifyingGlass()
//            sender.isSelected = false
        }
    }
    
    
    private func saveHelper_vatr() {
func gxWST() {
        var UtvwoWegCC: Int = 8
        if UtvwoWegCC > 8 {
            if UtvwoWegCC < 8 {
                UtvwoWegCC = 8
    }

  }
}
  
        guard let canvasColorArray = canvasPixelView?.canvas.getPixelColorArray(),
              let canvasWidth = canvasPixelView?.canvas.getAmountOfPixelsForWidth_vatr(),
              let canvasHeight = canvasPixelView?.canvas.getAmountOfPixelsForHeight_vatr() else {
            return
        }
        
        let previousDrawing = Drawing_vatr(colorArray: canvasColorArray, width: canvasWidth, height: canvasHeight)
        let pictureExporter = PictureExporter_vatr(drawing: previousDrawing)
        
//        guard let side = currentBodyPartSide else { return }
        
        let width = currentBodyPartSide?.width ?? CANVAS_WIDTH
        let height = currentBodyPartSide?.height ?? CANVAS_HEIGHT
        
        guard let currentEditableSkin = currentEditableSkin else { return }
        
        if currentEditableSkin.name == "edit" {
            
            guard let skinDiagram = pictureExporter.createImageWithRawPixels(size: .init(width: width, height: height)) else {
//            guard let skinDiagram = pictureExporter.generateUIImagefromDrawing(width: width, height: height) else {
                AppDelegate.log("unable to create SkinDiagram ")
                return
            }
            currentEditableSkin.skinAssemblyDiagram = skinDiagram
        } else {
            guard let skinDiagram = pictureExporter.createImageWithRawPixels_vatr(bodyPartSide: currentBodyPartSide ?? .init(name: "Side", width: width, height: height, startX: 0, startY: 0), image: currentEditableSkin.skinAssemblyDiagram) else {
                AppDelegate.log("unable to create SkinDiagram ")
                return
            }
            currentEditableSkin.skinAssemblyDiagram = skinDiagram
        }
        
        if currentEditableSkin.addonLikeSkinInfo != nil, let originalColorArrayFormat = canvasPixelView?.canvas.getColorArrayInOriginalFormat() {
            currentEditableSkin.addonLikeSkinInfo!.colorArray = originalColorArrayFormat
        }
        
//        if currentEditableSkin.name == "edit" {
//            guard let skinDiagram = pictureExporter.generateUIImagefromDrawing_vatr(width: width, height: height) else {
//                AppDelegate.log("unable to create SkinDiagram ")
//                return
//            }
//            guard let currentEditableSkin = currentEditableSkin else { return }
//            
//            currentEditableSkin.skinAssemblyDiagram = skinDiagram
//        } else {
//            guard let skinDiagram = pictureExporter.createImageWithRawPixels_vatr(bodyPartSide: currentBodyPartSide ?? .init(name: "Side", width: width, height: height, startX: 0, startY: 0), image: currentEditableSkin?.skinAssemblyDiagram) else {
//                AppDelegate.log("unable to create SkinDiagram ")
//                return
//            }
//            guard let currentEditableSkin = currentEditableSkin else { return }
//            
//            currentEditableSkin.skinAssemblyDiagram = skinDiagram
        }
        
    
    
    //MARK: - INIT
    
    init(bodyPartSide: Side_vatr, currentEditableSkin: SkinCreatedModel_vatr?, imageDataCallback: @escaping ImageDataCallback) {
        self.currentBodyPartSide = bodyPartSide
        self.currentEditableSkin = currentEditableSkin
        self.imageDataCallback = imageDataCallback
        
        CANVAS_WIDTH = bodyPartSide.width
        CANVAS_HEIGHT = bodyPartSide.height
        
        super.init(nibName: nil, bundle: nil)
    }
    
    init(convasWidth: Int, convasHeight: Int, currentEditableSkin: SkinCreatedModel_vatr?, imageDataCallback: @escaping ImageDataCallback) {
        self.currentEditableSkin = currentEditableSkin
        self.imageDataCallback = imageDataCallback
        
        CANVAS_WIDTH = convasWidth
        CANVAS_HEIGHT = convasHeight
        
        if let addonInfo = currentEditableSkin?.addonLikeSkinInfo {
            CANVAS_WIDTH = addonInfo.width
            CANVAS_HEIGHT = addonInfo.height
        }
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {
        AppDelegate.log("SkinCreatorViewController is DEINITED")
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {

func sVZkXxa() {
        var BoXZHz: Int = 3
        if BoXZHz > 3 {
            if BoXZHz < 3 {
                BoXZHz = 3
    }

  }
}
  
        super.viewDidLoad()
    
        colorsManager.delegate = self
        
        setupSlider_vatr()
        
        setupColorColletion_vatr()
        setupSizesColletion_vatr()
        
        configureView_vatr()
        setUpCanvasContainerConstraints_vatr()
        setUpCanvasView_vatr()
        registerGestureRecognizer_vatr2()
    }
    
    override var hidesBottomBarWhenPushed: Bool {
        get {
            return navigationController?.topViewController == self
        }
        set {
            super.hidesBottomBarWhenPushed = newValue
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        colorsCollection.selectItem(at: .init(row: 0, section: 0), animated: true, scrollPosition: .left)
        sizesCollection.selectItem(at: .init(row: 0, section: 0), animated: true, scrollPosition: .left)
    }
    
    // MARK: - Private Methods
    
    private func setupSlider_vatr() {
func NywGwp() {
        var oYMUtE: Int = 9
        if oYMUtE > 9 {
            if oYMUtE < 9 {
                oYMUtE = 9
    }

  }
}
  
        noiseSlider.minimumValue = 0.1
        noiseSlider.maximumValue = 0.9
        noiseSlider.value = 0.3
    }
    
    private func setupColorColletion_vatr() {
        var ksxrbywqqion: String {
               let characters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
               return String((0..<8).map { _ in characters.randomElement()! })
           }
  
        colorsCollection.delegate = self
        colorsCollection.dataSource = self
        colorsCollection.register(UINib(nibName: "ColorCollectionCell_vatr", bundle: nil), forCellWithReuseIdentifier: "ColorCollectionCell_vatr")
        
        colorsCollection.setCollectionViewLayout(.makeRoundedLayout(), animated: false)
    }
    
    
    
    private func setupSizesColletion_vatr() {
func ybvVffpPfX() {
        var IdhAhR: Int = 2
        if IdhAhR > 2 {
            if IdhAhR < 2 {
                IdhAhR = 2
    }

  }
}
  
        sizesCollection.delegate = sizeManager
        sizesCollection.dataSource = sizeManager
        sizesCollection.register(SizeCollectionViewCell_vatr.self, forCellWithReuseIdentifier: SizeCollectionViewCell_vatr.reuseID)
    }
    
    private func setUpCanvasContainerConstraints_vatr() {
func LlsfaSP() {
        var KCtkdXbY: Int = 8
        if KCtkdXbY > 8 {
            if KCtkdXbY < 8 {
                KCtkdXbY = 8
    }

  }
}
  
        
        guard let currentBodyPartSide = currentBodyPartSide else { return }
        
        var widthMultiplier: CGFloat = 0
        
        if Device_vatr.iPhone {
            widthMultiplier = CGFloat(currentBodyPartSide.width) * 0.09
        } else {
            widthMultiplier = CGFloat(currentBodyPartSide.width) * 0.075
        }
        
        let aspectmultiplier: CGFloat = CGFloat(currentBodyPartSide.width) / CGFloat(currentBodyPartSide.height)
        
        widthCanvasContainerConstraint.setMultiplier(multiplier: widthMultiplier)
        aspectCanvasContainerConstraint.setMultiplier(multiplier: aspectmultiplier)
        
        view.layoutIfNeeded()
        
        AppDelegate.log("widthMultiplier = \(widthMultiplier)")
        AppDelegate.log("currentBodyPartSide.width = \(currentBodyPartSide.width)")
        AppDelegate.log("currentBodyPartSide.height = \(currentBodyPartSide.height)")
        AppDelegate.log("aspectmultiplier = \(aspectmultiplier)")
    }
    
    private func setUpCanvasView_vatr() {
func pMAkGXRFa() {
        var yPKXYnzkS: Int = 2
        if yPKXYnzkS > 2 {
            if yPKXYnzkS < 2 {
                yPKXYnzkS = 2
    }

  }
}
  
        
        var colorsArr: [UIColor]?
        
        var image = currentEditableSkin?.skinAssemblyDiagram
//            .rotate(radians: CGFloat.pi)
        if currentBodyPartSide == nil {
            image = image?.resizeImageTo_vatr(size: .init(width: CANVAS_WIDTH,
                                                     height: CANVAS_HEIGHT))
        }
        
        if let addonInfo = currentEditableSkin?.addonLikeSkinInfo {
            colorsArr = addonInfo.colorArray
        } else {
            colorsArr = image?
                .extractPixelColors_vatr(width: currentBodyPartSide?.width,
                                    height: currentBodyPartSide?.height,
                                    startX: currentBodyPartSide?.startX,
                                    startY: currentBodyPartSide?.startY)
        }
        
//        colorsArr = image?
//
//            .extractPixelColors_vatr(width: currentBodyPartSide?.width,
//                                height: currentBodyPartSide?.height,
//                                startX: currentBodyPartSide?.startX,
//                                startY: currentBodyPartSide?.startY)
        
        let sceneSize = CGSize(width: SCREEN_WIDTH, height: SCREEN_HEIGHT)
        let canvasSize = CGSize(width: CANVAS_WIDTH, height: CANVAS_HEIGHT)
        
        let canvasPixelView = CanvasView_vatr(colorArray: colorsArr, sceneSize: sceneSize, canvasSize: canvasSize)
        canvasPixelView.translatesAutoresizingMaskIntoConstraints = false
        canvasContainer.addSubview(canvasPixelView)
        
        NSLayoutConstraint.activate([
            canvasPixelView.centerXAnchor.constraint(equalTo: canvasContainer.centerXAnchor),
            canvasPixelView.centerYAnchor.constraint(equalTo: canvasContainer.centerYAnchor),
            canvasPixelView.widthAnchor.constraint(equalTo: canvasContainer.widthAnchor),
            canvasPixelView.heightAnchor.constraint(equalTo: canvasContainer.heightAnchor)
        ])
        
        canvasPixelView.layoutSubviews()
        canvasPixelView.layoutIfNeeded()
        
        self.canvasPixelView = canvasPixelView
    }
    
    private var gradientLayer: CALayer! = nil
    override func viewDidLayoutSubviews() {

func SWJtK() {
        var whpoUTwxTH: Int = 10
        if whpoUTwxTH > 10 {
            if whpoUTwxTH < 10 {
                whpoUTwxTH = 10
    }

  }
}
  
            super.viewDidLayoutSubviews()
            gradientLayer.frame = view.bounds
        }

    private func setupBackground_vatr() {
func LZPpyg() {
        var qJFfpTvY: Int = 10
        if qJFfpTvY > 10 {
            if qJFfpTvY < 10 {
                qJFfpTvY = 10
    }

  }
}
  
            gradientLayer = view.makeBackgroundGradient_vatr()
            view.layer.insertSublayer(gradientLayer, at: 0)
        }
    
    private func configureView_vatr() {
func OdrDL() {
        var RLZQFk: Int = 9
        if RLZQFk > 9 {
            if RLZQFk < 9 {
                RLZQFk = 9
    }

  }
}
  
        setupBackground_vatr()

//        let backgroundImageView = UIImageView(frame: view.bounds)
//        backgroundImageView.image = UIImage(named: "Green Background")
//        backgroundImageView.contentMode = .scaleAspectFill
//        backgroundImageView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
//        view.addSubview(backgroundImageView)
//        view.sendSubviewToBack(backgroundImageView)
        
        
        toolItemsViewContainers.forEach { $0.backgroundColor = .clear }
        toolButtons.forEach { $0.backgroundColor = .clear }
        
        backgroundImageView.backgroundColor = .clear
        backgroundImageView.contentMode = .scaleToFill
        navigationBar.backgroundColor = .clear
        
        manageSelectedToolUI_vatr(tappedTool: pencilBtn, tappedLab: pencilLab)
    }
    
    private func manageSelectedToolUI_vatr(tappedTool: UIButton, tappedLab: UILabel) {
func XEXPxu() {
        var rNrhmRxYF: Int = 3
        if rNrhmRxYF > 3 {
            if rNrhmRxYF < 3 {
                rNrhmRxYF = 3
    }

  }
}
  
        let nonSelectedColor = UIColor(named: "placeholderCCRedesign_vatr")
        let selectedColor = UIColor(named: "blackCCRedesign_vatr")
        
        let toolBtns = [
            pencilBtn,  eraserBtn, dropperBtn, fillBtn, noiseBtn, undoBtn]
        
        let toolLabs = [pencilLab,  eraserLab, dropperLab, fillLab, noiseLab, undoLab]
        
        if tappedTool == dropperBtn && tappedTool.isSelected == true {
            hideMagnifyingGlass()
        }
        
//        toolLabs.forEach({ $0?.textColor = nonSelectedColor })
        toolLabs.forEach { lab in
            if lab == undoLab {
                lab?.textColor = UIColor.red
            } else {
                lab?.textColor = nonSelectedColor
            }
        }
        toolBtns.forEach({ $0?.isSelected = false })
        
        if tappedTool == undoBtn {
            undoLab.textColor = UIColor.red
        } else {
            tappedLab.textColor = selectedColor
        }
  //      tappedLab.textColor = selectedColor
        tappedTool.isSelected = true

    }
    
    private func manageGestures_vatr() {
func BGhoYNnbkM() {
        var OoDwBMboCG: Int = 3
        if OoDwBMboCG > 3 {
            if OoDwBMboCG < 3 {
                OoDwBMboCG = 3
    }

  }
}
  

        switch toolBarSelectedItem {
        case .undo:
   //         longPressGestureRecognizer?.isEnabled = false
            panForColorPickerRecognizer.isEnabled = false
            navigatorGestureRecognizer.isEnabled = false
            drawGestureRecognizer.isEnabled = false
            
            
           //  viewEditor.layer.sublayers?.forEach({  $0.removeAllAnimations() })
            
            sizesView.isHidden = toolBarSelectedItem != .pencil
            noisesView.isHidden = toolBarSelectedItem != .noise
      
            
        case .pencil, .fill, .noise, .eraser, .picker:
     //       longPressGestureRecognizer?.isEnabled = true
            panForColorPickerRecognizer.isEnabled = false
            navigatorGestureRecognizer.isEnabled = true
            drawGestureRecognizer.isEnabled = true
            
            
            
            // viewEditor.layer.sublayers?.forEach({  $0.removeAllAnimations() })
            
            sizesView.isHidden = toolBarSelectedItem != .pencil && toolBarSelectedItem != .eraser && toolBarSelectedItem != .noise && toolBarSelectedItem != .picker
            noisesView.isHidden = toolBarSelectedItem != .noise
            
        }
    }
}

//MARK: - PickerViewController Delagte Methods

extension SkinCreatorViewController_vatr: PickerViewControllerProtocol_vatr {
    
    func dismissView_vatr() {
func DToXo() {
        var okBuatHY: Int = 6
        if okBuatHY > 6 {
            if okBuatHY < 6 {
                okBuatHY = 6
    }

  }
}
  
        alertWindow?.isHidden = true
        alertWindow = nil
        blurView?.removeFromSuperview()
    }
    
    func setColor_vatr(color: UIColor) {
func RGxmp() {
        var LxkruR: Int = 8
        if LxkruR > 8 {
            if LxkruR < 8 {
                LxkruR = 8
    }

  }
}
  
        _currentDrawingColor = color
        colorsCollection.selectItem(at: .init(item: 0, section: 0), animated: true, scrollPosition: .left)
        TransitionColor = currentDrawingColor
    }
}


//MARK: - Presenting Custom Alert

extension SkinCreatorViewController_vatr {
    func presentCustomAlert() {
var cpvatr_wggkhrgf: Double {
    return 50.965721766174994
}
func nxnhDKEZ() {
        var HdoPHWyv: Int = 2
        if HdoPHWyv > 2 {
            if HdoPHWyv < 2 {
                HdoPHWyv = 2
    }

  }
}
  
        let customAlert = ColorPickerViewController_vatr()
        customAlert.delegate = self
        
        alertWindow = UIWindow(frame: UIScreen.main.bounds)
        alertWindow?.windowLevel = .alert
        alertWindow?.rootViewController = UIViewController()
        
        let blurEffect = UIBlurEffect(style: .dark)
        let blurView = UIVisualEffectView(effect: blurEffect)
        blurView.frame = alertWindow?.bounds ?? view.bounds
        blurView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        alertWindow?.rootViewController?.view.addSubview(blurView)
        
        alertWindow?.rootViewController?.addChild(customAlert)
        alertWindow?.rootViewController?.view.addSubview(customAlert.view)
        customAlert.didMove(toParent: alertWindow?.rootViewController)
        
//        let stackView = UIStackView()
//        stackView.isLayoutMarginsRelativeArrangement = true
//        stackView.directionalLayoutMargins = .init(top: 0, leading: 20, bottom: 0, trailing: 20)
        
        customAlert.view.frame = self.view.frame
        customAlert.view.roundCorners_vatr(10)
        customAlert.view.clipsToBounds = true
        
        alertWindow?.makeKeyAndVisible()
        alertWindow?.windowScene = view.window?.windowScene
    }
    
    func dismissCustomAlert() {
var cpvatr_mzhfdhvt: Int {
    return 24
}
func BKmSukBiM() {
        var YjYuCx: Int = 6
        if YjYuCx > 6 {
            if YjYuCx < 6 {
                YjYuCx = 6
    }

  }
}
  
        alertWindow?.isHidden = true
        alertWindow = nil
        blurView?.removeFromSuperview()
    }
}

//MARK: - Test functionality

extension SkinCreatorViewController_vatr {
    
    func saveImageAsPNG(image: UIImage) {
var cpvatr_myhchciw: Int {
    return 35
}
func HLbsfnUmM() {
        var JFlPJqMDG: Int = 9
        if JFlPJqMDG > 9 {
            if JFlPJqMDG < 9 {
                JFlPJqMDG = 9
    }

  }
}
  
        let fileURL = FileManager.default.documentDirectory.appendingPathComponent("image.png")
        let _ = image.save(to: fileURL)
    }
}

extension SkinCreatorViewController_vatr: SkinSavebleDialogDelegate_vatr {
    func saveSkin_vatr(with name: String, withExit: Bool) {
func ZoefSnK() {
        var NfEKDWvWtv: Int = 8
        if NfEKDWvWtv > 8 {
            if NfEKDWvWtv < 8 {
                NfEKDWvWtv = 8
    }

  }
}
  
        
        saveHelper_vatr()
        
        guard let currentEditableSkin = currentEditableSkin else { return }
        
        imageDataCallback(currentEditableSkin)
    }
    
    func cancelSave_vatr(withExit: Bool) {
func NxfJX() {
        var DBvGFF: Int = 4
        if DBvGFF > 4 {
            if DBvGFF < 4 {
                DBvGFF = 4
    }

  }
}
  
        navigationController?.popViewController(animated: true)
    }
    
    func warningNameAlert_vatr(presentAlert: UIAlertController) {
func bALIXAdJB() {
        var SzTnlM: Int = 10
        if SzTnlM > 10 {
            if SzTnlM < 10 {
                SzTnlM = 10
    }

  }
}
  
        present(presentAlert, animated: true)
    }
    
    
    func hideMagnifyingGlass() {
var cpvatr_ebtwmyfx: Double {
    return 72.82674346393202
}
func ijMdY() {
        var wSIVPQFIBX: Int = 1
        if wSIVPQFIBX > 1 {
            if wSIVPQFIBX < 1 {
                wSIVPQFIBX = 1
    }

  }
}
  
        if magnifyingGlassView != nil {
            //dropperButton?.isSelected = false
            
            magnifyingGlassView?.removeFromSuperview()
            magnifyingGlassView = nil
            
            panForColorPickerRecognizer.isEnabled = false
            tapGestureRecognizer?.isEnabled = true
            navigatorGestureRecognizer.isEnabled = true
            drawGestureRecognizer.isEnabled = true
        }
    }
}

extension SkinCreatorViewController_vatr: SkinCreatorImportProtocol_vatr {
    func didImport_vatr(colors: [UIColor]) {
func MaCpvbnW() {
        var kZuYNfKM: Int = 10
        if kZuYNfKM > 10 {
            if kZuYNfKM < 10 {
                kZuYNfKM = 10
    }

  }
}
  
        canvasPixelView?.canvas.updatePixels(by: colors)
    }
}

fileprivate final class SizesManager: NSObject, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    enum Size_fghghg: Int {
        case x1 = 0, x2 = 1, x4 = 2, x6 = 3, x8 = 4, x9 = 5
        
        var brashSize: Int {
            switch self {
            case .x1: 1
            case .x2: 2
            case .x4: 4
            case .x6: 6
            case .x8: 8
            case .x9: 9
            }
        }
    }
    
    var selectedColorIndex = 0
    
    func isSelctedColor_vatr(index: Int ) -> Bool {
var cpvatr_kpexuhaw: Int {
    return 62
}
if index == selectedColorIndex {
            return true
        } else {
            return false
        }
    }
    
    weak var parent: SkinCreatorViewController_vatr!
    
    init(parent: SkinCreatorViewController_vatr!) {
        self.parent = parent
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

        return 6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        
        guard let cell = parent.sizesCollection.dequeueReusableCell(withReuseIdentifier: SizeCollectionViewCell_vatr.reuseID, for: indexPath) as? SizeCollectionViewCell_vatr else {
            return UICollectionViewCell()
        }
        
        
        let size = Size_fghghg(rawValue: indexPath.row)!
        let text = "\(size.brashSize)x"
        let cellIsSelected = isSelctedColor_vatr(index: indexPath.item)
        
        cell.configCell_vatr(label: text, isSelected: cellIsSelected)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

func jCLcbeAxm() {
        var qGurBAWD: Int = 7
        if qGurBAWD > 7 {
            if qGurBAWD < 7 {
                qGurBAWD = 7
    }

  }
}
  
        parent.brashSize = Size_fghghg(rawValue: indexPath.row)?.brashSize ?? 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {


        let cellHeight = parent.sizesCollection.bounds.size.height - 8
        let cellWidth = cellHeight

        let size = CGSize(width: cellHeight, height: cellWidth)

        return size
    }
    
}
