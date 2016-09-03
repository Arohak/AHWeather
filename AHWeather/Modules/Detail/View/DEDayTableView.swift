//
//  DEDayTableView.swift
//  AHWeather
//
//  Created by Ara Hakobyan on 3/5/16.
//  Copyright © 2016 AroHak LLC. All rights reserved.
//

class DEDayTableView: UITableView, UITableViewDataSource, UITableViewDelegate {

    let cellIdentifire = "cellIdentifire"
    var days = Array<ForecastDay>()

    //MARK: - Initialize
    init() {
        super.init(frame: CGRectZero, style: .Plain)
        
        backgroundColor = CLEAR
        dataSource = self
        delegate = self
//        separatorStyle = .None
        separatorColor = GRAY_119
        showsVerticalScrollIndicator = false
        contentInset = UIEdgeInsetsMake(0, 0, 0, 0)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - UITableViewDataSource
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return days.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifire) as? DayCell
        let day = days[indexPath.row]
        if cell == nil {
            cell = DayCell(day: day, reuseIdentifier: cellIdentifire)
        } else {
            cell!.setValues(day)
        }
        
        return cell!
    }
    
    //MARK: - UITableViewDelegate
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        
        return LA_CELL_HEIGHT/4
    }
}

//MARK: - DayCell
class DayCell: UITableViewCell {
    
    //MARK: - Create UIElements
    var cellContentView = DayCellContentView()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = CLEAR
        self.selectionStyle = .None
    }
    
    convenience init(day: ForecastDay, reuseIdentifier: String?) {
        self.init(style: .Default, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(cellContentView)
        cellContentView.autoPinEdgesToSuperviewEdges()
        
        setValues(day)
    }
    
    func setValues(forecastDay: ForecastDay) {
        cellContentView.titleLabel.text = forecastDay.date.weekDay
        cellContentView.iconImageView.kf_setImageWithURL(NSURL(string: "http:" + forecastDay.day.condition.icon)!)
        cellContentView.tempLabel.text = forecastDay.day.maxTemp + "     " + forecastDay.day.minTemp
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: - DayCellContentView
class DayCellContentView: UIView {
    
    //MARK: - Create UIElements
    lazy var titleLabel: AHWLabel = {
        let view = AHWLabel.newAutoLayoutView()
        view.font = DE_TITLE_FONT
        
        return view
    }()
    
    lazy var iconImageView: UIImageView = {
        let view = UIImageView.newAutoLayoutView()
//        view.backgroundColor = BLUE_LIGHT
//        view.layer.cornerRadius = LA_ICON_SIZE/2
        
        return view
    }()

    lazy var tempLabel: AHWLabel = {
        let view = AHWLabel.newAutoLayoutView()
        view.font = DE_TITLE_FONT

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
        addSubview(iconImageView)
        addSubview(titleLabel)
        addSubview(tempLabel)
        
        setConstraints()
    }
    
    //MARK: - Constraints
    func setConstraints() {
        titleLabel.autoAlignAxisToSuperviewAxis(.Horizontal)
        titleLabel.autoPinEdgeToSuperviewEdge(.Left, withInset: LA_INSET)
        
        iconImageView.autoCenterInSuperview()
        iconImageView.autoSetDimensionsToSize(CGSize(width: LA_ICON_SIZE, height: LA_ICON_SIZE))
        
        tempLabel.autoAlignAxisToSuperviewAxis(.Horizontal)
        tempLabel.autoPinEdgeToSuperviewEdge(.Right, withInset: LA_INSET)
    }
}
