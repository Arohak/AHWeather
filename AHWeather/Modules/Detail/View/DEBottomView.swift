//
//  DEBottomView.swift
//  AHWeather
//
//  Created by Ara Hakobyan on 3/5/16.
//  Copyright © 2016 AroHak LLC. All rights reserved.
//

class DEBottomView: UIView {
    
    var myBlock: block!
    
    //MARK: - Create UIElements
    lazy var fiveDayButton: AHWButton = {
        let view = AHWButton.newAutoLayout()
        view.setImage(UIImage(named: "img_5d"), for: .normal)
        view.imageEdgeInsets = UIEdgeInsets(top: LA_ICON_SIZE*0.55, left: LA_ICON_SIZE*0.55, bottom: LA_ICON_SIZE*0.55, right: LA_ICON_SIZE*0.55)
        
        return view
    }()
    
    lazy var tenDayButton: AHWButton = {
        let view = AHWButton.newAutoLayout()
        view.setImage(UIImage(named: "img_10d"), for: .normal)
        view.imageEdgeInsets = UIEdgeInsets(top: LA_ICON_SIZE*0.55, left: LA_ICON_SIZE*0.55, bottom: LA_ICON_SIZE*0.55, right: LA_ICON_SIZE*0.55)

        return view
    }()
    
    lazy var lineImageView: UIImageView = {
        let view = UIImageView.newAutoLayout()
        view.backgroundColor = GRAY
        
        return view
    }()

    lazy var updateLabel: AHWLabel = {
        let view = AHWLabel.newAutoLayout()
        view.font = TITLE_BTN_FONT
        
        return view
    }()
    
    lazy var updateButton: AHWButton = {
        let view = AHWButton.newAutoLayout()
        view.setImage(UIImage(named: "img_upload"), for: .normal)
        view.imageEdgeInsets = UIEdgeInsets(top: LA_ICON_SIZE*0.55, left: LA_ICON_SIZE*0.55, bottom: LA_ICON_SIZE*0.55, right: LA_ICON_SIZE*0.55)
        return view
    }()
    
    //MARK: - Initialize
    init() {
        super.init(frame: .zero)
        
        backgroundColor = CLEAR
        addAllUIElements()
    }
    
    convenience init(completionBlock: @escaping block) {
        self.init()
        
        myBlock = completionBlock
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Privat Methods
    func addAllUIElements() {
        addSubview(fiveDayButton)
        addSubview(tenDayButton)
        addSubview(lineImageView)
        addSubview(updateLabel)
        addSubview(updateButton)

        setConstraints()
    }
    
    //MARK: - Constraints
    func setConstraints() {
        fiveDayButton.autoAlignAxis(toSuperviewAxis: .horizontal)
        fiveDayButton.autoPinEdge(toSuperviewEdge: .left, withInset: 0)
        fiveDayButton.autoSetDimensions(to: CGSize(width: LA_ICON_SIZE*2, height: LA_ICON_SIZE*2))
        
        lineImageView.autoAlignAxis(toSuperviewAxis: .horizontal)
        lineImageView.autoPinEdge(.left, to: .right, of: fiveDayButton, withOffset: -DE_OFFSET/2)
        lineImageView.autoSetDimensions(to: CGSize(width: 2, height: LA_ICON_SIZE/2))
        
        tenDayButton.autoAlignAxis(toSuperviewAxis: .horizontal)
        tenDayButton.autoPinEdge(.left, to: .right, of: lineImageView, withOffset: -DE_OFFSET/2)
        tenDayButton.autoSetDimensions(to: CGSize(width: LA_ICON_SIZE*2, height: LA_ICON_SIZE*2))
        
        updateLabel.autoAlignAxis(toSuperviewAxis: .horizontal)
        updateLabel.autoPinEdge(.right, to: .left, of: updateButton, withOffset: DE_OFFSET/1.5)
        
        updateButton.autoAlignAxis(toSuperviewAxis: .horizontal)
        updateButton.autoPinEdge(toSuperviewEdge: .right, withInset: 0)
        updateButton.autoSetDimensions(to: CGSize(width: LA_ICON_SIZE*2, height: LA_ICON_SIZE*2))
    }
}
