//
//  MABottomView.swift
//  AHWeather
//
//  Created by Ara Hakobyan on 3/5/16.
//  Copyright © 2016 AroHak LLC. All rights reserved.
//

class MABottomView: UIView {
    
    var myBlock: block!
    
    //MARK: - Create UIElements
    lazy var updateButton: AHWButton = {
        let view = AHWButton.newAutoLayoutView()
        view.setBackgroundImage(UIImage(named: "img_bg"), forState: .Normal)
        view.setTitle("UPDATE", forState: .Normal)
        view.clipsToBounds = true
        view.layer.cornerRadius = MA_RADIUS
        
        return view
    }()
    
    lazy var cancelButton: AHWButton = {
        let view = AHWButton.newAutoLayoutView()
        view.setBackgroundImage(UIImage(named: "img_bg"), forState: .Normal)
        view.setTitle("CANCEL", forState: .Normal)
        view.clipsToBounds = true
        view.layer.cornerRadius = MA_RADIUS

        return view
    }()
    
    lazy var nearMeButton: AHWButton = {
        let view = AHWButton.newAutoLayoutView()
        view.setBackgroundImage(UIImage(named: "img_near"), forState: .Normal)
        
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
        addSubview(updateButton)
        addSubview(cancelButton)
        addSubview(nearMeButton)

        setConstraints()
    }
    
    //MARK: - Constraints
    func setConstraints() {
        updateButton.autoAlignAxisToSuperviewAxis(.Horizontal)
        updateButton.autoPinEdgeToSuperviewEdge(.Right, withInset: 0)
        updateButton.autoSetDimensionsToSize(CGSize(width: MA_BTN_HEIGHT*2.5, height: MA_BTN_HEIGHT))
        
        cancelButton.autoAlignAxisToSuperviewAxis(.Horizontal)
        cancelButton.autoPinEdge(.Right, toEdge: .Left, ofView: updateButton, withOffset: -DE_OFFSET/2)
        cancelButton.autoSetDimensionsToSize(CGSize(width: MA_BTN_HEIGHT*2.5, height: MA_BTN_HEIGHT))
        
        nearMeButton.autoAlignAxisToSuperviewAxis(.Horizontal)
        nearMeButton.autoPinEdgeToSuperviewEdge(.Left, withInset: DE_OFFSET/2)
        nearMeButton.autoSetDimensionsToSize(CGSize(width: MA_BTN_HEIGHT, height: MA_BTN_HEIGHT))

    }
}
