//
//  ViewController.swift
//  Homework 7
//
//  Created by Shawn Broadway on 4/19/20.
//  Copyright © 2020 Shawn Broadway. All rights reserved.
//

import UIKit
import CoreLocation
class ViewController:UIViewController, CLLocationManagerDelegate {

    
    @IBOutlet weak var distanceLabel: UILabel!
    
    let locMan: CLLocationManager = CLLocationManager()
    var startLocation: CLLocation!
    
    // Seton Hill University
    let kfloridaLatitude: CLLocationDegrees = 34.1367
    let kfloridaLongitude: CLLocationDegrees = 118.6615

    

    
    
    
    
    
    
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        let newLocation: CLLocation=locations[0]
        NSLog("Something is happening")
        
        // horizontal accuracy less than than 0 means failure at gps level
        if newLocation.horizontalAccuracy >= 0 {
            
            
            let shu:CLLocation = CLLocation(latitude: kfloridaLatitude,longitude: kfloridaLongitude)

            let delta:CLLocationDistance = shu.distance(from: newLocation)
            
            let miles: Double = (delta * 0.000621371) + 0.5 // meters to rounded miles
            
            if miles < 3 {
                // Stop updating the location
                locMan.stopUpdatingLocation()
                // Congratulate the user
                distanceLabel.text = "Enjoy\nCalabasas!"
            } else {
                let commaDelimited: NumberFormatter = NumberFormatter()
                commaDelimited.numberStyle = NumberFormatter.Style.decimal
                
                distanceLabel.text=commaDelimited.string(from: NSNumber(value: miles))!+" miles to Calabasas"
            }
            
            
        }
        else
        {
            // add action if error with GPS
        }
    }
    
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        locMan.delegate = self
               locMan.desiredAccuracy = kCLLocationAccuracyThreeKilometers
               locMan.distanceFilter = 1609; // a mile (in meters)
               locMan.requestWhenInUseAuthorization() // verify access to gps
               locMan.startUpdatingLocation()
               startLocation = nil
        
    }


}

