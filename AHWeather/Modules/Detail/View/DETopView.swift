//
//  DETopView.swift
//  AHWeather
//
//  Created by Ara Hakobyan on 3/5/16.
//  Copyright © 2016 AroHak LLC. All rights reserved.
//

class DETopView: UIView {
    
    //MARK: - Create UIElements
    lazy var backButton: AHWButton = {
        let view = AHWButton.newAutoLayoutView()
        view.setBackgroundImage(UIImage(named: "back"), forState: .Normal)
        
        return view
    }()
    
    lazy var searchButton: AHWButton = {
        let view = AHWButton.newAutoLayoutView()
        view.setBackgroundImage(UIImage(named: "img_map"), forState: .Normal)
        
        return view
    }()
    
    lazy var cityNameLabel: AHWLabel = {
        let view = AHWLabel.newAutoLayoutView()
        view.font = DE_NAME_FONT
        view.textAlignment = .Center
        
        return view
    }()
    
    lazy var iconImageView: UIImageView = {
        let view = UIImageView.newAutoLayoutView()
//        view.backgroundColor = BLUE_LIGHT
//        view.layer.cornerRadius = DE_ICON_SIZE/2
        
        return view
    }()
    
    lazy var titleLabel: AHWLabel = {
        let view = AHWLabel.newAutoLayoutView()
        view.font = DE_TITLE_FONT

        return view
    }()
    
    lazy var tempLabel: AHWLabel = {
        let view = AHWLabel.newAutoLayoutView()
        view.font = DE_TEMP_FONT
        view.textAlignment = .Center

        return view
    }()
    
    lazy var weekLabel: AHWLabel = {
        let view = AHWLabel.newAutoLayoutView()
        view.font = DE_TITLE_FONT
        view.text = "Monday"
        
        return view
    }()
    
    lazy var tempAverageLabel: AHWLabel = {
        let view = AHWLabel.newAutoLayoutView()
        view.font = DE_TITLE_FONT
        view.text = "13   9"
        
        return view
    }()

    //MARK: - Initialize
    init() {
        super.init(frame: CGRectZero)
        
        backgroundColor = CLEAR
        addAllUIElements()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Privat Methods
    func addAllUIElements() {
        addSubview(backButton)
        addSubview(searchButton)
        addSubview(cityNameLabel)
        addSubview(iconImageView)
        addSubview(titleLabel)
        addSubview(tempLabel)
        addSubview(weekLabel)
        addSubview(tempAverageLabel)

        setConstraints()
    }
    
    //MARK: - Constraints
    func setConstraints() {
        backButton.autoPinEdgeToSuperviewEdge(.Top, withInset: DE_OFFSET)
        backButton.autoPinEdgeToSuperviewEdge(.Left, withInset: DE_OFFSET/2)
        backButton.autoSetDimensionsToSize(CGSize(width: DE_BTN_SIZE, height: DE_BTN_SIZE))
        
        searchButton.autoPinEdgeToSuperviewEdge(.Top, withInset: DE_OFFSET)
        searchButton.autoPinEdgeToSuperviewEdge(.Right, withInset: DE_OFFSET/2)
        searchButton.autoSetDimensionsToSize(CGSize(width: DE_BTN_SIZE, height: DE_BTN_SIZE))
        
        cityNameLabel.autoAlignAxis(.Horizontal, toSameAxisOfView: backButton)
        cityNameLabel.autoPinEdgeToSuperviewEdge(.Left)
        cityNameLabel.autoPinEdgeToSuperviewEdge(.Right)
        
        iconImageView.autoPinEdge(.Top, toEdge: .Bottom, ofView: cityNameLabel, withOffset: LA_INSET/2)
        iconImageView.autoAlignAxis(.Vertical, toSameAxisOfView: cityNameLabel, withOffset: -LA_INSET*2)
        iconImageView.autoSetDimensionsToSize(CGSize(width: DE_ICON_SIZE, height: DE_ICON_SIZE))
        
        titleLabel.autoAlignAxis(.Horizontal, toSameAxisOfView: iconImageView)
        titleLabel.autoPinEdge(.Left, toEdge: .Right, ofView: iconImageView, withOffset: 0)
        
        tempLabel.autoPinEdge(.Top, toEdge: .Bottom, ofView: iconImageView, withOffset: -LA_INSET/2)
        tempLabel.autoPinEdgeToSuperviewEdge(.Left)
        tempLabel.autoPinEdgeToSuperviewEdge(.Right)
        
        weekLabel.autoPinEdgeToSuperviewEdge(.Bottom)
        weekLabel.autoPinEdgeToSuperviewEdge(.Left, withInset: LA_INSET)

        tempAverageLabel.autoPinEdgeToSuperviewEdge(.Bottom)
        tempAverageLabel.autoPinEdgeToSuperviewEdge(.Right, withInset: LA_INSET)
    }
}
