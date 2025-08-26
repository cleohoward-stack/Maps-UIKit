//
//  AvatarPinView.swift
//  Maps UIKit
//
//  Created by Cleo Howard on 8/26/25.
//


import MapKit
import UIKit

class AvatarPinView: MKAnnotationView {
    private var pulsatingView: PulsatingAvatarView?
    
    override var annotation: MKAnnotation? {
        willSet {
            // Remove old view if reusing annotation
            pulsatingView?.removeFromSuperview()
        }
    }
    
    override func didMoveToSuperview() {
        super.didMoveToSuperview()
        setupView()
    }
    
    private func setupView() {
        let pulse = PulsatingAvatarView()
        pulse.color = .systemBlue
        pulse.emoji = "👶"
        pulse.pulseSize = 44
        pulse.iconSize = 24
        
        pulse.translatesAutoresizingMaskIntoConstraints = false
        addSubview(pulse)
        
        NSLayoutConstraint.activate([
            pulse.centerXAnchor.constraint(equalTo: centerXAnchor),
            pulse.centerYAnchor.constraint(equalTo: centerYAnchor),
            pulse.widthAnchor.constraint(equalToConstant: 60),
            pulse.heightAnchor.constraint(equalToConstant: 60)
        ])
        
        frame = CGRect(x: 0, y: 0, width: 60, height: 60)
        centerOffset = CGPoint(x: 0, y: -30)
        
        pulsatingView = pulse
    }
}
