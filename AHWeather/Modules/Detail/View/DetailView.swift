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
        let view = UIImageView.newAutoLayout()
        view.image = UIImage(named: "1")
        
        return view
    }()
    
    lazy var bgParentImageView: UIImageView = {
        let view = UIImageView.newAutoLayout()
        view.image = UIImage(named: "2")
        
        return view
    }()
    
    lazy var topView: DETopView = {
        let view = DETopView.newAutoLayout()
        
        return view
    }()
    
    lazy var timeCollectionView: DETimeCollectionView = {
        let view = DETimeCollectionView.newAutoLayout()
        
        return view
    }()
    
    lazy var dayTableView: DEDayTableView = {
        let view = DEDayTableView.newAutoLayout()

        return view
    }()
    
    lazy var bottomView: DEBottomView = {
        let view = DEBottomView.newAutoLayout()
        
        return view
    }()
    
    
    lazy var lineOneImageView: UIImageView = {
        let view = UIImageView.newAutoLayout()
        view.backgroundColor = GRAY_119
        
        return view
    }()
    
    
    lazy var lineTwoImageView: UIImageView = {
        let view = UIImageView.newAutoLayout()
        view.backgroundColor = GRAY_119
        
        return view
    }()
    
    //MARK: - Initialize
    init() {
        super.init(frame: .zero)
        
        backgroundColor = WHITE
        addAllUIElements()
    }
    
    convenience init(completionBlock: @escaping block) {
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
        
        bgParentImageView.autoPinEdge(.top, to: .top, of: timeCollectionView, withOffset: -DE_OFFSET/2)
        bgParentImageView.autoPinEdge(toSuperviewEdge: .left)
        bgParentImageView.autoPinEdge(toSuperviewEdge: .right)
        bgParentImageView.autoPinEdge(.bottom, to: .bottom, of: bottomView, withOffset: 0)
        
        lineOneImageView.autoPinEdge(.top, to: .top, of: timeCollectionView, withOffset: -DE_OFFSET/2)
        lineOneImageView.autoPinEdge(toSuperviewEdge: .left)
        lineOneImageView.autoPinEdge(toSuperviewEdge: .right)
        lineOneImageView.autoSetDimension(.height, toSize: 1)
        
        topView.autoPinEdge(toSuperviewEdge: .top)
        topView.autoPinEdge(toSuperviewEdge: .left)
        topView.autoPinEdge(toSuperviewEdge: .right)
        topView.autoSetDimension(.height, toSize: DE_TOP_HEIGHT)
        
        timeCollectionView.autoPinEdge(.top, to: .bottom, of: topView, withOffset: DE_OFFSET)
        timeCollectionView.autoPinEdge(toSuperviewEdge: .left)
        timeCollectionView.autoPinEdge(toSuperviewEdge: .right)
        timeCollectionView.autoSetDimension(.height, toSize: DE_TIME_CELL_SIZE)
        
        dayTableView.autoPinEdge(.top, to: .bottom, of: timeCollectionView, withOffset: DE_OFFSET/1.5)
        dayTableView.autoPinEdge(toSuperviewEdge: .left)
        dayTableView.autoPinEdge(toSuperviewEdge: .right)
        dayTableView.autoPinEdge(.bottom, to: .top, of: bottomView, withOffset: 0)
        
        lineTwoImageView.autoPinEdge(.top, to: .bottom, of: timeCollectionView, withOffset: DE_OFFSET/1.5)
        lineTwoImageView.autoPinEdge(toSuperviewEdge: .left)
        lineTwoImageView.autoPinEdge(toSuperviewEdge: .right)
        lineTwoImageView.autoSetDimension(.height, toSize: 1)
        
        bottomView.autoPinEdge(toSuperviewEdge: .left)
        bottomView.autoPinEdge(toSuperviewEdge: .right)
        bottomView.autoPinEdge(toSuperviewEdge: .bottom)
        bottomView.autoSetDimension(.height, toSize: DE_BOTTOM_HEIGHT)
    }
}
