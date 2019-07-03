//
//  MapView.swift
//  AHWeather
//
//  Created by AroHak on 02/03/2016.
//  Copyright © 2016 AroHak LLC. All rights reserved.
//

class MapView: UIView {
    
    //MARK: - Create UIElements
    lazy var bgView: UIView = {
        let view = UIView.newAutoLayout()
        view.backgroundColor = GRAY_200
        view.alpha = 0.7
        
        return view
    }()
    
    lazy var contentView: UIView = {
        let view = UIView.newAutoLayout()
        view.backgroundColor = CLEAR

        return view
    }()
    
    lazy var contentImageView: UIImageView = {
        let view = UIImageView.newAutoLayout()
        view.image = UIImage(named: "2")
        
        return view
    }()
    
    lazy var topView: MATopView = {
        let view = MATopView.newAutoLayout()
        
        return view
    }()
    
    lazy var map: GMSMapView = {
        let view = GMSMapView()
        view.camera = GMSCameraPosition.camera(withLatitude: 44.869195, longitude: -69.170654, zoom: 6)
        
        return view
    }()

    lazy var bottomView: MABottomView = {
        let view = MABottomView.newAutoLayout()
        
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
        addSubview(bgView)
        addSubview(contentView)
        contentView.addSubview(topView)
        contentView.addSubview(map)
        contentView.addSubview(bottomView)

        setConstraints()
    }
    
    //MARK: - Constraints
    func setConstraints() {
        bgView.autoPinEdgesToSuperviewEdges()
        
        contentView.autoCenterInSuperview()
        contentView.autoSetDimensions(to: CGSize(width: ScreenSize.WIDTH, height: ScreenSize.HEIGHT*0.6))

        topView.autoPinEdge(toSuperviewEdge: .top)
        topView.autoPinEdge(toSuperviewEdge: .left, withInset: DE_OFFSET/2)
        topView.autoPinEdge(toSuperviewEdge: .right, withInset: DE_OFFSET/2)
        topView.autoSetDimension(.height, toSize: MA_BTN_HEIGHT)
        
        map.autoPinEdge(.top, to: .bottom, of: topView, withOffset: DE_OFFSET/2)
        map.autoPinEdge(toSuperviewEdge: .left, withInset: DE_OFFSET/2)
        map.autoPinEdge(toSuperviewEdge: .right, withInset: DE_OFFSET/2)
        map.autoPinEdge(.bottom, to: .top, of: bottomView, withOffset: -DE_OFFSET/2)

        bottomView.autoPinEdge(toSuperviewEdge: .left, withInset: DE_OFFSET/2)
        bottomView.autoPinEdge(toSuperviewEdge: .right, withInset: DE_OFFSET/2)
        bottomView.autoPinEdge(toSuperviewEdge: .bottom, withInset: DE_OFFSET/2)
        bottomView.autoSetDimension(.height, toSize: MA_BTN_HEIGHT)
    }
}
