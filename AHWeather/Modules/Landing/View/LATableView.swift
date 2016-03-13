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
        super.init(frame: CGRectZero, style: .Plain)
        
        backgroundColor = CLEAR
        dataSource = self
        delegate = self
        separatorStyle = .None
        showsVerticalScrollIndicator = false
        contentInset = UIEdgeInsetsMake(0, 0, 0, 0)
    }
    
    convenience init(completionBlock: block) {
        self.init()
        
        myBlock = completionBlock
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - UITableViewDataSource
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return items.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifire) as? LandingCell
        let item = items[indexPath.row]
        if cell == nil {
            cell = LandingCell(item: item, reuseIdentifier: cellIdentifire)
        } else {
            cell!.setValues(item)
        }
        
        return cell!
    }
    
    //MARK: - UITableViewDelegate
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        
        return LA_CELL_HEIGHT
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let item = items[indexPath.row]
        myBlock(value: item)
    }
}

//MARK: - LandingCell
class LandingCell: UITableViewCell {
    
    //MARK: - Create UIElements
    var cellContentView = LandingCellContentView()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = CLEAR
        self.selectionStyle = .None
    }
    
    convenience init(item: Weather, reuseIdentifier: String?) {
        self.init(style: .Default, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(cellContentView)
        cellContentView.autoPinEdgesToSuperviewEdges()
        
        setValues(item)
    }
    
    func setValues(item: Weather) {
        cellContentView.cityNameLabel.text = item.location.name
        cellContentView.iconImageView.kf_setImageWithURL(NSURL(string: "http:" + item.current.condition.icon)!)
        cellContentView.titleLabel.text = item.current.condition.text
        cellContentView.tempLabel.text = "Temp:    " + item.current.tempC + "C,   " + item.current.tempF + "F"
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
        let view = AHWLabel.newAutoLayoutView()
        view.font = DE_NAME_FONT
        
        return view
    }()
    
    lazy var iconImageView: UIImageView = {
        let view = UIImageView.newAutoLayoutView()
//        view.backgroundColor = BLUE_LIGHT
//        view.layer.cornerRadius = LA_ICON_SIZE/2
        
        return view
    }()
    
    lazy var titleLabel: AHWLabel = {
        let view = AHWLabel.newAutoLayoutView()
        view.font = TITLE_LBL_FONT
        
        return view
    }()

    lazy var tempLabel: AHWLabel = {
        let view = AHWLabel.newAutoLayoutView()
        
        return view
    }()
    
    lazy var mphLabel: AHWLabel = {
        let view = AHWLabel.newAutoLayoutView()
        
        return view
    }()
    
    lazy var kphLabel: AHWLabel = {
        let view = AHWLabel.newAutoLayoutView()
        
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
        cityNameLabel.autoPinEdgeToSuperviewEdge(.Top)
        cityNameLabel.autoAlignAxisToSuperviewAxis(.Vertical)

        iconImageView.autoPinEdgeToSuperviewEdge(.Left, withInset: LA_INSET)
        iconImageView.autoPinEdge(.Top, toEdge: .Bottom, ofView: cityNameLabel, withOffset: LA_INSET)
        iconImageView.autoSetDimensionsToSize(CGSize(width: LA_ICON_SIZE, height: LA_ICON_SIZE))
        
        titleLabel.autoAlignAxis(.Horizontal, toSameAxisOfView: iconImageView)
        titleLabel.autoPinEdge(.Left, toEdge: .Right, ofView: iconImageView, withOffset: LA_INSET)
        
        tempLabel.autoPinEdgeToSuperviewEdge(.Left, withInset: LA_INSET)
        tempLabel.autoPinEdge(.Top, toEdge: .Bottom, ofView: iconImageView, withOffset: LA_INSET)
        
        mphLabel.autoPinEdgeToSuperviewEdge(.Left, withInset: LA_INSET)
        mphLabel.autoPinEdge(.Top, toEdge: .Bottom, ofView: tempLabel, withOffset: 0)
        
        kphLabel.autoPinEdgeToSuperviewEdge(.Left, withInset: LA_INSET)
        kphLabel.autoPinEdge(.Top, toEdge: .Bottom, ofView: mphLabel, withOffset: 0)
    }
}
