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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        baseConfig()
        output.viewIsReady()
    }

    // MARK: DetailViewInput
    func setupInitialState(object: WeatherForecast) {
        let days = object.forecastDays.map({$0})
        
        var temp = Array<ForecastDay>()
        for (i, day) in days.enumerated() { if i != 0 { temp.append(day) } }
        detailView.dayTableView.days = temp
        detailView.dayTableView.reloadData()
        
        detailView.timeCollectionView.hours = days[0].hours.map({$0})
        detailView.timeCollectionView.reloadData()
        
        detailView.topView.cityNameLabel.text = object.name
        detailView.topView.iconImageView.kf.setImage(with: URL(string: "http:" + object.weather.current.condition.icon)!)
        detailView.topView.titleLabel.text = object.weather.current.condition.text
        detailView.topView.tempLabel.text = object.weather.current.tempC
        detailView.topView.weekLabel.text = days[0].date.weekDay
        detailView.topView.tempAverageLabel.text = days[0].day.maxTemp + "     " + days[0].day.minTemp
        
        detailView.bottomView.updateLabel.text = "Updated:  " + object.weather.current.lastUpdated
    }
    
    // MARK: Private Methods
    private func baseConfig() {
        detailView.topView.backButton.addTarget(self, action: #selector(back), for: .touchUpInside)
        detailView.topView.searchButton.addTarget(self, action: #selector(search), for: .touchUpInside)
        detailView.bottomView.fiveDayButton.addTarget(self, action: #selector(five), for: .touchUpInside)
        detailView.bottomView.tenDayButton.addTarget(self, action: #selector(ten), for: .touchUpInside)
        detailView.bottomView.updateButton.addTarget(self, action: #selector(update), for: .touchUpInside)

        self.view = detailView
    }
    
    // MARK: Actions
    @objc func back() {
        output.backAction()
    }
    
    @objc func search() {
        output.searchAction()
    }
    
    @objc func five() {
        output.fiveDayAction()
    }
    
    @objc func ten() {
        output.tenDayAction()
    }
    
    @objc func update() {
        output.updateAction()
    }
}
