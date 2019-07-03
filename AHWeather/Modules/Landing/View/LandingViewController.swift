//
//  LandingViewController.swift
//  AHWeather
//
//  Created by AroHak on 02/03/2016.
//  Copyright © 2016 AroHak LLC. All rights reserved.
//

class LandingViewController: UIViewController, LandingViewInput {

    var output: LandingViewOutput!
    var landingView: LandingView!
    
    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        baseConfig()
        output.viewIsReady()
    }

    // MARK: LandingViewInput
    func setupInitialState(items: Array<Weather>) {
        landingView.tableView.items = items
        landingView.tableView.reloadData()
    }
    
    // MARK: Private Methods
    private func baseConfig() {
        landingView = LandingView() {
            self.output.viewIsSelectItem(item: $0)
        }
        self.view = landingView
    }
}
