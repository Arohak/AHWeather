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
        let view = UIView.newAutoLayoutView()
        view.backgroundColor = GRAY_200
        view.alpha = 0.7
        
        return view
    }()
    
    lazy var contentView: UIView = {
        let view = UIView.newAutoLayoutView()
        view.backgroundColor = CLEAR

        return view
    }()
    
    lazy var contentImageView: UIImageView = {
        let view = UIImageView.newAutoLayoutView()
        view.image = UIImage(named: "2")
        
        return view
    }()
    
    lazy var topView: MATopView = {
        let view = MATopView.newAutoLayoutView()
        
        return view
    }()
    
    lazy var map: GMSMapView = {
        let view = GMSMapView.newAutoLayoutView()
        view.camera = GMSCameraPosition.cameraWithLatitude(44.869195, longitude: -69.170654, zoom: 6)
        
        return view
    }()

    lazy var bottomView: MABottomView = {
        let view = MABottomView.newAutoLayoutView()
        
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
        contentView.autoSetDimensionsToSize(CGSize(width: ScreenSize.WIDTH, height: ScreenSize.HEIGHT*0.6))

        topView.autoPinEdgeToSuperviewEdge(.Top)
        topView.autoPinEdgeToSuperviewEdge(.Left, withInset: DE_OFFSET/2)
        topView.autoPinEdgeToSuperviewEdge(.Right, withInset: DE_OFFSET/2)
        topView.autoSetDimension(.Height, toSize: MA_BTN_HEIGHT)
        
        map.autoPinEdge(.Top, toEdge: .Bottom, ofView: topView, withOffset: DE_OFFSET/2)
        map.autoPinEdgeToSuperviewEdge(.Left, withInset: DE_OFFSET/2)
        map.autoPinEdgeToSuperviewEdge(.Right, withInset: DE_OFFSET/2)
        map.autoPinEdge(.Bottom, toEdge: .Top, ofView: bottomView, withOffset: -DE_OFFSET/2)

        bottomView.autoPinEdgeToSuperviewEdge(.Left, withInset: DE_OFFSET/2)
        bottomView.autoPinEdgeToSuperviewEdge(.Right, withInset: DE_OFFSET/2)
        bottomView.autoPinEdgeToSuperviewEdge(.Bottom, withInset: DE_OFFSET/2)
        bottomView.autoSetDimension(.Height, toSize: MA_BTN_HEIGHT)
    }
}
