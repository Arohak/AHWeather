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
    func setupInitialState(city: City) {
        mapView.topView.textField.text = city.name
        setObjectMarkerPosition(city)
    }
    
    func updateLocation(location: CLLocation) {
        self.location = location
    }
    
    func shakeTextField() {
        UIHelper.shakeWithView(mapView.topView.textField)
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
        mapView.topView.searchButton.addTarget(self, action: #selector(MapViewController.search), forControlEvents: .TouchUpInside)
        mapView.bottomView.updateButton.addTarget(self, action: #selector(MapViewController.update), forControlEvents: .TouchUpInside)
        mapView.bottomView.cancelButton.addTarget(self, action: #selector(MapViewController.cancel), forControlEvents: .TouchUpInside)
        mapView.bottomView.nearMeButton.addTarget(self, action: #selector(MapViewController.nearMe), forControlEvents: .TouchUpInside)

        self.view = mapView
    }
    
    private func setObjectMarkerPosition(city: City) {
        let latitude =  Double(city.lat)
        let longitude =  Double(city.lon)

        cityMarker.position = CLLocationCoordinate2DMake(latitude!, longitude!)
        cityMarker.map!.animateToCameraPosition(GMSCameraPosition.cameraWithLatitude(latitude!, longitude: longitude!, zoom: 15))
    }
    
    private func setMyMarkerPosition(location: CLLocation) {
        let latitude =  location.coordinate.latitude
        let longitude =  location.coordinate.longitude

        myMarker.position = CLLocationCoordinate2DMake(latitude, longitude)
        myMarker.map!.animateToCameraPosition(GMSCameraPosition.cameraWithLatitude(latitude, longitude: longitude, zoom: 15))
    }
    
    // MARK: Actions
    func search() {
        output.searchAction(mapView.topView.textField.text!)
    }
    
    func update() {
        output.updateAction(mapView.topView.textField.text!)
    }
    
    func cancel() {
        output.cancelAction()
    }
    
    func nearMe() {
        if let location = location { setMyMarkerPosition(location) }
    }
    
    // MARK: UITextFieldDelegate
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        mapView.topView.textField.resignFirstResponder()
        
        return true
    }
}
