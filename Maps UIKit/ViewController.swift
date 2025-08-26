//
//  ViewController.swift
//  Maps UIKit
//
//  Created by Cleo Howard on 8/26/25.
//

import UIKit
import MapKit

class ViewController: UIViewController {
    private let mapView = MKMapView()
    private let regionCenter = CLLocationCoordinate2D(latitude: 36.1147, longitude: -115.1728) // Las Vegas
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupMap()
        addMockAnnotations()
    }
    
    private func setupMap() {
        mapView.frame = view.bounds
        mapView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.addSubview(mapView)
        
        mapView.delegate = self
        mapView.setRegion(MKCoordinateRegion(
            center: regionCenter,
            span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
        ), animated: false)
        
        mapView.register(AvatarPinView.self.self, forAnnotationViewWithReuseIdentifier: "pin")
        mapView.register(ClusterBubbleAnnotationView.self, forAnnotationViewWithReuseIdentifier: "cluster")
    }
    
    private func addMockAnnotations() {
        let locations = LocationGenerator.generate(center: regionCenter, count: 100)
        let annotations = locations.map { loc -> MKPointAnnotation in
            let annotation = MKPointAnnotation()
            annotation.coordinate = loc.coordinate
            annotation.title = loc.id.uuidString
            return annotation
        }
        mapView.addAnnotations(annotations)
    }
}

extension ViewController: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        if let cluster = annotation as? MKClusterAnnotation {
            let view = mapView.dequeueReusableAnnotationView(withIdentifier: "cluster", for: cluster) as! ClusterBubbleAnnotationView
            view.clusteringIdentifier = "kid"
            view.displayPriority = .defaultLow
            return view
        }
        
        let view = mapView.dequeueReusableAnnotationView(withIdentifier: "pin", for: annotation) as! AvatarPinView
        view.clusteringIdentifier = "kid"
        return view
    }
    
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        guard let cluster = view.annotation as? MKClusterAnnotation else { return }
        
        let zoomRegion = MKCoordinateRegion(
            center: cluster.coordinate,
            span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
        )
        mapView.setRegion(zoomRegion, animated: true)
    }
}
