//
//  Location.swift
//  Maps UIKit
//
//  Created by Cleo Howard on 8/26/25.
//


import Foundation
import CoreLocation

struct Location: Identifiable {
    let id = UUID()
    let coordinate: CLLocationCoordinate2D
}