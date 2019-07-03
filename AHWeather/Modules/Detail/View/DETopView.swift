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
        let view = AHWButton.newAutoLayout()
        view.setBackgroundImage(UIImage(named: "back"), for: .normal)
        
        return view
    }()
    
    lazy var searchButton: AHWButton = {
        let view = AHWButton.newAutoLayout()
        view.setBackgroundImage(UIImage(named: "img_map"), for: .normal)
        
        return view
    }()
    
    lazy var cityNameLabel: AHWLabel = {
        let view = AHWLabel.newAutoLayout()
        view.font = DE_NAME_FONT
        view.textAlignment = .center
        
        return view
    }()
    
    lazy var iconImageView: UIImageView = {
        let view = UIImageView.newAutoLayout()
//        view.backgroundColor = BLUE_LIGHT
//        view.layer.cornerRadius = DE_ICON_SIZE/2
        
        return view
    }()
    
    lazy var titleLabel: AHWLabel = {
        let view = AHWLabel.newAutoLayout()
        view.font = DE_TITLE_FONT

        return view
    }()
    
    lazy var tempLabel: AHWLabel = {
        let view = AHWLabel.newAutoLayout()
        view.font = DE_TEMP_FONT
        view.textAlignment = .center

        return view
    }()
    
    lazy var weekLabel: AHWLabel = {
        let view = AHWLabel.newAutoLayout()
        view.font = DE_TITLE_FONT
        view.text = "Monday"
        
        return view
    }()
    
    lazy var tempAverageLabel: AHWLabel = {
        let view = AHWLabel.newAutoLayout()
        view.font = DE_TITLE_FONT
        view.text = "13   9"
        
        return view
    }()

    //MARK: - Initialize
    init() {
        super.init(frame: .zero)
        
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
        backButton.autoPinEdge(toSuperviewEdge: .top, withInset: DE_OFFSET)
        backButton.autoPinEdge(toSuperviewEdge: .left, withInset: DE_OFFSET/2)
        backButton.autoSetDimensions(to: CGSize(width: DE_BTN_SIZE, height: DE_BTN_SIZE))
        
        searchButton.autoPinEdge(toSuperviewEdge: .top, withInset: DE_OFFSET)
        searchButton.autoPinEdge(toSuperviewEdge: .right, withInset: DE_OFFSET/2)
        searchButton.autoSetDimensions(to: CGSize(width: DE_BTN_SIZE, height: DE_BTN_SIZE))
        
        cityNameLabel.autoAlignAxis(.horizontal, toSameAxisOf: backButton)
        cityNameLabel.autoPinEdge(toSuperviewEdge: .left)
        cityNameLabel.autoPinEdge(toSuperviewEdge: .right)
        
        iconImageView.autoPinEdge(.top, to: .bottom, of: cityNameLabel, withOffset: LA_INSET/2)
        iconImageView.autoAlignAxis(.vertical, toSameAxisOf: cityNameLabel, withOffset: -LA_INSET*2)
        iconImageView.autoSetDimensions(to: CGSize(width: DE_ICON_SIZE, height: DE_ICON_SIZE))
        
        titleLabel.autoAlignAxis(.horizontal, toSameAxisOf: iconImageView)
        titleLabel.autoPinEdge(.left, to: .right, of: iconImageView, withOffset: 0)
        
        tempLabel.autoPinEdge(.top, to: .bottom, of: iconImageView, withOffset: -LA_INSET/2)
        tempLabel.autoPinEdge(toSuperviewEdge: .left)
        tempLabel.autoPinEdge(toSuperviewEdge: .right)
        
        weekLabel.autoPinEdge(toSuperviewEdge: .bottom)
        weekLabel.autoPinEdge(toSuperviewEdge: .left, withInset: LA_INSET)

        tempAverageLabel.autoPinEdge(toSuperviewEdge: .bottom)
        tempAverageLabel.autoPinEdge(toSuperviewEdge: .right, withInset: LA_INSET)
    }
}
