//
//  PulsatingAvatarView.swift
//  Maps UIKit
//
//  Created by Cleo Howard on 8/26/25.
//


import UIKit

class PulsatingAvatarView: UIView {

    private let pulseLayer = CAShapeLayer()
    private let avatarCircle = UIView()
    private let emojiLabel = UILabel()

    var color: UIColor = .systemBlue {
        didSet {
            updateColors()
        }
    }

    var emoji: String = "👶" {
        didSet {
            emojiLabel.text = emoji
        }
    }

    var pulseSize: CGFloat = 44 {
        didSet {
            layoutSubviews()
        }
    }

    var iconSize: CGFloat = 24 {
        didSet {
            layoutSubviews()
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        startAnimation()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
        startAnimation()
    }

    private func setupView() {
        // Pulse Layer (uses shape layer for smooth animation)
        layer.insertSublayer(pulseLayer, at: 0)
        pulseLayer.fillColor = UIColor.clear.cgColor
        pulseLayer.strokeColor = color.withAlphaComponent(0.6).cgColor
        pulseLayer.lineWidth = 2

        // Avatar Circle
        avatarCircle.backgroundColor = color
        avatarCircle.layer.cornerRadius = iconSize / 2
        avatarCircle.layer.masksToBounds = true
        addSubview(avatarCircle)

        // Emoji Label
        emojiLabel.font = UIFont.systemFont(ofSize: 14)
        emojiLabel.textAlignment = .center
        emojiLabel.text = emoji
        emojiLabel.translatesAutoresizingMaskIntoConstraints = false
        avatarCircle.addSubview(emojiLabel)
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        let centerPoint = CGPoint(x: bounds.midX, y: bounds.midY)

        // Pulse layer
        let pulseRect = CGRect(
            x: centerPoint.x - pulseSize / 2,
            y: centerPoint.y - pulseSize / 2,
            width: pulseSize,
            height: pulseSize
        )
        pulseLayer.path = UIBezierPath(ovalIn: pulseRect).cgPath
        pulseLayer.position = .zero

        // Avatar circle
        avatarCircle.frame = CGRect(
            x: centerPoint.x - iconSize / 2,
            y: centerPoint.y - iconSize / 2,
            width: iconSize,
            height: iconSize
        )
        avatarCircle.layer.cornerRadius = iconSize / 2

        // Emoji
        emojiLabel.frame = avatarCircle.bounds
    }

    private func updateColors() {
        pulseLayer.strokeColor = color.withAlphaComponent(0.6).cgColor
        avatarCircle.backgroundColor = color
    }

    private func startAnimation() {
        let animation = CABasicAnimation(keyPath: "transform.scale")
        animation.fromValue = 1.0
        animation.toValue = 1.6
        animation.duration = 1.5
        animation.repeatCount = .infinity
        animation.autoreverses = false
        animation.timingFunction = CAMediaTimingFunction(name: .easeOut)

        let opacityAnimation = CABasicAnimation(keyPath: "opacity")
        opacityAnimation.fromValue = 0.6
        opacityAnimation.toValue = 0.0
        opacityAnimation.duration = 1.5
        opacityAnimation.repeatCount = .infinity
        opacityAnimation.autoreverses = false
        opacityAnimation.timingFunction = CAMediaTimingFunction(name: .easeOut)

        pulseLayer.add(animation, forKey: "scale")
        pulseLayer.add(opacityAnimation, forKey: "opacity")
    }
}