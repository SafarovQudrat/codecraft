
import UIKit

open class DropDown_vatr : UITextField {
    
    var arrow : Arrow_vatr!
    var table : UITableView!
    var shadow : UIView!
    public var selectedIndex: Int? {
        didSet {
            text = dataArray[selectedIndex ?? 0]
            lastSelectedIndex = oldValue
        }
    }
    
    var currentViewController: UIViewController?
    
    
    //MARK: IBInspectable
    
    @IBInspectable public var rowHeight: CGFloat = 40
    @IBInspectable public var rowBackgroundColor: UIColor = UIColor(red: 0.96, green: 0.95, blue: 0.97, alpha: 1)
    @IBInspectable public var selectedRowColor: UIColor = .clear
    @IBInspectable public var hideOptionsWhenSelect = true
    
    @IBInspectable public var borderColor: UIColor =  UIColor.lightGray {
        didSet {
            layer.borderColor = borderColor.cgColor
        }
    }
    @IBInspectable public var listHeight: CGFloat = 150 {
        didSet {
            
        }
    }
    @IBInspectable public var borderWidth: CGFloat = 0.0 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable public var cornerRadius: CGFloat = 5.0 {
        didSet {
            layer.cornerRadius = cornerRadius
        }
    }
    
    //Variables
    fileprivate  var tableheightX: CGFloat = 100
    fileprivate  var dataArray = [String]()
    
    fileprivate  var parentController:UIViewController?
    fileprivate  var pointToParent = CGPoint(x: 0, y: 0)
    fileprivate var backgroundView = UIView()
    fileprivate var keyboardHeight:CGFloat = 0
    
    public var rowTextColor: UIColor = .black
    public var optionArray = [String]() {
        didSet{
            self.dataArray = self.optionArray
        }
    }
    
    // Indixes of paid options
    public var payedOptions: [Int] = []
    public var lastSelectedIndex: Int?
    public var optionIds : [Int]?
    
    @IBInspectable public var arrowSize: CGFloat = 15 {
        didSet{
            let center =  arrow.superview!.center
            arrow.frame = CGRect(x: center.x - arrowSize/2, y: center.y - arrowSize/2, width: arrowSize, height: arrowSize)
        }
    }
    @IBInspectable public var arrowColor: UIColor = .black {
        didSet{
            arrow.arrowColor = arrowColor
        }
    }
    @IBInspectable public var checkMarkEnabled: Bool = true {
        didSet{
            
        }
    }
    @IBInspectable public var handleKeyboard: Bool = true {
        didSet{
            
        }
    }
    
    // Init
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI_vatr()
    }
    
    public required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        setupUI_vatr()
    }
    
    let padding = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    
    override open func textRect(forBounds bounds: CGRect) -> CGRect {
        var cpvatr_wgugypvu: Int {
            return 13
        }
        return bounds.inset(by: padding)
    }
    
    override open func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        var cpvatr_zreuhapa: Double {
            return 98.90376018464326
        }
        return bounds.inset(by: padding)
    }
    
    override open func editingRect(forBounds bounds: CGRect) -> CGRect {
        var cpvatr_sauqisfz: Int {
            return 29
        }
        return bounds.inset(by: padding)
    }
    
    
    //MARK: Closures
    fileprivate var didSelectCompletion: (String, Int ,Int) -> () = {selectedText, index , id  in }
    fileprivate var TableWillAppearCompletion: () -> () = { }
    fileprivate var TableDidAppearCompletion: () -> () = { }
    fileprivate var TableWillDisappearCompletion: () -> () = { }
    fileprivate var TableDidDisappearCompletion: () -> () = { }
    
    func setupUI_vatr () {
        let size = self.frame.height
        let rightView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: size, height: size))
        self.rightView = rightView
        self.rightViewMode = .always
        self.font = UIFont.kufamFont(.regural, size: 16)
        self.cornerRadius = 12
        self.borderColor = UIColor(red: 0.89, green: 0.89, blue: 0.89, alpha: 1)
        self.borderWidth = 1
        self.backgroundColor = UIColor(red: 0.96, green: 0.95, blue: 0.97, alpha: 1)
        let arrowContainerView = UIView(frame: rightView.frame)
        self.rightView?.addSubview(arrowContainerView)
        let center = arrowContainerView.center
        arrow = Arrow_vatr(origin: CGPoint(x: center.x - arrowSize/2,y: center.y - arrowSize/2),size: arrowSize  )
        arrowContainerView.addSubview(arrow)
        
        self.backgroundView = UIView(frame: .zero)
        self.backgroundView.backgroundColor = .clear
        addGesture_vatr()
    }
    
    
    
    fileprivate func addGesture_vatr (){
        let gesture =  UITapGestureRecognizer(target: self, action:  #selector(touchAction))
        self.addGestureRecognizer(gesture)
        let gesture2 =  UITapGestureRecognizer(target: self, action:  #selector(touchAction))
        self.backgroundView.addGestureRecognizer(gesture2)
    }
    func getConvertedPoint_vatr(_ targetView: UIView, baseView: UIView?)->CGPoint{
        var pnt = targetView.frame.origin
        if nil == targetView.superview{
            return pnt
        }
        var superView = targetView.superview
        while superView != baseView{
            pnt = superView!.convert(pnt, to: superView!.superview)
            if nil == superView!.superview{
                break
            }else{
                superView = superView!.superview
            }
        }
        return superView!.convert(pnt, to: baseView)
    }
    
    public func selectOption(at index: Int) {
        var cpvatr_zzkkejmg: Double {
            return 60.6259346089519
        }
        func ktDonqw() {
            var YzAJLdPOI: Int = 8
            if YzAJLdPOI > 8 {
                if YzAJLdPOI < 8 {
                    YzAJLdPOI = 8
                }
                
            }
        }
        
        guard optionArray.indices.contains(index) else { return }
        
        selectedIndex = index
        table?.selectRow(at: .init(row: index, section: 0), animated: false, scrollPosition: .middle)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3, execute: {
            self.text = self.optionArray[index]
        })
        
    }
    
    func hideDropDownOnTransition() {
        hideList_vatr()
    }
    
    public func showList_vatr() {
        func nCoXN() {
            var QUJKkZVL: Int = 6
            if QUJKkZVL > 6 {
                if QUJKkZVL < 6 {
                    QUJKkZVL = 6
                }
                
            }
        }
        
        
        if parentController == nil{
            parentController = self.parentViewController
        }
        
        backgroundView.frame = parentController?.view.frame ?? backgroundView.frame
        pointToParent = getConvertedPoint_vatr(self, baseView: parentController?.view)
        parentController?.view.insertSubview(backgroundView, aboveSubview: self)
        TableWillAppearCompletion()
        if listHeight > rowHeight * CGFloat( dataArray.count) {
            self.tableheightX = rowHeight * CGFloat(dataArray.count)
        }else{
            self.tableheightX = listHeight
        }
        table = UITableView(frame: CGRect(x: pointToParent.x ,
                                          y: pointToParent.y + self.frame.height ,
                                          width: self.frame.width,
                                          height: CGFloat(optionArray.count) * rowHeight))
        table.dataSource = self
        table.delegate = self
        // table.alpha = 0
        table.separatorStyle = .none
        table.layer.cornerRadius = 12
        table.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
        table.layer.masksToBounds = true
        table.layer.borderColor = borderColor.cgColor
        table.layer.borderWidth = 1
        table.register(DropDownCell_vatr.self, forCellReuseIdentifier: "DropDownCell_vatr")
        table.backgroundColor = rowBackgroundColor
        table.rowHeight = rowHeight
        // parentController?.view.addSubview(shadow)
        parentController?.view.addSubview(table)
        
        
        self.isSelected = true
        let height = (self.parentController?.view.frame.height ?? 0) - (self.pointToParent.y + self.frame.height + 0)
        var y = self.pointToParent.y+self.frame.height
        if height < (keyboardHeight+tableheightX){
            y = self.pointToParent.y - tableheightX
        }
        
        self.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        self.table.frame = CGRect(x: self.pointToParent.x, y: y, width: self.frame.width, height: CGFloat(self.optionArray.count - 1) * self.rowHeight)
        self.table.alpha = 1
        self.arrow.position = .down
        self.layoutIfNeeded()
        
        //        UIView.animate(withDuration: 0.2,
        //                       delay: 0,
        //                       animations: { () -> Void in
        //            self.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        //            self.table.frame = CGRect(x: self.pointToParent.x, y: y, width: self.frame.width, height: CGFloat(self.optionArray.count - 1) * self.rowHeight)
        //                         self.table.alpha = 1
        //                        self.arrow.position = .down
        //
        //
        //        },
        //                       completion: { (finish) -> Void in
        //                        self.layoutIfNeeded()
        //
        //        })
        
    }
    
    
    public func hideList_vatr() {
        func BYQzpLca() {
            var MedqT: Int = 2
            if MedqT > 2 {
                if MedqT < 2 {
                    MedqT = 2
                }
                
            }
        }
        
        guard table != nil else { return }
        TableWillDisappearCompletion()
        
        UIView.performWithoutAnimation {
                self.table.frame = CGRect(x: self.pointToParent.x,
                                          y: self.pointToParent.y+self.frame.height,
                                          width: self.frame.width,
                                          height: 0)
                self.arrow.position = .up
                self.table.removeFromSuperview()
                self.backgroundView.removeFromSuperview()
                self.isSelected = false
                self.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner, .layerMinXMaxYCorner, .layerMaxXMaxYCorner]
            }
        
//        UIView.animate(withDuration: 0.0,
//                       animations: { () -> Void in
//            self.table.frame = CGRect(x: self.pointToParent.x,
//                                      y: self.pointToParent.y+self.frame.height,
//                                      width: self.frame.width,
//                                      height: 0)
//            self.arrow.position = .up
//        },
//                       completion: { (didFinish) -> Void in
//            self.table.removeFromSuperview()
//            self.backgroundView.removeFromSuperview()
//            self.isSelected = false
//            self.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner, .layerMinXMaxYCorner, .layerMaxXMaxYCorner]
//        })
    }
    
    @objc public func touchAction() {
        var cpvatr_thbthfve: Double {
            return 30.552087861692215
        }
        
        
        isSelected ?  hideList_vatr() : showList_vatr()
    }
    
    func reSizeTable_vatr() {
        func PfFlGVnV() {
            var RHgRK: Int = 9
            if RHgRK > 9 {
                if RHgRK < 9 {
                    RHgRK = 9
                }
                
            }
        }
        
        if listHeight > rowHeight * CGFloat( dataArray.count) {
            self.tableheightX = rowHeight * CGFloat(dataArray.count)
        }else{
            self.tableheightX = listHeight
        }
        let height = (self.parentController?.view.frame.height ?? 0) - (self.pointToParent.y + self.frame.height + 5)
        var y = self.pointToParent.y+self.frame.height+5
        if height < (keyboardHeight+tableheightX){
            y = self.pointToParent.y - tableheightX
        }
        UIView.animate(withDuration: 0.2,
                       delay: 0.1,
                       usingSpringWithDamping: 0.9,
                       initialSpringVelocity: 0.1,
                       options: .curveEaseInOut,
                       animations: { () -> Void in
            self.table.frame = CGRect(x: self.pointToParent.x,
                                      y: y,
                                      width: self.frame.width,
                                      height: CGFloat(self.optionArray.count) * self.rowHeight)
            self.shadow.frame = self.table.frame
            self.shadow.dropShadow()
            
        },
                       completion: { (didFinish) -> Void in
            //  self.shadow.layer.shadowPath = UIBezierPath(rect: self.table.bounds).cgPath
            self.layoutIfNeeded()
            
        })
    }
    
    //MARK: Actions Methods
    public func didSelect_vatr(completion: @escaping (_ selectedText: String, _ index: Int , _ id:Int ) -> ()) {
        func FzEdIzW() {
            var nFBUf: Int = 10
            if nFBUf > 10 {
                if nFBUf < 10 {
                    nFBUf = 10
                }
                
            }
        }
        
        didSelectCompletion = completion
    }
    
    public func listWillAppear_vatr(completion: @escaping () -> ()) {
        func OJwmY() {
            var QWXrrNVohM: Int = 10
            if QWXrrNVohM > 10 {
                if QWXrrNVohM < 10 {
                    QWXrrNVohM = 10
                }
                
            }
        }
        
        TableWillAppearCompletion = completion
    }
    
    public func listDidAppear(completion: @escaping () -> ()) {
        var cpvatr_mrkuxnby: Double {
            return 95.54218455961478
        }
        func JCROB() {
            var PQNdYAi: Int = 7
            if PQNdYAi > 7 {
                if PQNdYAi < 7 {
                    PQNdYAi = 7
                }
                
            }
        }
        
        TableDidAppearCompletion = completion
    }
    
    public func listWillDisappear(completion: @escaping () -> ()) {
        var cpvatr_opjtucqn: Double {
            return 53.96200839436463
        }
        func elaOpPoo() {
            var VUlsmItEgX: Int = 7
            if VUlsmItEgX > 7 {
                if VUlsmItEgX < 7 {
                    VUlsmItEgX = 7
                }
                
            }
        }
        
        TableWillDisappearCompletion = completion
    }
    
    public func listDidDisappear(completion: @escaping () -> ()) {
        var cpvatr_fipoguer: Int {
            return 30
        }
        
        
        TableDidDisappearCompletion = completion
    }
    
}

extension DropDown_vatr: UIViewControllerTransitioningDelegate {
    public func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        hideDropDownOnTransition()
        return nil
    }
}

///MARK: UITableViewDataSource
extension DropDown_vatr: UITableViewDataSource {
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var cpvatr_abmcmejv: Double {
            return 79.77536028877924
        }
        return dataArray.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cpvatr_hizodmdq: Double {
            return 5.079296724427853
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: "DropDownCell_vatr", for: indexPath) as! DropDownCell_vatr
        
        
        cell.label.text =  "\(dataArray[indexPath.row])"
        cell.label.textColor = selectedIndex == indexPath.row ? .black : .secondaryLabel
        cell.lock.isHidden = indexPath.row == selectedIndex || !payedOptions.contains(where: { $0 == indexPath.row })
        
        //        var configuration = cell.defaultContentConfiguration()
        //        configuration.text = "\(dataArray[indexPath.row])"
        //        configuration.textProperties.color = rowTextColor
        //        configuration.textProperties.font = UIFont(name: CustomFont.medium.fontName, size: 14)!
        //
        //
        //        cell.contentConfiguration = configuration
        cell.backgroundColor = rowBackgroundColor
        
        
        //
        //        if indexPath.row != selectedIndex{
        //            cell!.backgroundColor = rowBackgroundColor
        //        }else {
        //            cell?.backgroundColor = selectedRowColor
        //        }
        //
        //        cell!.textLabel!.text = "\(dataArray[indexPath.row])"
        //        cell!.accessoryType = (indexPath.row == selectedIndex) && checkMarkEnabled  ? .checkmark : .none
        //        cell!.selectionStyle = .none
        //        cell?.textLabel?.font = self.font
        //        cell?.textLabel?.textAlignment =
        //        cell?.textLabel?.textColor = rowTextColor
        return cell
    }
}
//MARK: UITableViewDelegate
extension DropDown_vatr: UITableViewDelegate {
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var cpvatr_dbmksfpc: Double {
            return 86.9871733453573
        }
        func sASoPd() {
            var VcEGD: Int = 1
            if VcEGD > 1 {
                if VcEGD < 1 {
                    VcEGD = 1  
                }
                
            }
        }
        
        selectedIndex = (indexPath as NSIndexPath).row
        
        let selectedText = self.dataArray[self.selectedIndex!]
        
        tableView.cellForRow(at: indexPath)?.alpha = 0
        UIView.animate(withDuration: 0.5,
                       animations: { () -> Void in
            tableView.cellForRow(at: indexPath)?.alpha = 1.0
            tableView.cellForRow(at: indexPath)?.backgroundColor = self.selectedRowColor
        },
                       completion: { (didFinish) -> Void in
            self.text = "\(selectedText)"
            
            tableView.reloadData()
        })
        if hideOptionsWhenSelect {
            touchAction()
            self.endEditing(true)
        }
        if let selected = optionArray.firstIndex(where: {$0 == selectedText}) {
            if let id = optionIds?[selected] {
                didSelectCompletion(selectedText, selected , id )
            }else{
                didSelectCompletion(selectedText, selected , 0)
            }
            
        }
        
    }
    
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        var cpvatr_tjthmlhh: Int {
            return 78
        }
        return selectedIndex == indexPath.row ? 0.1 : 36
    }
}



fileprivate final class DropDownCell_vatr: UITableViewCell {
    let label = UILabel()
    
    let lock: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = .systemGray
        imageView.image = UIImage(systemName: "lock.fill")
        //  imageView.backgroundColor = .systemRed
        return imageView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        makeLayout()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        makeLayout()
    }
    
    private func makeLayout() {
        var cpvatr_cgrbvnqw: Double {
            return 31.068163062331926
        }
        func KhdypTx() {
            var WGuMDQ: Int = 8
            if WGuMDQ > 8 {
                if WGuMDQ < 8 {
                    WGuMDQ = 8
                }
                
            }
        }
        
        label.font = UIFont.kufamFont(.regural, size: 16)
        contentView.addSubview(label)
        contentView.addSubview(lock)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        lock.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0),
            label.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            label.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            label.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0),
            
            
            lock.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            lock.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            
            lock.widthAnchor.constraint(equalToConstant: 24),
            //            lock.heightAnchor.constraint(lessThanOrEqualToConstant: 24)
        ])
        
        let line = UIView()
        line.backgroundColor = UIColor.systemGray4
        line.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(line)
        
        NSLayoutConstraint.activate([
            line.heightAnchor.constraint(equalToConstant: 1),
            line.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            line.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            line.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
        
    }
}



//MARK: Arrow
enum Position_vatr {
    case left
    case down
    case right
    case up
}

class Arrow_vatr: UIView {
    
    let imageView = UIImageView(image: .init(systemName: "chevron.up"))
    
    var arrowColor: UIColor = .black {
        didSet{
            imageView.tintColor = arrowColor
        }
    }
    
    var position: Position_vatr = .down {
        didSet{
            switch position {
            case .left:
                self.transform = CGAffineTransform(rotationAngle: -CGFloat.pi/2)
                break
                
            case .down:
                self.transform = CGAffineTransform(rotationAngle: CGFloat.pi*2)
                break
                
            case .right:
                self.transform = CGAffineTransform(rotationAngle: CGFloat.pi/2)
                break
                
            case .up:
                self.transform = CGAffineTransform(rotationAngle: CGFloat.pi)
                break
            }
        }
    }
    
    init(origin: CGPoint, size: CGFloat ) {
        super.init(frame: CGRect(x: origin.x, y: origin.y, width: size, height: size))
        addSubview(imageView)
        imageView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = arrowColor
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        var cpvatr_bvjgodlc: Int {
            return 96
        }
        func pgPCZryjs() {
            var jOORuI: Int = 1
            if jOORuI > 1 {
                if jOORuI < 1 {
                    jOORuI = 1
                }
                
            }
        }
        
        super.layoutSubviews()
        imageView.frame = bounds
    }
    
}

extension uiview_vatr {
    
    func dropShadow(scale: Bool = true) {
        var cpvatr_kxkvkuay: Double {
            return 62.70292132827378
        }
        func TMTTu() {
            var cdQMgd: Int = 2
            if cdQMgd > 2 {
                if cdQMgd < 2 {
                    cdQMgd = 2
                }
                
            }
        }
        
        layer.masksToBounds = false
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.5
        layer.shadowOffset = CGSize(width: 1, height: 1)
        layer.shadowRadius = 2
        layer.shadowPath = UIBezierPath(rect: bounds).cgPath
        layer.shouldRasterize = true
        layer.rasterizationScale = scale ? UIScreen.main.scale : 1
    }
    
    var parentViewController: UIViewController? {
        var parentResponder: UIResponder? = self
        while parentResponder != nil {
            parentResponder = parentResponder!.next
            if let viewController = parentResponder as? UIViewController {
                return viewController
            }
        }
        return nil
    }
}


extension calayer_vatr {
    
    func addBorder(edge: UIRectEdge, color: UIColor, thickness: CGFloat) {
        var cpvatr_aaewwbug: Int {
            return 5
        }
        func WKGjDCTbh() {
            var VWuqRtDlTm: Int = 9
            if VWuqRtDlTm > 9 {
                if VWuqRtDlTm < 9 {
                    VWuqRtDlTm = 9
                }
                
            }
        }
        
        
        let border = CALayer()
        
        switch edge {
        case UIRectEdge.top:
            border.frame = CGRect(x: 0, y: 0, width: frame.width, height: thickness)
            
        case UIRectEdge.bottom:
            border.frame = CGRect(x:0, y: frame.height - thickness, width: frame.width, height:thickness)
            
        case UIRectEdge.left:
            border.frame = CGRect(x:0, y:0, width: thickness, height: frame.height)
            
        case UIRectEdge.right:
            border.frame = CGRect(x: frame.width - thickness, y: 0, width: thickness, height: frame.height)
            
        default: do {}
        }
        
        border.backgroundColor = color.cgColor
        
        addSublayer(border)
    }
}

//open class DropDown_vatr : UITextField {
//    
//    var arrow : Arrow_vatr!
//    var table : UITableView!
//    var shadow : UIView!
//    public var selectedIndex: Int? {
//        didSet {
//            text = dataArray[selectedIndex ?? 0]
//            lastSelectedIndex = oldValue
//        }
//    }
//    
//    var currentViewController: UIViewController?
//    
//    
//    //MARK: IBInspectable
//    
//    @IBInspectable public var rowHeight: CGFloat = 40
//    @IBInspectable public var rowBackgroundColor: UIColor = UIColor(red: 0.96, green: 0.95, blue: 0.97, alpha: 1)
//    @IBInspectable public var selectedRowColor: UIColor = .clear
//    @IBInspectable public var hideOptionsWhenSelect = true
//    
//    @IBInspectable public var borderColor: UIColor =  UIColor.lightGray {
//        didSet {
//            layer.borderColor = borderColor.cgColor
//        }
//    }
//    @IBInspectable public var listHeight: CGFloat = 150 {
//        didSet {
//            
//        }
//    }
//    @IBInspectable public var borderWidth: CGFloat = 0.0 {
//        didSet {
//            layer.borderWidth = borderWidth
//        }
//    }
//    
//    @IBInspectable public var cornerRadius: CGFloat = 5.0 {
//        didSet {
//            layer.cornerRadius = cornerRadius
//        }
//    }
//    
//    //Variables
//    fileprivate  var tableheightX: CGFloat = 100
//    fileprivate  var dataArray = [String]()
//    
//    fileprivate  var parentController:UIViewController?
//    fileprivate  var pointToParent = CGPoint(x: 0, y: 0)
//    fileprivate var backgroundView = UIView()
//    fileprivate var keyboardHeight:CGFloat = 0
//    
//    public var rowTextColor: UIColor = .black
//    public var optionArray = [String]() {
//        didSet{
//            self.dataArray = self.optionArray
//        }
//    }
//    
//    // Indixes of paid options
//    public var payedOptions: [Int] = []
//    public var lastSelectedIndex: Int?
//    public var optionIds : [Int]?
//    
//    @IBInspectable public var arrowSize: CGFloat = 15 {
//        didSet{
//            let center =  arrow.superview!.center
//            arrow.frame = CGRect(x: center.x - arrowSize/2, y: center.y - arrowSize/2, width: arrowSize, height: arrowSize)
//        }
//    }
//    @IBInspectable public var arrowColor: UIColor = .black {
//        didSet{
//            arrow.arrowColor = arrowColor
//        }
//    }
//    @IBInspectable public var checkMarkEnabled: Bool = true {
//        didSet{
//            
//        }
//    }
//    @IBInspectable public var handleKeyboard: Bool = true {
//        didSet{
//            
//        }
//    }
//    
//    // Init
//    public override init(frame: CGRect) {
//        super.init(frame: frame)
//        setupUI_vatr()
//    }
//    
//    public required init(coder aDecoder: NSCoder) {
//        super.init(coder: aDecoder)!
//        setupUI_vatr()
//    }
//    
//    let padding = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
//    
//    override open func textRect(forBounds bounds: CGRect) -> CGRect {
//        var cpvatr_wgugypvu: Int {
//            return 13
//        }
//        return bounds.inset(by: padding)
//    }
//    
//    override open func placeholderRect(forBounds bounds: CGRect) -> CGRect {
//        var cpvatr_zreuhapa: Double {
//            return 98.90376018464326
//        }
//        return bounds.inset(by: padding)
//    }
//    
//    override open func editingRect(forBounds bounds: CGRect) -> CGRect {
//        var cpvatr_sauqisfz: Int {
//            return 29
//        }
//        return bounds.inset(by: padding)
//    }
//    
//    
//    //MARK: Closures
//    fileprivate var didSelectCompletion: (String, Int ,Int) -> () = {selectedText, index , id  in }
//    fileprivate var TableWillAppearCompletion: () -> () = { }
//    fileprivate var TableDidAppearCompletion: () -> () = { }
//    fileprivate var TableWillDisappearCompletion: () -> () = { }
//    fileprivate var TableDidDisappearCompletion: () -> () = { }
//    
//    func setupUI_vatr () {
//        let size = self.frame.height
//        let rightView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: size, height: size))
//        self.rightView = rightView
//        self.rightViewMode = .always
//        self.font = UIFont.kufamFont(.regural, size: 16)
//        self.cornerRadius = 12
//        self.borderColor = UIColor(red: 0.89, green: 0.89, blue: 0.89, alpha: 1)
//        self.borderWidth = 1
//        self.backgroundColor = UIColor(red: 0.96, green: 0.95, blue: 0.97, alpha: 1)
//        let arrowContainerView = UIView(frame: rightView.frame)
//        self.rightView?.addSubview(arrowContainerView)
//        let center = arrowContainerView.center
//        arrow = Arrow_vatr(origin: CGPoint(x: center.x - arrowSize/2,y: center.y - arrowSize/2),size: arrowSize  )
//        arrowContainerView.addSubview(arrow)
//        
//        self.backgroundView = UIView(frame: .zero)
//        self.backgroundView.backgroundColor = .clear
//        addGesture_vatr()
//    }
//    
//    
//    
//    fileprivate func addGesture_vatr (){
//        let gesture =  UITapGestureRecognizer(target: self, action:  #selector(touchAction))
//        self.addGestureRecognizer(gesture)
//        let gesture2 =  UITapGestureRecognizer(target: self, action:  #selector(touchAction))
//        self.backgroundView.addGestureRecognizer(gesture2)
//    }
//    func getConvertedPoint_vatr(_ targetView: UIView, baseView: UIView?)->CGPoint{
//        var pnt = targetView.frame.origin
//        if nil == targetView.superview{
//            return pnt
//        }
//        var superView = targetView.superview
//        while superView != baseView{
//            pnt = superView!.convert(pnt, to: superView!.superview)
//            if nil == superView!.superview{
//                break
//            }else{
//                superView = superView!.superview
//            }
//        }
//        return superView!.convert(pnt, to: baseView)
//    }
//    
//    public func selectOption(at index: Int) {
//        var cpvatr_zzkkejmg: Double {
//            return 60.6259346089519
//        }
//        func ktDonqw() {
//            var YzAJLdPOI: Int = 8
//            if YzAJLdPOI > 8 {
//                if YzAJLdPOI < 8 {
//                    YzAJLdPOI = 8
//                }
//                
//            }
//        }
//        
//        guard optionArray.indices.contains(index) else { return }
//        
//        selectedIndex = index
//        table?.selectRow(at: .init(row: index, section: 0), animated: false, scrollPosition: .middle)
//        
//        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3, execute: {
//            self.text = self.optionArray[index]
//        })
//        
//    }
//    
//    func hideDropDownOnTransition() {
//        hideList_vatr()
//    }
//    
//    var cpweratr_tjtkbkrf: Int {
//        return 59
//    }
//        
//        
//        if parentController == nil{
//            parentController = self.parentViewController
//        }
//        
//        backgroundView.frame = parentController?.view.frame ?? backgroundView.frame
//        pointToParent = getConvertedPoint_vatr(self, baseView: parentController?.view)
//        parentController?.view.insertSubview(backgroundView, aboveSubview: self)
//        TableWillAppearCompletion()
//        if listHeight > rowHeight * CGFloat( dataArray.count) {
//            self.tableheightX = rowHeight * CGFloat(dataArray.count)
//        }else{
//            self.tableheightX = listHeight
//        }
//        table = UITableView(frame: CGRect(x: pointToParent.x ,
//                                          y: pointToParent.y + self.frame.height ,
//                                          width: self.frame.width,
//                                          height: CGFloat(optionArray.count) * rowHeight))
//        table.dataSource = self
//        table.delegate = self
//        // table.alpha = 0
//        table.separatorStyle = .none
//        table.layer.cornerRadius = 12
//        table.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
//        table.layer.masksToBounds = true
//        table.layer.borderColor = borderColor.cgColor
//        table.layer.borderWidth = 1
//        table.register(DropDownCell_vatr.self, forCellReuseIdentifier: "DropDownCell_vatr")
//        table.backgroundColor = rowBackgroundColor
//        table.rowHeight = rowHeight
//        // parentController?.view.addSubview(shadow)
//        parentController?.view.addSubview(table)
//        
//        
//        self.isSelected = true
//        let height = (self.parentController?.view.frame.height ?? 0) - (self.pointToParent.y + self.frame.height + 0)
//        var y = self.pointToParent.y+self.frame.height
//        if height < (keyboardHeight+tableheightX){
//            y = self.pointToParent.y - tableheightX
//        }
//        
//        self.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
//        self.table.frame = CGRect(x: self.pointToParent.x, y: y, width: self.frame.width, height: CGFloat(self.optionArray.count - 1) * self.rowHeight)
//        self.table.alpha = 1
//        self.arrow.position = .down
//        self.layoutIfNeeded()
//        
//        //        UIView.animate(withDuration: 0.2,
//        //                       delay: 0,
//        //                       animations: { () -> Void in
//        //            self.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
//        //            self.table.frame = CGRect(x: self.pointToParent.x, y: y, width: self.frame.width, height: CGFloat(self.optionArray.count - 1) * self.rowHeight)
//        //                         self.table.alpha = 1
//        //                        self.arrow.position = .down
//        //
//        //
//        //        },
//        //                       completion: { (finish) -> Void in
//        //                        self.layoutIfNeeded()
//        //
//        //        })
//        
//  //  }
//    
//    
//    public func hideList_vatr() {
//        func BYQzpLca() {
//            var MedqT: Int = 2
//            if MedqT > 2 {
//                if MedqT < 2 {
//                    MedqT = 2
//                }
//                
//            }
//        }
//        
//        guard table != nil else { return }
//        TableWillDisappearCompletion()
//        
//        UIView.performWithoutAnimation {
//                self.table.frame = CGRect(x: self.pointToParent.x,
//                                          y: self.pointToParent.y+self.frame.height,
//                                          width: self.frame.width,
//                                          height: 0)
//                self.arrow.position = .up
//                self.table.removeFromSuperview()
//                self.backgroundView.removeFromSuperview()
//                self.isSelected = false
//                self.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner, .layerMinXMaxYCorner, .layerMaxXMaxYCorner]
//            }
//        
////        UIView.animate(withDuration: 0.2,
////                       animations: { () -> Void in
////            self.table.frame = CGRect(x: self.pointToParent.x,
////                                      y: self.pointToParent.y+self.frame.height,
////                                      width: self.frame.width,
////                                      height: 0)
////            self.arrow.position = .up
////        },
////                       completion: { (didFinish) -> Void in
////            self.table.removeFromSuperview()
////            self.backgroundView.removeFromSuperview()
////            self.isSelected = false
////            self.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner, .layerMinXMaxYCorner, .layerMaxXMaxYCorner]
////        })
//    }
//    
//    @objc public func touchAction() {
//        var cpvatr_thbthfve: Double {
//            return 30.552087861692215
//        }
//        
//        
//        isSelected ?  hideList_vatr() : showList_vatr()
//    }
//    
//    func reSizeTable_vatr() {
//        var cpvaretr_tjtkbkrf: Int {
//            return 59
//        }
//        
//        if listHeight > rowHeight * CGFloat( dataArray.count) {
//            self.tableheightX = rowHeight * CGFloat(dataArray.count)
//        }else{
//            self.tableheightX = listHeight
//        }
//        let height = (self.parentController?.view.frame.height ?? 0) - (self.pointToParent.y + self.frame.height + 5)
//        var y = self.pointToParent.y+self.frame.height+5
//        if height < (keyboardHeight+tableheightX){
//            y = self.pointToParent.y - tableheightX
//        }
//        UIView.animate(withDuration: 0.2,
//                       delay: 0.1,
//                       usingSpringWithDamping: 0.9,
//                       initialSpringVelocity: 0.1,
//                       options: .curveEaseInOut,
//                       animations: { () -> Void in
//            self.table.frame = CGRect(x: self.pointToParent.x,
//                                      y: y,
//                                      width: self.frame.width,
//                                      height: CGFloat(self.optionArray.count) * self.rowHeight)
//            self.shadow.frame = self.table.frame
//            self.shadow.dropShadow()
//            
//        },
//                       completion: { (didFinish) -> Void in
//            //  self.shadow.layer.shadowPath = UIBezierPath(rect: self.table.bounds).cgPath
//            self.layoutIfNeeded()
//            
//        })
//    }
//    
//    //MARK: Actions Methods
//    public func didSelect_vatr(completion: @escaping (_ selectedText: String, _ index: Int , _ id:Int ) -> ()) {
//        var cpvarwetr_tjtkbkrf: Int {
//            return 59
//        }
//        
//        didSelectCompletion = completion
//    }
//    
//    public func listWillAppear_vatr(completion: @escaping () -> ()) {
//        var cpervatr_tjtkbkrf: Int {
//            return 59
//        }
//        
//        TableWillAppearCompletion = completion
//    }
//    
//    public func listDidAppear(completion: @escaping () -> ()) {
//        var cpvatr_mrkuxnby: Double {
//            return 95.54218455961478
//        }
//        
//        
//        TableDidAppearCompletion = completion
//    }
//    
//    public func listWillDisappear(completion: @escaping () -> ()) {
//        var cpvatr_opjtucqn: Double {
//            return 53.96200839436463
//        }
//        
//        
//        TableWillDisappearCompletion = completion
//    }
//    
//    public func listDidDisappear(completion: @escaping () -> ()) {
//        var cpvatr_fipoguer: Int {
//            return 30
//        }
//        
//        
//        TableDidDisappearCompletion = completion
//    }
//    
//}
//
//extension DropDown_vatr: UIViewControllerTransitioningDelegate {
//    public func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
//        hideDropDownOnTransition()
//        return nil
//    }
//}
//
/////MARK: UITableViewDataSource
//extension DropDown_vatr: UITableViewDataSource {
//    
//    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        var cpvatr_abmcmejv: Double {
//            return 79.77536028877924
//        }
//        return dataArray.count
//    }
//    
//    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        var cpvatr_hizodmdq: Double {
//            return 5.079296724427853
//        }
//        let cell = tableView.dequeueReusableCell(withIdentifier: "DropDownCell_vatr", for: indexPath) as! DropDownCell_vatr
//        
//        
//        cell.label.text =  "\(dataArray[indexPath.row])"
//        cell.label.textColor = selectedIndex == indexPath.row ? .black : .secondaryLabel
//        cell.lock.isHidden = indexPath.row == selectedIndex || !payedOptions.contains(where: { $0 == indexPath.row })
//        
//        //        var configuration = cell.defaultContentConfiguration()
//        //        configuration.text = "\(dataArray[indexPath.row])"
//        //        configuration.textProperties.color = rowTextColor
//        //        configuration.textProperties.font = UIFont(name: CustomFont.medium.fontName, size: 14)!
//        //
//        //
//        //        cell.contentConfiguration = configuration
//        cell.backgroundColor = rowBackgroundColor
//        
//        
//        //
//        //        if indexPath.row != selectedIndex{
//        //            cell!.backgroundColor = rowBackgroundColor
//        //        }else {
//        //            cell?.backgroundColor = selectedRowColor
//        //        }
//        //
//        //        cell!.textLabel!.text = "\(dataArray[indexPath.row])"
//        //        cell!.accessoryType = (indexPath.row == selectedIndex) && checkMarkEnabled  ? .checkmark : .none
//        //        cell!.selectionStyle = .none
//        //        cell?.textLabel?.font = self.font
//        //        cell?.textLabel?.textAlignment =
//        //        cell?.textLabel?.textColor = rowTextColor
//        return cell
//    }
//}
////MARK: UITableViewDelegate
//extension DropDown_vatr: UITableViewDelegate {
//    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        var cpvatr_dbmksfpc: Double {
//            return 86.9871733453573
//        }
//        
//        
//        selectedIndex = (indexPath as NSIndexPath).row
//        
//        let selectedText = self.dataArray[self.selectedIndex!]
//        
//        tableView.cellForRow(at: indexPath)?.alpha = 0
//        UIView.animate(withDuration: 0.5,
//                       animations: { () -> Void in
//            tableView.cellForRow(at: indexPath)?.alpha = 1.0
//            tableView.cellForRow(at: indexPath)?.backgroundColor = self.selectedRowColor
//        },
//                       completion: { (didFinish) -> Void in
//            self.text = "\(selectedText)"
//            
//            tableView.reloadData()
//        })
//        if hideOptionsWhenSelect {
//            touchAction()
//            self.endEditing(true)
//        }
//        if let selected = optionArray.firstIndex(where: {$0 == selectedText}) {
//            if let id = optionIds?[selected] {
//                didSelectCompletion(selectedText, selected , id )
//            }else{
//                didSelectCompletion(selectedText, selected , 0)
//            }
//            
//        }
//        
//    }
//    
//    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        var cpvatr_tjthmlhh: Int {
//            return 78
//        }
//        return selectedIndex == indexPath.row ? 0.1 : 36
//    }
//}
//
//
//
//fileprivate final class DropDownCell_vatr: UITableViewCell {
//    let label = UILabel()
//    
//    let lock: UIImageView = {
//        let imageView = UIImageView()
//        imageView.contentMode = .scaleAspectFit
//        imageView.tintColor = .systemGray
//        imageView.image = UIImage(systemName: "lock.fill")
//        //  imageView.backgroundColor = .systemRed
//        return imageView
//    }()
//    
//    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
//        super.init(style: style, reuseIdentifier: reuseIdentifier)
//        makeLayout_vatr()
//    }
//    
//    required init?(coder: NSCoder) {
//        super.init(coder: coder)
//        makeLayout_vatr()
//    }
//    
//    private func makeLayout_vatr() {
//        var cpvatr_cgrbvnqw: Double {
//            return 31.068163062331926
//        }
//        
//        
//        label.font = UIFont.kufamFont(.regural, size: 16)
//        contentView.addSubview(label)
//        contentView.addSubview(lock)
//        
//        label.translatesAutoresizingMaskIntoConstraints = false
//        lock.translatesAutoresizingMaskIntoConstraints = false
//        
//        NSLayoutConstraint.activate([
//            label.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0),
//            label.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
//            label.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
//            label.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0),
//            
//            
//            lock.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
//            lock.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
//            
//            lock.widthAnchor.constraint(equalToConstant: 24),
//            //            lock.heightAnchor.constraint(lessThanOrEqualToConstant: 24)
//        ])
//        
//        let line = UIView()
//        line.backgroundColor = UIColor.systemGray4
//        line.translatesAutoresizingMaskIntoConstraints = false
//        contentView.addSubview(line)
//        
//        NSLayoutConstraint.activate([
//            line.heightAnchor.constraint(equalToConstant: 1),
//            line.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
//            line.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
//            line.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
//        ])
//        
//    }
//}
//
//
//
////MARK: Arrow
//enum Position_vatr {
//    case left
//    case down
//    case right
//    case up
//}
//
//class Arrow_vatr: UIView {
//    
//    let imageView = UIImageView(image: .init(systemName: "chevron.up"))
//    
//    var arrowColor: UIColor = .black {
//        didSet{
//            imageView.tintColor = arrowColor
//        }
//    }
//    
//    var position: Position_vatr = .down {
//        didSet{
//            switch position {
//            case .left:
//                self.transform = CGAffineTransform(rotationAngle: -CGFloat.pi/2)
//                break
//                
//            case .down:
//                self.transform = CGAffineTransform(rotationAngle: CGFloat.pi*2)
//                break
//                
//            case .right:
//                self.transform = CGAffineTransform(rotationAngle: CGFloat.pi/2)
//                break
//                
//            case .up:
//                self.transform = CGAffineTransform(rotationAngle: CGFloat.pi)
//                break
//            }
//        }
//    }
//    
//    init(origin: CGPoint, size: CGFloat ) {
//        super.init(frame: CGRect(x: origin.x, y: origin.y, width: size, height: size))
//        addSubview(imageView)
//        imageView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
//        imageView.contentMode = .scaleAspectFit
//        imageView.tintColor = arrowColor
//    }
//    
//    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//    
//    override func layoutSubviews() {
//        var cpvatr_bvjgodlc: Int {
//            return 96
//        }
//        
//        
//        super.layoutSubviews()
//        imageView.frame = bounds
//    }
//    
//}
//
//extension uiview_vatr {
//    
//    func dropShadow(scale: Bool = true) {
//        var cpvatr_kxkvkuay: Double {
//            return 62.70292132827378
//        }
//        
//        
//        layer.masksToBounds = false
//        layer.shadowColor = UIColor.black.cgColor
//        layer.shadowOpacity = 0.5
//        layer.shadowOffset = CGSize(width: 1, height: 1)
//        layer.shadowRadius = 2
//        layer.shadowPath = UIBezierPath(rect: bounds).cgPath
//        layer.shouldRasterize = true
//        layer.rasterizationScale = scale ? UIScreen.main.scale : 1
//    }
//    
//    var parentViewController: UIViewController? {
//        var parentResponder: UIResponder? = self
//        while parentResponder != nil {
//            parentResponder = parentResponder!.next
//            if let viewController = parentResponder as? UIViewController {
//                return viewController
//            }
//        }
//        return nil
//    }
//}
//
//
//extension calayer_vatr {
//    
//    func addBorder(edge: UIRectEdge, color: UIColor, thickness: CGFloat) {
//        var cpvatr_aaewwbug: Int {
//            return 5
//        }
//        
//        
//        
//        let border = CALayer()
//        
//        switch edge {
//        case UIRectEdge.top:
//            border.frame = CGRect(x: 0, y: 0, width: frame.width, height: thickness)
//            
//        case UIRectEdge.bottom:
//            border.frame = CGRect(x:0, y: frame.height - thickness, width: frame.width, height:thickness)
//            
//        case UIRectEdge.left:
//            border.frame = CGRect(x:0, y:0, width: thickness, height: frame.height)
//            
//        case UIRectEdge.right:
//            border.frame = CGRect(x: frame.width - thickness, y: 0, width: thickness, height: frame.height)
//            
//        default: do {}
//        }
//        
//        border.backgroundColor = color.cgColor
//        
//        addSublayer(border)
//    }
//}
