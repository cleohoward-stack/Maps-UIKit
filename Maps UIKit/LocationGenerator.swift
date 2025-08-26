//
//  LocationGenerator.swift
//  Maps UIKit
//
//  Created by Cleo Howard on 8/26/25.
//


import CoreLocation

struct LocationGenerator {
    static func generate(center: CLLocationCoordinate2D, count: Int) -> [Location] {
        (0..<count).map { _ in
            let lat = center.latitude + Double.random(in: -0.01...0.01)
            let lon = center.longitude + Double.random(in: -0.01...0.01)
            return Location(coordinate: CLLocationCoordinate2D(latitude: lat, longitude: lon))
        }
    }
}