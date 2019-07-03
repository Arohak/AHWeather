//
//  BaseViewswift
//  AHWeather
//
//  Created by Ara Hakobyan on 3/2/16.
//  Copyright © 2016 AroHak LLC. All rights reserved.
//

//MARK: - BaseView
class BaseView: UIView {
    
    //MARK: - Create UIElements
    lazy var tableView: UITableView = {
        let view = UITableView(frame: .zero, style: .plain)
        view.separatorStyle = .none
        view.backgroundColor = CLEAR
        view.showsVerticalScrollIndicator = false
        view.contentInset = UIEdgeInsetsMake(0, 0, 0, 0)
        
        return view
    }()
    
    //MARK: - Initialize
    init() {
        super.init(frame: .zero)
        
        backgroundColor = CLEAR
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Privat Methods
    func addAllUIElements() {
        addSubview(tableView)
    }
    
    //MARK: - Constraints
    func setConstraints() {

        tableView.autoPinEdgesToSuperviewEdges()
    }
}

//MARK: - AHWLabel
class AHWLabel: UILabel {
    
    //MARK: - Initialize
    init() {
        super.init(frame: .zero)
        
        font = LA_LBL_FONT
        textColor = WHITE
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: - AHWTextField
class AHWTextField: UITextField {
    
    var indexPath = IndexPath(row: 0, section: 0)

    //MARK: - Initialize
    init() {
        super.init(frame: .zero)
        
        keyboardType = .default
        tintColor = WHITE
        textColor = WHITE
    }
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: 7, dy:7)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: 7, dy:7)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: - AHWButton
class AHWButton: UIButton {
    
    var indexPath = NSIndexPath()
    
    //MARK: - Initialize
    override init(frame : CGRect) {
        super.init(frame: frame)
        
        self.isExclusiveTouch = true
        self.titleLabel?.font = DE_TITLE_FONT
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: - Extension UIFont
extension UIFont {
    func sizeOfString (string: String, constrainedToWidth width: Double) -> CGSize {
        return (string as NSString).boundingRect(with: CGSize(width: width, height: 1000),
                                                         options: NSStringDrawingOptions.usesLineFragmentOrigin,
                                                         attributes: [NSAttributedStringKey.font: self],
            context: nil).size
    }
}
