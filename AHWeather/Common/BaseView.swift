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
        let view = UITableView(frame: CGRectZero, style: .Plain)
        view.separatorStyle = .None
        view.backgroundColor = CLEAR
        view.showsVerticalScrollIndicator = false
        view.contentInset = UIEdgeInsetsMake(0, 0, 0, 0)
        
        return view
    }()
    
    //MARK: - Initialize
    init() {
        super.init(frame: CGRectZero)
        
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
        super.init(frame: CGRectZero)
        
        font = LA_LBL_FONT
        textColor = WHITE
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: - AHWTextField
class AHWTextField: UITextField {
    
    var indexPath = NSIndexPath(forRow: 0, inSection: 0)

    //MARK: - Initialize
    init() {
        super.init(frame: CGRectZero)
        
        keyboardType = .Default
        tintColor = WHITE
        textColor = WHITE
    }
    
    override func textRectForBounds(bounds: CGRect) -> CGRect {
        return CGRectInset(bounds, 7, 7)
    }
    
    override func editingRectForBounds(bounds: CGRect) -> CGRect {
        return CGRectInset(bounds, 7, 7)
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
        
        self.exclusiveTouch = true
        self.titleLabel?.font = DE_TITLE_FONT
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: - Extension UIFont
extension UIFont {
    func sizeOfString (string: String, constrainedToWidth width: Double) -> CGSize {
        return (string as NSString).boundingRectWithSize(CGSize(width: width, height: DBL_MAX),
            options: NSStringDrawingOptions.UsesLineFragmentOrigin,
            attributes: [NSFontAttributeName: self],
            context: nil).size
    }
}