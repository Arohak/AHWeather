//
//  DetailViewController.swift
//  AHWeather
//
//  Created by AroHak on 02/03/2016.
//  Copyright © 2016 AroHak LLC. All rights reserved.
//

class DetailViewController: UIViewController, DetailViewInput {

    var output: DetailViewOutput!
    var detailView = DetailView()

    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        baseConfig()
        output.viewIsReady()
    }

    // MARK: DetailViewInput
    func setupInitialState(object: WeatherForecast) {
        let days = object.forecastDays.map({$0})
        
        var temp = Array<ForecastDay>()
        for (i, day) in days.enumerate() { if i != 0 { temp.append(day) } }
        detailView.dayTableView.days = temp
        detailView.dayTableView.reloadData()
        
        detailView.timeCollectionView.hours = days[0].hours.map({$0})
        detailView.timeCollectionView.reloadData()
        
        detailView.topView.cityNameLabel.text = object.name
        detailView.topView.iconImageView.kf_setImageWithURL(NSURL(string: "http:" + object.weather.current.condition.icon)!)
        detailView.topView.titleLabel.text = object.weather.current.condition.text
        detailView.topView.tempLabel.text = object.weather.current.tempC
        detailView.topView.weekLabel.text = days[0].date.weekDay
        detailView.topView.tempAverageLabel.text = days[0].day.maxTemp + "     " + days[0].day.minTemp
        
        detailView.bottomView.updateLabel.text = "Updated:  " + object.weather.current.lastUpdated
    }
    
    // MARK: Private Methods
    private func baseConfig() {
        detailView.topView.backButton.addTarget(self, action: #selector(DetailViewController.back), forControlEvents: .TouchUpInside)
        detailView.topView.searchButton.addTarget(self, action: #selector(DetailViewController.search), forControlEvents: .TouchUpInside)
        detailView.bottomView.fiveDayButton.addTarget(self, action: #selector(DetailViewController.five), forControlEvents: .TouchUpInside)
        detailView.bottomView.tenDayButton.addTarget(self, action: #selector(DetailViewController.ten), forControlEvents: .TouchUpInside)
        detailView.bottomView.updateButton.addTarget(self, action: #selector(DetailViewController.update), forControlEvents: .TouchUpInside)

        self.view = detailView
    }
    
    // MARK: Actions
    func back() {
        output.backAction()
    }
    
    func search() {
        output.searchAction()
    }
    
    func five() {
        output.fiveDayAction()
    }
    
    func ten() {
        output.tenDayAction()
    }
    
    func update() {
        output.updateAction()
    }
}
