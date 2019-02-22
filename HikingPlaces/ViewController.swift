//
//  ViewController.swift
//  HikingPlaces
//
//  Created by jear on 2018-11-03.
//  Copyright © 2018 jear. All rights reserved.
//https://www.alltrails.com/trail/canada/ontario/oak-forest-walking-loop-trail
import UIKit
import WebKit
import MapKit

//(11)
import CoreLocation
                                                //(11)
class ViewController: UIViewController, CLLocationManagerDelegate {
    
    
    @IBOutlet weak var distance: UILabel!
    @IBOutlet weak var eval: UILabel!
    
    @IBOutlet weak var type: UILabel!
    @IBOutlet weak var getLocBTN: UIButton!
    
    //(11) Auth
    let locationManager = CLLocationManager()
    
    
    
   
    
    
    var tappedCell = ""
    
    
    
    @IBOutlet weak var videoPlaceholder: WKWebView!
    
    @IBOutlet weak var infoDetails: UILabel!
    
   
    
    // global func
    
    func details(){
        if(tappedCell == "https://www.youtube.com/embed/8K26WBQfVwg"){
            infoDetails.text = "Lake Laurentian Loop is located near Greater Sudbury, Ontario, Canada. The trail is rated as moderate and primarily used for hiking, walking, trail running, and snowshoeing. Dogs are also able to use this trail but must be kept on leash."
            distance.text = "DISTANCE: \n 9.2 km"
            eval.text = "ELEVATION: \n 257 m"
            type.text = "TYPE: \n Loop"
        
        }
        
        if(tappedCell == "https://www.youtube.com/embed/qRNwJAUhZQM"){
            infoDetails.text = "Lake Laurentian Conservation Area Trails is lightly trafficked out and back trail located near Greater Sudbury, Ontario, Canada and is good for all skill levels. The trail is primarily used for hiking, walking, and trail running and is best used from April until October."
            distance.text = "DISTANCE: \n 1.4 km"
            eval.text = "ELEVATION: \n 55 m"
            type.text = "TYPE: \n Out & Back"
            
        }
        
        
        if(tappedCell == "https://www.youtube.com/embed/MoUL65AdSEE"){
            infoDetails.text = "Bell Park Walkway Trail is lightly trafficked out and back trail located near Greater Sudbury, Ontario, Canada that features a lake and is good for all skill levels. The trail offers a number of activity options and is best used from April until October."
            distance.text = "DISTANCE: \n 4.7 km"
            eval.text = "ELEVATION: \n 97 m"
            type.text = "TYPE: \n Out & Back"
          
        }
        
        if(tappedCell == "h4"){
            infoDetails.text = "Place 4 \n Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to"
            distance.text = "DISTANCE: \n 9.2K"
            eval.text = "ELEVATION: \n 257 m"
            type.text = "TYPE: \n Loop"
        }
        
        if(tappedCell == "t2"){
            infoDetails.text = "Place 5 \n Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to"
            distance.text = "DISTANCE: \n 9.2K"
            eval.text = "ELEVATION: \n 257 m"
            type.text = "TYPE: \n Loop"
        }
        
    }
    
    
    
    
    
    
    
    func getDirection(arrayofLat:Double, arrayofLong:Double){
        
        let latitude:CLLocationDegrees = arrayofLat
        let longitude:CLLocationDegrees = arrayofLong
        
        let zoomin:CLLocationDistance = 10000;  //map zoom-in
        let coordinates = CLLocationCoordinate2DMake(latitude, longitude)
        let zoomSpan = MKCoordinateRegionMakeWithDistance(coordinates, zoomin, zoomin)
        
        let options = [MKLaunchOptionsMapCenterKey: NSValue(mkCoordinate: zoomSpan.center), MKLaunchOptionsMapSpanKey: NSValue(mkCoordinateSpan: zoomSpan.span)]
        
        let placemark = MKPlacemark(coordinate: coordinates)
        let mapItem = MKMapItem(placemark: placemark)
        mapItem.name = "Hiking Location"
        mapItem.openInMaps(launchOptions: options)
        
    }
    
    
    
    
    
    
    
  
    override func viewDidLoad() {
        super.viewDidLoad()
        distance.layer.cornerRadius = 5
        distance.clipsToBounds = true
        eval.layer.cornerRadius = 5
        eval.clipsToBounds = true
        type.layer.cornerRadius = 5
        type.clipsToBounds = true
        getLocBTN.layer.cornerRadius = 5
        getLocBTN.clipsToBounds = true
         Auth()
    
        let myURL = URL(string: tappedCell)
        let myRequest = URLRequest(url: myURL!)
        videoPlaceholder.load(myRequest)
        
    // calling the global func
       details()
    } /*-------------------- end of ViewDidload --------------*/
    
    
    
    
    
    
 
    
    
    
    
    
    
    
    
    
    @IBAction func mapBTN(_ sender: Any) {
     
        switch tappedCell{
            
            case "https://www.youtube.com/embed/8K26WBQfVwg":
                getDirection(arrayofLat: 46.454810, arrayofLong: -80.962665)
            
            case "https://www.youtube.com/embed/qRNwJAUhZQM":
                getDirection(arrayofLat: 46.471630, arrayofLong: -80.994557)
            
            case "https://www.youtube.com/embed/MoUL65AdSEE":
                getDirection(arrayofLat: 46.45524, arrayofLong: -80.94735)
            
            default:
            print("add a meesage here or an alert!")
        }
        
        
       
        
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    //(11) Authorize location service
    func Auth(){
        //(9) for the use when the app open in the background
        locationManager.requestAlwaysAuthorization()
        
        //(10) for the use when the app is open
        locationManager.requestWhenInUseAuthorization()
        
        //(11)
        if CLLocationManager.locationServicesEnabled(){
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.startUpdatingLocation()
        }
        
        
    }
    
    
    //(12)
    /* https://developer.apple.com/documentation/corelocation/cllocationmanagerdelegate/1423615-locationmanager  */
    func locationManager(_ manager: CLLocationManager,
                         didUpdateLocations locations: [CLLocation]){
        if let location = locations.first{
            print(location.coordinate)
        }
    }
    /* (13) add (Privacy - Location Always Usage Description) and
     (Privacy - Location When In Use Usage Description)
     in info.plist  */
    
    
    
}






