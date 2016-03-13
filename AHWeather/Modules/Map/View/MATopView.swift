//
//  MATopView.swift
//  AHWeather
//
//  Created by Ara Hakobyan on 3/5/16.
//  Copyright © 2016 AroHak LLC. All rights reserved.
//

class MATopView: UIView {
    
    //MARK: - Create UIElements
    lazy var bgImageView: UIImageView = {
        let view = UIImageView.newAutoLayoutView()
//        view.image = UIImage(named: "2")
        
        return view
    }()
    
    lazy var textField: AHWTextField = {
        let view = AHWTextField.newAutoLayoutView()
        view.attributedPlaceholder = NSAttributedString(string: "Search City", attributes: [NSForegroundColorAttributeName: WHITE])
//        view.layer.borderColor = WHITE.CGColor
//        view.layer.borderWidth = 1
        view.layer.cornerRadius = MA_RADIUS
        view.returnKeyType = .Done
        view.backgroundColor = GRAY_119
        
        return view
    }()
    
    lazy var searchButton: AHWButton = {
        let view = AHWButton.newAutoLayoutView()
        view.setBackgroundImage(UIImage(named: "search"), forState: .Normal)
        
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
        addSubview(bgImageView)
        addSubview(textField)
        addSubview(searchButton)

        setConstraints()
    }
    
    //MARK: - Constraints
    func setConstraints() {
        bgImageView.autoPinEdgesToSuperviewEdges()
        
        textField.autoAlignAxis(.Horizontal, toSameAxisOfView: bgImageView)
        textField.autoPinEdgeToSuperviewEdge(.Left, withInset: DE_OFFSET/2)
        textField.autoMatchDimension(.Height, toDimension: .Height, ofView: bgImageView)
        textField.autoPinEdge(.Right, toEdge: .Left, ofView: searchButton, withOffset: -DE_OFFSET/2)

        searchButton.autoAlignAxis(.Horizontal, toSameAxisOfView: bgImageView)
        searchButton.autoPinEdgeToSuperviewEdge(.Right, withInset: DE_OFFSET/2)
        searchButton.autoMatchDimension(.Height, toDimension: .Height, ofView: bgImageView)
        searchButton.autoMatchDimension(.Width, toDimension: .Height, ofView: searchButton)
    }
}
