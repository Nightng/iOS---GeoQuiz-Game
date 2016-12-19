//
//  Annotation.swift
//  GeoQuiz
//
//  Created by Wilson Ng on 12/18/16.
//  Copyright © 2016 Wilson Ng. All rights reserved.
//

import Foundation
import MapKit

class Annotation: NSObject, MKAnnotation {
    var title: String?
    var subtitle: String?
    var capital: String?
    let coordinate: CLLocationCoordinate2D
    
    init(title: String, subtitle: String, capital: String, coordinate: CLLocationCoordinate2D) {
        self.title = title
        self.subtitle = subtitle
        self.coordinate = coordinate
        super.init()
    }
}
