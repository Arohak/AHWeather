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
        let view = AHWButton.newAutoLayout()
        view.setBackgroundImage(UIImage(named: "img_bg"), for: .normal)
        view.setTitle("UPDATE", for: .normal)
        view.clipsToBounds = true
        view.layer.cornerRadius = MA_RADIUS
        
        return view
    }()
    
    lazy var cancelButton: AHWButton = {
        let view = AHWButton.newAutoLayout()
        view.setBackgroundImage(UIImage(named: "img_bg"), for: .normal)
        view.setTitle("CANCEL", for: .normal)
        view.clipsToBounds = true
        view.layer.cornerRadius = MA_RADIUS

        return view
    }()
    
    lazy var nearMeButton: AHWButton = {
        let view = AHWButton.newAutoLayout()
        view.setBackgroundImage(UIImage(named: "img_near"), for: .normal)
        
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
        addSubview(updateButton)
        addSubview(cancelButton)
//        addSubview(nearMeButton)

        setConstraints()
    }
    
    //MARK: - Constraints
    func setConstraints() {
        updateButton.autoAlignAxis(toSuperviewAxis: .horizontal)
        updateButton.autoPinEdge(toSuperviewEdge: .right, withInset: 0)
        updateButton.autoSetDimensions(to: CGSize(width: MA_BTN_HEIGHT*2.5, height: MA_BTN_HEIGHT))
        
        cancelButton.autoAlignAxis(toSuperviewAxis: .horizontal)
        cancelButton.autoPinEdge(.right, to: .left, of: updateButton, withOffset: -DE_OFFSET/2)
        cancelButton.autoSetDimensions(to: CGSize(width: MA_BTN_HEIGHT*2.5, height: MA_BTN_HEIGHT))
        
//        nearMeButton.autoAlignAxis(toSuperviewAxis: .horizontal)
//        nearMeButton.autoPinEdge(toSuperviewEdge: .left, withInset: DE_OFFSET/2)
//        nearMeButton.autoSetDimensions(to: CGSize(width: MA_BTN_HEIGHT, height: MA_BTN_HEIGHT))

    }
}
