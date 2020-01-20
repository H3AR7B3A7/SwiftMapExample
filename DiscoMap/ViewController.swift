//
//  ViewController.swift
//  DiscoMap
//
//  Created by mobapp12 on 15/01/2020.
//  Copyright © 2020 H3AR7B3A7. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    let locationManager = CLLocationManager.init()
    var data:DataSource?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        data = DataSource.init()
        mapView.addAnnotations(data!.items)
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.handleTap(_:)))
        mapView.addGestureRecognizer(tap)
    }
    
    @IBAction func changeMapType(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            mapView.mapType = .standard
        case 1:
            mapView.mapType = .hybrid
        case 2:
            mapView.mapType = .hybridFlyover
        default:
            print("kan niet")
        }
    }
    
    @IBAction func handleTap(_ sender: UILongPressGestureRecognizer) {
        // Here goes what code has to execute on tap
        let pressedPoint = sender.location(in: mapView)
        let coordFromPoint = mapView.convert(pressedPoint, toCoordinateFrom: mapView)
        // Ask for title and subtitle ??
        let title = "Add a Point of Interest:"
        let message = "What is this? Tell us something about it."
        
            let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
            alert.addTextField(configurationHandler: nil)
            alert.addTextField(configurationHandler: nil)

        let okHandler = {(action:UIAlertAction) -> Void in
            let pinTitle = alert.textFields![0]
            let pinSubTitle = alert.textFields![1]
            
            // Use coords from map to create a new pin
            let newPin = PointOfInterest.init(coordinate: coordFromPoint, title:pinTitle.text, subtitle: pinSubTitle.text)
            self.data?.items.append(newPin)
            self.mapView.addAnnotation(newPin)
        }
        
        alert.addAction(UIAlertAction(title: "Oké", style: .default, handler: okHandler))
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
}

extension ViewController:CLLocationManagerDelegate{
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        switch status{
        case .authorizedWhenInUse:
            mapView.showsUserLocation = true
        case .authorizedAlways: mapView.showsUserLocation = true
        case .notDetermined: print("Choices choices...")
        default:
            showNoPermissionAlert()
        }
    }
    func showNoPermissionAlert(){
        let alert = UIAlertController.init(title: "Caution", message: "For all features, enable localisation permissions in settings.", preferredStyle: .actionSheet)
        let cancelAction = UIAlertAction.init(title: "Cancel", style: .cancel, handler: nil)
        alert.addAction(cancelAction)
        self.present(alert, animated: true, completion:nil)
    }
}

extension ViewController:MKMapViewDelegate{
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        // is annotation a point of interest, transform to class POI
        if let poi = annotation as? PointOfInterest{
            // check if a poi is present
            if let customView = mapView.dequeueReusableAnnotationView(withIdentifier: "pin"){
                // pin exists, fill with poi
                customView.annotation = poi
                return customView
            }else{
            // pin bestond niet, build one
            let customView = MKPinAnnotationView.init(annotation: poi, reuseIdentifier: "pin")
            customView.pinTintColor = UIColor.purple
            customView.animatesDrop = true
            customView.canShowCallout = true
            
            return customView
            }
        }
        return nil
    }
    
    func mapViewDidFinishLoadingMap(_ mapView: MKMapView) {
        locationManager.startUpdatingLocation()
    }
    
    func mapView(_ mapView: MKMapView, didUpdate userLocation: MKUserLocation) {
        let visibleRegion = MKCoordinateRegion.init(center: userLocation.coordinate, latitudinalMeters: 200000, longitudinalMeters: 200000)
        mapView.region = visibleRegion
    }
    
    
}

extension ViewController{

    
    
}
