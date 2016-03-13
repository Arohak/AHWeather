//
//  DetailView.swift
//  AHWeather
//
//  Created by AroHak on 02/03/2016.
//  Copyright © 2016 AroHak LLC. All rights reserved.
//

class DetailView: UIView {
    
    var items = Array<Weather>()
    var myBlock: block!
    
    //MARK: - Create UIElements
    lazy var bgImageView: UIImageView = {
        let view = UIImageView.newAutoLayoutView()
        view.image = UIImage(named: "1")
        
        return view
    }()
    
    lazy var bgParentImageView: UIImageView = {
        let view = UIImageView.newAutoLayoutView()
        view.image = UIImage(named: "2")
        
        return view
    }()
    
    lazy var topView: DETopView = {
        let view = DETopView.newAutoLayoutView()
        
        return view
    }()
    
    lazy var timeCollectionView: DETimeCollectionView = {
        let view = DETimeCollectionView.newAutoLayoutView()
        
        return view
    }()
    
    lazy var dayTableView: DEDayTableView = {
        let view = DEDayTableView.newAutoLayoutView()

        return view
    }()
    
    lazy var bottomView: DEBottomView = {
        let view = DEBottomView.newAutoLayoutView()
        
        return view
    }()
    
    
    lazy var lineOneImageView: UIImageView = {
        let view = UIImageView.newAutoLayoutView()
        view.backgroundColor = GRAY_119
        
        return view
    }()
    
    
    lazy var lineTwoImageView: UIImageView = {
        let view = UIImageView.newAutoLayoutView()
        view.backgroundColor = GRAY_119
        
        return view
    }()
    
    //MARK: - Initialize
    init() {
        super.init(frame: CGRectZero)
        
        backgroundColor = WHITE
        addAllUIElements()
    }
    
    convenience init(completionBlock: block) {
        self.init()
        
        myBlock = completionBlock
        
        backgroundColor = WHITE
        addAllUIElements()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Privat Methods
    func addAllUIElements() {
        addSubview(bgImageView)
        addSubview(bgParentImageView)
        addSubview(topView)
        addSubview(timeCollectionView)
        addSubview(dayTableView)
        addSubview(bottomView)
        addSubview(lineOneImageView)
        addSubview(lineTwoImageView)

        setConstraints()
    }
    
    //MARK: - Constraints
    func setConstraints() {
        bgImageView.autoPinEdgesToSuperviewEdges()
        
        bgParentImageView.autoPinEdge(.Top, toEdge: .Top, ofView: timeCollectionView, withOffset: -DE_OFFSET/2)
        bgParentImageView.autoPinEdgeToSuperviewEdge(.Left)
        bgParentImageView.autoPinEdgeToSuperviewEdge(.Right)
        bgParentImageView.autoPinEdge(.Bottom, toEdge: .Bottom, ofView: bottomView, withOffset: 0)
        
        lineOneImageView.autoPinEdge(.Top, toEdge: .Top, ofView: timeCollectionView, withOffset: -DE_OFFSET/2)
        lineOneImageView.autoPinEdgeToSuperviewEdge(.Left)
        lineOneImageView.autoPinEdgeToSuperviewEdge(.Right)
        lineOneImageView.autoSetDimension(.Height, toSize: 1)
        
        topView.autoPinEdgeToSuperviewEdge(.Top)
        topView.autoPinEdgeToSuperviewEdge(.Left)
        topView.autoPinEdgeToSuperviewEdge(.Right)
        topView.autoSetDimension(.Height, toSize: DE_TOP_HEIGHT)
        
        timeCollectionView.autoPinEdge(.Top, toEdge: .Bottom, ofView: topView, withOffset: DE_OFFSET)
        timeCollectionView.autoPinEdgeToSuperviewEdge(.Left)
        timeCollectionView.autoPinEdgeToSuperviewEdge(.Right)
        timeCollectionView.autoSetDimension(.Height, toSize: DE_TIME_CELL_SIZE)
        
        dayTableView.autoPinEdge(.Top, toEdge: .Bottom, ofView: timeCollectionView, withOffset: DE_OFFSET/1.5)
        dayTableView.autoPinEdgeToSuperviewEdge(.Left)
        dayTableView.autoPinEdgeToSuperviewEdge(.Right)
        dayTableView.autoPinEdge(.Bottom, toEdge: .Top, ofView: bottomView, withOffset: 0)
        
        lineTwoImageView.autoPinEdge(.Top, toEdge: .Bottom, ofView: timeCollectionView, withOffset: DE_OFFSET/1.5)
        lineTwoImageView.autoPinEdgeToSuperviewEdge(.Left)
        lineTwoImageView.autoPinEdgeToSuperviewEdge(.Right)
        lineTwoImageView.autoSetDimension(.Height, toSize: 1)
        
        bottomView.autoPinEdgeToSuperviewEdge(.Left)
        bottomView.autoPinEdgeToSuperviewEdge(.Right)
        bottomView.autoPinEdgeToSuperviewEdge(.Bottom)
        bottomView.autoSetDimension(.Height, toSize: DE_BOTTOM_HEIGHT)
    }
}
