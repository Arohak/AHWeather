//
//  LATableView.swift
//  AHWeather
//
//  Created by Ara Hakobyan on 3/5/16.
//  Copyright © 2016 AroHak LLC. All rights reserved.
//

class LATableView: UITableView, UITableViewDataSource, UITableViewDelegate {

    let cellIdentifire = "cellIdentifire"
    var items = Array<Weather>()
    var myBlock: block!

    //MARK: - Initialize
    init() {
        super.init(frame: .zero, style: .plain)
        
        backgroundColor = CLEAR
        dataSource = self
        delegate = self
        separatorStyle = .none
        showsVerticalScrollIndicator = false
        contentInset = UIEdgeInsetsMake(0, 0, 0, 0)
    }
    
    convenience init(completionBlock: @escaping block) {
        self.init()
        
        myBlock = completionBlock
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifire) as? LandingCell
        let item = items[indexPath.row]
        if cell == nil {
            cell = LandingCell(item: item, reuseIdentifier: cellIdentifire)
        } else {
            cell!.setValues(item: item)
        }
        
        return cell!
    }
    
    //MARK: - UITableViewDelegate
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return LA_CELL_HEIGHT
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = items[indexPath.row]
        myBlock(item)
    }
}

//MARK: - LandingCell
class LandingCell: UITableViewCell {
    
    //MARK: - Create UIElements
    var cellContentView = LandingCellContentView()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = CLEAR
        self.selectionStyle = .none
    }
    
    convenience init(item: Weather, reuseIdentifier: String?) {
        self.init(style: .default, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(cellContentView)
        cellContentView.autoPinEdgesToSuperviewEdges()
        
        setValues(item: item)
    }
    
    func setValues(item: Weather) {
        cellContentView.cityNameLabel.text = item.location.name
        cellContentView.iconImageView.kf.setImage(with: URL(string: "http:" + item.current.condition.icon)!)
        cellContentView.titleLabel.text = item.current.condition.text
        cellContentView.tempLabel.text = "Temp:    " + item.current.tempC + ",  " + item.current.tempF
        cellContentView.mphLabel.text = "MPHW:    " + item.current.mphW
        cellContentView.kphLabel.text = "KPHW:    " + item.current.kphW
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: - LandingCellContentView
class LandingCellContentView: UIView {
    
    //MARK: - Create UIElements
    lazy var cityNameLabel: AHWLabel = {
        let view = AHWLabel.newAutoLayout()
        view.font = DE_NAME_FONT
        
        return view
    }()
    
    lazy var iconImageView: UIImageView = {
        let view = UIImageView.newAutoLayout()
//        view.backgroundColor = BLUE_LIGHT
//        view.layer.cornerRadius = LA_ICON_SIZE/2
        
        return view
    }()
    
    lazy var titleLabel: AHWLabel = {
        let view = AHWLabel.newAutoLayout()
        view.font = TITLE_LBL_FONT
        
        return view
    }()

    lazy var tempLabel: AHWLabel = {
        let view = AHWLabel.newAutoLayout()
        
        return view
    }()
    
    lazy var mphLabel: AHWLabel = {
        let view = AHWLabel.newAutoLayout()
        
        return view
    }()
    
    lazy var kphLabel: AHWLabel = {
        let view = AHWLabel.newAutoLayout()
        
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
        addSubview(cityNameLabel)
        addSubview(iconImageView)
        addSubview(titleLabel)
        addSubview(tempLabel)
        addSubview(mphLabel)
        addSubview(kphLabel)

        setConstraints()
    }
    
    //MARK: - Constraints
    func setConstraints() {
        cityNameLabel.autoPinEdge(toSuperviewEdge: .top)
        cityNameLabel.autoAlignAxis(toSuperviewAxis: .vertical)

        iconImageView.autoPinEdge(toSuperviewEdge: .left, withInset: LA_INSET)
        iconImageView.autoPinEdge(.top, to: .bottom, of: cityNameLabel, withOffset: LA_INSET)
        iconImageView.autoSetDimensions(to: CGSize(width: LA_ICON_SIZE, height: LA_ICON_SIZE))
        
        titleLabel.autoAlignAxis(.horizontal, toSameAxisOf: iconImageView)
        titleLabel.autoPinEdge(.left, to: .right, of: iconImageView, withOffset: LA_INSET)
        
        tempLabel.autoPinEdge(toSuperviewEdge: .left, withInset: LA_INSET)
        tempLabel.autoPinEdge(.top, to: .bottom, of: iconImageView, withOffset: LA_INSET)
        
        mphLabel.autoPinEdge(toSuperviewEdge: .left, withInset: LA_INSET)
        mphLabel.autoPinEdge(.top, to: .bottom, of: tempLabel, withOffset: 0)
        
        kphLabel.autoPinEdge(toSuperviewEdge: .left, withInset: LA_INSET)
        kphLabel.autoPinEdge(.top, to: .bottom, of: mphLabel, withOffset: 0)
    }
}
