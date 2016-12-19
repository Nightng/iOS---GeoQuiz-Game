//
//  ViewController.swift
//  GeoQuiz
//
//  Created by Wilson Ng on 12/17/16.
//  Copyright © 2016 Wilson Ng. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController {
    @IBOutlet weak var mapView: MKMapView! {
        didSet{
            mapView.mapType = .satellite
        }
    }
    var annotation = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let appDelegate = UIApplication.shared.delegate
        annotation = linesFromResource(fileName: "annotation.txt")
        let pin0 = Annotation(title: "Canada",
                              subtitle: "",
                              capital: "Ottawa",
                              coordinate: CLLocationCoordinate2D(latitude: 45.27, longitude: -75.42))
        let pin1 = Annotation(title: "United States of America",
                              subtitle: "",
                              capital: "Washington DC",
                              coordinate: CLLocationCoordinate2D(latitude: 39.91, longitude: -77.02))
        let pin2 = Annotation(title: "Venezuela",
                              subtitle: "",
                              capital: "Caracas",
                              coordinate: CLLocationCoordinate2D(latitude: 10.30, longitude: -66.55))
        let pin3 = Annotation(title: "Mexico",
                              subtitle: "",
                              capital: "Mexico",
                              coordinate: CLLocationCoordinate2D(latitude: 19.20, longitude: -99.10))
        let pin4 = Annotation(title: "Brazil",
                              subtitle: "",
                              capital: "Brasilia",
                              coordinate: CLLocationCoordinate2D(latitude: -15.47, longitude: -47.55))
        mapView.addAnnotation(pin0)
        mapView.addAnnotation(pin1)
        mapView.addAnnotation(pin2)
        mapView.addAnnotation(pin3)
        mapView.addAnnotation(pin4)
    }
    
    func mapView(mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
            performSegue(withIdentifier: "quiz", sender: view)
    }
    
    func mapView(mapView: MKMapView, didSelectAnnotationView aView: MKAnnotationView)
        
    {
             performSegue(withIdentifier: "quiz", sender: aView)
//        mapView.removeAnnotation(pin1)
    }
    
    
//    func mapView(sender: MKMapView, viewForAnnotation: MKAnnotation) -> MKAnnotationView {
//        
//        var view: MKAnnotationView! =
//            
//            sender.dequeueReusableAnnotationViewWithIdentifier(IDENT)
//        
//        if view == nil {
//            
//            view = MKPinAnnotationView(annotation: annotation, reuseIdentifier: IDENT)
//            
//            view.canShowCallout = true
//            
//        }
//        
//        view.annotation = annotation // yes, this happens twice if no dequeue
//        
//        // prepare and (if not too expensive) load up accessory views here
//        
//        // or reset them and wait until mapView(didSelectAnnotationView:) to load actual data
//        
//        return view
//        
//    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "quiz" )
        {
//            let next = segue.destination as! TableViewController
            
//            next.ann = (sender as! MKAnnotationView).annotation!.title
            
        }
        
    }
    
    //File reader
    func linesFromResource(fileName: String) -> [String] {
        guard let path = Bundle.main.path(forResource: fileName, ofType: nil)
            else {
                fatalError("Resource file for \(fileName) not found.")
        }
        do {
            let content = try String(contentsOfFile: path, encoding: String.Encoding.utf8)
            return content.components(separatedBy: "\n")
        } catch let error {
            fatalError("Could not load strings from \(path): \(error).")
        }
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if(segue.identifier == "quiz"){
//            var dest = segue.destinationViewController! as ViewController
//            dest.
//        }
//    }

}

