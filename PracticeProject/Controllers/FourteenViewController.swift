//
//  FourteenViewController.swift
//  PracticeProject
//
//  Created by Now Admin on 6/24/22.
//

import UIKit

import GoogleMaps
import GooglePlaces
import CoreLocation
import Foundation


class FourteenViewController: UIViewController,CLLocationManagerDelegate {
    @IBOutlet weak var mapView: GMSMapView!
    var apiKey = "AIzaSyDtCcFm3Eh2PY4Wv4BI6xoCtamBshGgdzo"
    
    
    var sourceLocation:CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: 33.684422, longitude: 73.047882)
    var destinationLocation:CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: 31.684422, longitude: 70.047882)
    
    
    
    var locationManager = CLLocationManager()
    let marker = GMSMarker()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let camera = GMSCameraPosition.camera(withLatitude: 33.684422, longitude: 73.047882, zoom: 15.0)
        mapView.camera = camera
        mapView.settings.myLocationButton = true
        mapView.isMyLocationEnabled = true
        showMarker(position: camera.target)
        mapView.delegate = self
        
        self.locationManager.delegate = self
        self.locationManager.startUpdatingLocation()
        
        if CLLocationManager.locationServicesEnabled() && CLLocationManager.authorizationStatus() == CLAuthorizationStatus.authorizedWhenInUse {
            print("Furqan Location Permission enabled.\(mapView.isMyLocationEnabled)")
            mapView.isMyLocationEnabled = true
        }
        circle()
        
        // Getting routes are paid task so YOu need a paid accountf or that
       // getRouteSteps(from: sourceLocation, to: destinationLocation)
    }
    
    
    func circle(){
        let circleCenter = CLLocationCoordinate2D(latitude:  33.684422, longitude: 73.047882)
        let circ = GMSCircle(position: circleCenter, radius: 2000)
//        circ.fillColor = UIColor.random()
        circ.strokeColor = UIColor.random()
        circ.strokeWidth = 5
        circ.map = mapView
    }
    
    
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        //        let location = locations.last
        //        let camera = GMSCameraPosition.cameraWithLatitude((location?.coordinate.latitude)!, longitude: (location?.coordinate.longitude)!, zoom: 17.0)
        //        self.mapView?.animateToCameraPosition(camera)
        //Finally stop updating location otherwise it will come again and again in this delegate
        self.locationManager.stopUpdatingLocation()
    }
    

    
    func showMarker(position: CLLocationCoordinate2D){
        marker.position = position
        marker.title = "Islamabad"
        marker.snippet = "Islamabad2"
        marker.map = mapView
        marker.isDraggable = false
    }
    
}



extension FourteenViewController: GMSMapViewDelegate{
    /* handles Info Window tap */
    func mapView(_ mapView: GMSMapView, didTapInfoWindowOf marker: GMSMarker) {
        print("didTapInfoWindowOf")
    }
    
    /* handles Info Window long press */
    func mapView(_ mapView: GMSMapView, didLongPressInfoWindowOf marker: GMSMarker) {
        print("didLongPressInfoWindowOf")
    }
    
    /* set a custom Info Window */
    func mapView(_ mapView: GMSMapView, markerInfoWindow marker: GMSMarker) -> UIView? {
        print("Custom window ")
        let view = UIView(frame: CGRect.init(x: 0, y: 0, width: 200, height: 70))
        view.backgroundColor = UIColor.white
        view.layer.cornerRadius = 6
        
        let lbl1 = UILabel(frame: CGRect.init(x: 8, y: 8, width: view.frame.size.width - 16, height: 15))
        lbl1.text = "Hi there!"
        view.addSubview(lbl1)
        
        let lbl2 = UILabel(frame: CGRect.init(x: lbl1.frame.origin.x, y: lbl1.frame.origin.y + lbl1.frame.size.height + 3, width: view.frame.size.width - 16, height: 15))
        lbl2.text = "I am a custom info window."
        lbl2.font = UIFont.systemFont(ofSize: 14, weight: .light)
        view.addSubview(lbl2)
        
        return view
    }
    
    
    
    
    //MARK - GMSMarker Dragging
    func mapView(_ mapView: GMSMapView, didBeginDragging marker: GMSMarker) {
        print("didBeginDragging")
    }
    func mapView(_ mapView: GMSMapView, didDrag marker: GMSMarker) {
        print("didDrag")
    }
    func mapView(_ mapView: GMSMapView, didEndDragging marker: GMSMarker) {
        
        print("The New position is \(marker.position)")
        print("didEndDragging")
        
        mapView.camera = .init(latitude: marker.position.latitude, longitude: marker.position.longitude, zoom: 15.0)
    }
    
    
    
    func mapView(_ mapView: GMSMapView, didTapAt coordinate: CLLocationCoordinate2D){
      //  self.marker.position = coordinate
    }
    
    
    func mapView(_ mapView: GMSMapView, didChange position: GMSCameraPosition) {
        var destinationLocation = CLLocation()
          destinationLocation = CLLocation(latitude: position.target.latitude,  longitude: position.target.longitude)
          updateLocationoordinates(coordinates: destinationLocation.coordinate)
    }
    
    
    func updateLocationoordinates(coordinates:CLLocationCoordinate2D) {
             CATransaction.begin()
 //            CATransaction.setAnimationDuration(0.1)
             marker.position =  coordinates
             CATransaction.commit()
         
         print(coordinates)
     }
    
    
    
    func getRouteSteps(from source: CLLocationCoordinate2D, to destination: CLLocationCoordinate2D) {

        let session = URLSession.shared

        let url = URL(string: "https://maps.googleapis.com/maps/api/directions/json?origin=\(source.latitude),\(source.longitude)&destination=\(destination.latitude),\(destination.longitude)&sensor=false&mode=driving&key=\(apiKey)")!

        let task = session.dataTask(with: url, completionHandler: {
            (data, response, error) in

            guard error == nil else {
                print(error!.localizedDescription)
                return
            }

            guard let jsonResult = try? JSONSerialization.jsonObject(with: data!, options: .allowFragments) as? [String: Any] else {

                print("error in JSONSerialization")
                return

            }



            guard let routes = jsonResult["routes"] as? [Any] else {
                return
            }

            guard let route = routes[0] as? [String: Any] else {
                return
            }

            guard let legs = route["legs"] as? [Any] else {
                return
            }

            guard let leg = legs[0] as? [String: Any] else {
                return
            }

            guard let steps = leg["steps"] as? [Any] else {
                return
            }
              for item in steps {

                guard let step = item as? [String: Any] else {
                    return
                }

                guard let polyline = step["polyline"] as? [String: Any] else {
                    return
                }

                guard let polyLineString = polyline["points"] as? String else {
                    return
                }

                //Call this method to draw path on map
                DispatchQueue.main.async {
                    self.drawPath(from: polyLineString)
                }

            }
        })
        task.resume()
    }
    
    //MARK:- Draw Path line
func drawPath(from polyStr: String){
    let path = GMSPath(fromEncodedPath: polyStr)
    let polyline = GMSPolyline(path: path)
    polyline.strokeWidth = 3.0
    polyline.map = mapView // Google MapView


    let cameraUpdate = GMSCameraUpdate.fit(GMSCoordinateBounds(coordinate: sourceLocation, coordinate: destinationLocation))
    mapView.moveCamera(cameraUpdate)
    let currentZoom = mapView.camera.zoom
    mapView.animate(toZoom: currentZoom - 1.4)
}
}
