//
//  DETimeCollectionView.swift
//  AHWeather
//
//  Created by Ara Hakobyan on 3/5/16.
//  Copyright © 2016 AroHak LLC. All rights reserved.
//

class DETimeCollectionView: UICollectionView, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {

    let cellIdentifire = "cellCollectionIdentifire"
    var hours = Array<Hour>()

    //MARK: - Initialize
    init() {
        let layout = UICollectionViewFlowLayout()
        super.init(frame: .zero, collectionViewLayout: layout)
        
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: DE_TIME_CELL_SIZE, height: DE_TIME_CELL_SIZE)
        layout.sectionInset = .zero
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        
        backgroundColor = CLEAR
        register(TimeCollectionCell.self, forCellWithReuseIdentifier: cellIdentifire)
        showsHorizontalScrollIndicator = false
        dataSource = self
        delegate = self
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - UICollectionViewDataSource
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return hours.count
    }

    //MARK: - UICollectionViewDelegate
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifire, for: indexPath) as! TimeCollectionCell
        let hour = hours[indexPath.row]
        cell.setValues(hour)
        
        return cell
    }
}

//MARK: - TimeCollectionCell
class TimeCollectionCell: UICollectionViewCell {
    
    //MARK: - Create UIElements
    var cellContentView = TimeCellContentView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = CLEAR
        addSubview(cellContentView)
        cellContentView.autoPinEdgesToSuperviewEdges()
    }
    
    func setValues(_ hour: Hour) {
        cellContentView.iconImageView.kf.setImage(with: URL(string: "http:" + hour.condition.icon)!)
        cellContentView.timeLabel.text = hour.time
        cellContentView.tempLabel.text = hour.tempC
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: - TimeCellContentView
class TimeCellContentView: UIView {
    
    //MARK: - Create UIElements
    lazy var timeLabel: AHWLabel = {
        let view = AHWLabel.newAutoLayout()
        
        return view
    }()
    
    lazy var iconImageView: UIImageView = {
        let view = UIImageView.newAutoLayout()
//        view.backgroundColor = BLUE_LIGHT
//        view.layer.cornerRadius = DE_TIME_CELL_SIZE/4
        
        return view
    }()
    
    lazy var tempLabel: AHWLabel = {
        let view = AHWLabel.newAutoLayout()
        
        return view
    }()
    
    //MARK: - Initialize
    init() {
        super.init(frame: .zero)
        
        addAllUIElements()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Privat Methods
    func addAllUIElements() {
        addSubview(timeLabel)
        addSubview(iconImageView)
        addSubview(tempLabel)
        
        setConstraints()
    }
    
    //MARK: - Constraints
    func setConstraints() {
        timeLabel.autoAlignAxis(toSuperviewAxis: .vertical)
        timeLabel.autoPinEdge(toSuperviewEdge: .top, withInset: 0)
        
        iconImageView.autoCenterInSuperview()
        iconImageView.autoSetDimensions(to: CGSize(width: DE_TIME_CELL_SIZE/2, height: DE_TIME_CELL_SIZE/2))
        
        tempLabel.autoAlignAxis(toSuperviewAxis: .vertical)
        tempLabel.autoPinEdge(toSuperviewEdge: .bottom, withInset: 0)
    }
}

