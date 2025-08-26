//
//  ClusterBubbleAnnotationView.swift
//  Maps UIKit
//
//  Created by Cleo Howard on 8/26/25.
//

import MapKit

class ClusterBubbleAnnotationView: MKAnnotationView {
    private var bubbleView: UIView?
    
    override var annotation: MKAnnotation? {
        willSet {
            bubbleView?.removeFromSuperview()
        }
        
        didSet {
            guard let cluster = annotation as? MKClusterAnnotation else { return }
            
            let initials = cluster.memberAnnotations.compactMap {
                ($0.title ?? "")?.prefix(1).uppercased()
            }
            
            let clusterBubble = ClusterBubbleUIView(initials: initials)
            let pulsating = PulsatingAvatarView()
            pulsating.iconSize = 44  // or calculate based on content
            pulsating.pulseSize = 60
            pulsating.emoji = ""
            pulsating.color = .systemBlue
            
            pulsating.addSubview(clusterBubble)
            clusterBubble.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                clusterBubble.centerXAnchor.constraint(equalTo: pulsating.centerXAnchor),
                clusterBubble.centerYAnchor.constraint(equalTo: pulsating.centerYAnchor)
            ])
            
            addSubview(pulsating)
            pulsating.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                pulsating.centerXAnchor.constraint(equalTo: centerXAnchor),
                pulsating.bottomAnchor.constraint(equalTo: bottomAnchor)
            ])
            
            bubbleView = pulsating
        }
    }
}
