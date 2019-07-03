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
        super.init(frame: .zero, style: .plain)
        
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
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return days.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifire) as? DayCell
        let day = days[indexPath.row]
        if cell == nil {
            cell = DayCell(day: day, reuseIdentifier: cellIdentifire)
        } else {
            cell!.setValues(forecastDay: day)
        }
        
        return cell!
    }
    
    //MARK: - UITableViewDelegate
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
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
        self.selectionStyle = .none
    }
    
    convenience init(day: ForecastDay, reuseIdentifier: String?) {
        self.init(style: .default, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(cellContentView)
        cellContentView.autoPinEdgesToSuperviewEdges()
        
        setValues(forecastDay: day)
    }
    
    func setValues(forecastDay: ForecastDay) {
        cellContentView.titleLabel.text = forecastDay.date.weekDay
        cellContentView.iconImageView.kf.setImage(with: URL(string: "http:" + forecastDay.day.condition.icon)!)
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
        let view = AHWLabel.newAutoLayout()
        view.font = DE_TITLE_FONT
        
        return view
    }()
    
    lazy var iconImageView: UIImageView = {
        let view = UIImageView.newAutoLayout()
//        view.backgroundColor = BLUE_LIGHT
//        view.layer.cornerRadius = LA_ICON_SIZE/2
        
        return view
    }()

    lazy var tempLabel: AHWLabel = {
        let view = AHWLabel.newAutoLayout()
        view.font = DE_TITLE_FONT

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
        addSubview(iconImageView)
        addSubview(titleLabel)
        addSubview(tempLabel)
        
        setConstraints()
    }
    
    //MARK: - Constraints
    func setConstraints() {
        titleLabel.autoAlignAxis(toSuperviewAxis: .horizontal)
        titleLabel.autoPinEdge(toSuperviewEdge: .left, withInset: LA_INSET)
        
        iconImageView.autoCenterInSuperview()
        iconImageView.autoSetDimensions(to: CGSize(width: LA_ICON_SIZE, height: LA_ICON_SIZE))
        
        tempLabel.autoAlignAxis(toSuperviewAxis: .horizontal)
        tempLabel.autoPinEdge(toSuperviewEdge: .right, withInset: LA_INSET)
    }
}
