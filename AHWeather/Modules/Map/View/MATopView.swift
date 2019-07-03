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
        let view = UIImageView.newAutoLayout()
//        view.image = UIImage(named: "2")
        
        return view
    }()
    
    lazy var textField: AHWTextField = {
        let view = AHWTextField.newAutoLayout()
        view.attributedPlaceholder = NSAttributedString(string: "Search City", attributes: [NSAttributedStringKey.foregroundColor: WHITE])
//        view.layer.borderColor = WHITE.CGColor
//        view.layer.borderWidth = 1
        view.layer.cornerRadius = MA_RADIUS
        view.returnKeyType = .done
        view.backgroundColor = GRAY_119
        
        return view
    }()
    
    lazy var searchButton: AHWButton = {
        let view = AHWButton.newAutoLayout()
        view.setBackgroundImage(UIImage(named: "search"), for: .normal)
        
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
        addSubview(bgImageView)
        addSubview(textField)
        addSubview(searchButton)

        setConstraints()
    }
    
    //MARK: - Constraints
    func setConstraints() {
        bgImageView.autoPinEdgesToSuperviewEdges()
        
        textField.autoAlignAxis(.horizontal, toSameAxisOf: bgImageView)
        textField.autoPinEdge(toSuperviewEdge: .left, withInset: DE_OFFSET/2)
        textField.autoMatch(.height, to: .height, of: bgImageView)
        textField.autoPinEdge(.right, to: .left, of: searchButton, withOffset: -DE_OFFSET/2)

        searchButton.autoAlignAxis(.horizontal, toSameAxisOf: bgImageView)
        searchButton.autoPinEdge(toSuperviewEdge: .right, withInset: DE_OFFSET/2)
        searchButton.autoMatch(.height, to: .height, of: bgImageView)
        searchButton.autoMatch(.width, to: .height, of: searchButton)
    }
}
