//
//  DataSource.swift
//  DiscoMap
//
//  Created by mobapp12 on 15/01/2020.
//  Copyright © 2020 H3AR7B3A7. All rights reserved.
//

import Foundation
import MapKit

class DataSource{
    
    var items:[PointOfInterest]
    
    init(){
        items = [PointOfInterest]()
        
        let pinVersuz = PointOfInterest.init(coordinate: CLLocationCoordinate2DMake(50.932557, 5.364098), title: "Versuz", subtitle: "Discotheek")
        items.append(pinVersuz)
        let pinCarre = PointOfInterest.init(coordinate: CLLocationCoordinate2DMake(51.028910, 4.324873), title: "Carré", subtitle: "Discotheek")
        items.append(pinCarre)
        let pinRio = PointOfInterest.init(coordinate: CLLocationCoordinate2DMake(51.070540, 4.531115), title: "Rio Club", subtitle: "Discotheek")
        items.append(pinRio)
        let pinRoxy = PointOfInterest.init(coordinate: CLLocationCoordinate2DMake(51.233712, 4.403313), title: "Roxy", subtitle: "Discotheek")
        items.append(pinRoxy)
        let pinVilla = PointOfInterest.init(coordinate: CLLocationCoordinate2DMake(51.238447, 4.409253), title: "The Villa", subtitle: "Discotheek")
        items.append(pinVilla)
        let pinSB = PointOfInterest.init(coordinate: CLLocationCoordinate2DMake(51.234808, 4.417902), title: "Soulboat", subtitle: "Discotheek")
        items.append(pinSB)
        
    }
}
