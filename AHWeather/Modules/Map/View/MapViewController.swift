//
//  MapViewController.swift
//  AHWeather
//
//  Created by AroHak on 07/03/2016.
//  Copyright © 2016 AroHak LLC. All rights reserved.
//

class MapViewController: UIViewController, MapViewInput, UITextFieldDelegate {

    var output: MapViewOutput!
    let mapView = MapView()
    
    var location: CLLocation!
    var cityMarker: GMSMarker!
    var myMarker: GMSMarker!

    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        baseConfig()
        output.viewIsReady()
    }

    // MARK: MapViewInput
    func setupInitialState(_ city: City) {
        mapView.topView.textField.text = city.name
        setObjectMarkerPosition(city: city)
    }
    
    func updateLocation(_ location: CLLocation) {
        self.location = location
    }
    
    func shakeTextField() {
        UIHelper.shakeWithView(view: mapView.topView.textField)
    }
    
    // MARK: Private Methods
    private func baseConfig() {
        cityMarker = GMSMarker()
        cityMarker.map = mapView.map
        cityMarker.icon = UIImage(named: "img_pin")
        
        myMarker = GMSMarker()
        myMarker.map = mapView.map
        myMarker.icon = UIImage(named: "img_me")

        mapView.topView.textField.delegate = self
        mapView.topView.searchButton.addTarget(self, action: #selector(MapViewController.search), for: .touchUpInside)
        mapView.bottomView.updateButton.addTarget(self, action: #selector(MapViewController.update), for: .touchUpInside)
        mapView.bottomView.cancelButton.addTarget(self, action: #selector(MapViewController.cancel), for: .touchUpInside)
        mapView.bottomView.nearMeButton.addTarget(self, action: #selector(MapViewController.nearMe), for: .touchUpInside)

        self.view = mapView
    }
    
    private func setObjectMarkerPosition(city: City) {
        let latitude =  Double(city.lat)
        let longitude =  Double(city.lon)

        cityMarker.position = CLLocationCoordinate2DMake(latitude!, longitude!)
        cityMarker.map!.animate(to: GMSCameraPosition.camera(withLatitude: latitude!, longitude: longitude!, zoom: 15))
    }
    
    private func setMyMarkerPosition(location: CLLocation) {
        let latitude =  location.coordinate.latitude
        let longitude =  location.coordinate.longitude

        myMarker.position = CLLocationCoordinate2DMake(latitude, longitude)
        myMarker.map!.animate(to: GMSCameraPosition.camera(withLatitude: latitude, longitude: longitude, zoom: 15))
    }
    
    // MARK: Actions
    @objc func search() {
        output.searchAction(city: mapView.topView.textField.text!)
    }
    
    @objc func update() {
        output.updateAction(city: mapView.topView.textField.text!)
    }
    
    @objc func cancel() {
        output.cancelAction()
    }
    
    @objc func nearMe() {
        if let location = location { setMyMarkerPosition(location: location) }
    }
    
    // MARK: UITextFieldDelegate
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        mapView.topView.textField.resignFirstResponder()
        
        return true
    }
}
