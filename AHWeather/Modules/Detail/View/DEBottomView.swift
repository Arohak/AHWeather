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
        let view = AHWButton.newAutoLayoutView()
        view.setImage(UIImage(named: "img_5d"), forState: .Normal)
        view.imageEdgeInsets = UIEdgeInsets(top: LA_ICON_SIZE*0.55, left: LA_ICON_SIZE*0.55, bottom: LA_ICON_SIZE*0.55, right: LA_ICON_SIZE*0.55)
        
        return view
    }()
    
    lazy var tenDayButton: AHWButton = {
        let view = AHWButton.newAutoLayoutView()
        view.setImage(UIImage(named: "img_10d"), forState: .Normal)
        view.imageEdgeInsets = UIEdgeInsets(top: LA_ICON_SIZE*0.55, left: LA_ICON_SIZE*0.55, bottom: LA_ICON_SIZE*0.55, right: LA_ICON_SIZE*0.55)

        return view
    }()
    
    lazy var lineImageView: UIImageView = {
        let view = UIImageView.newAutoLayoutView()
        view.backgroundColor = GRAY
        
        return view
    }()

    lazy var updateLabel: AHWLabel = {
        let view = AHWLabel.newAutoLayoutView()
        view.font = TITLE_BTN_FONT
        
        return view
    }()
    
    lazy var updateButton: AHWButton = {
        let view = AHWButton.newAutoLayoutView()
        view.setImage(UIImage(named: "img_upload"), forState: .Normal)
        view.imageEdgeInsets = UIEdgeInsets(top: LA_ICON_SIZE*0.55, left: LA_ICON_SIZE*0.55, bottom: LA_ICON_SIZE*0.55, right: LA_ICON_SIZE*0.55)
        return view
    }()
    
    //MARK: - Initialize
    init() {
        super.init(frame: CGRectZero)
        
        backgroundColor = CLEAR
        addAllUIElements()
    }
    
    convenience init(completionBlock: block) {
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
        fiveDayButton.autoAlignAxisToSuperviewAxis(.Horizontal)
        fiveDayButton.autoPinEdgeToSuperviewEdge(.Left, withInset: 0)
        fiveDayButton.autoSetDimensionsToSize(CGSize(width: LA_ICON_SIZE*2, height: LA_ICON_SIZE*2))
        
        lineImageView.autoAlignAxisToSuperviewAxis(.Horizontal)
        lineImageView.autoPinEdge(.Left, toEdge: .Right, ofView: fiveDayButton, withOffset: -DE_OFFSET/2)
        lineImageView.autoSetDimensionsToSize(CGSize(width: 2, height: LA_ICON_SIZE/2))
        
        tenDayButton.autoAlignAxisToSuperviewAxis(.Horizontal)
        tenDayButton.autoPinEdge(.Left, toEdge: .Right, ofView: lineImageView, withOffset: -DE_OFFSET/2)
        tenDayButton.autoSetDimensionsToSize(CGSize(width: LA_ICON_SIZE*2, height: LA_ICON_SIZE*2))
        
        updateLabel.autoAlignAxisToSuperviewAxis(.Horizontal)
        updateLabel.autoPinEdge(.Right, toEdge: .Left, ofView: updateButton, withOffset: DE_OFFSET/1.5)
        
        updateButton.autoAlignAxisToSuperviewAxis(.Horizontal)
        updateButton.autoPinEdgeToSuperviewEdge(.Right, withInset: 0)
        updateButton.autoSetDimensionsToSize(CGSize(width: LA_ICON_SIZE*2, height: LA_ICON_SIZE*2))
    }
}
