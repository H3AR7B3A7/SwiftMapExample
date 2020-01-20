//
//  PointOfInterest.swift
//  DiscoMap
//
//  Created by mobapp12 on 15/01/2020.
//  Copyright © 2020 H3AR7B3A7. All rights reserved.
//

import Foundation
import MapKit

class PointOfInterest:NSObject, MKAnnotation{
    
    var coordinate: CLLocationCoordinate2D
    var title: String?
    var subtitle: String?
    
    init(coordinate: CLLocationCoordinate2D, title: String?, subtitle: String?) {
        self.coordinate = coordinate
        self.title = title
        self.subtitle = subtitle
    }
    
    
}
