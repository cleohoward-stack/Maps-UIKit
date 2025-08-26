//
//  ClusterBubbleUIView.swift
//  Maps UIKit
//
//  Created by Cleo Howard on 8/26/25.
//


import UIKit

final class ClusterBubbleUIView: UIView {

    // MARK: - Init
    init(initials: [String]) {
        super.init(frame: .zero)
        backgroundColor = .clear
        setupBubble(initials: initials)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Layout

    private func setupBubble(initials: [String]) {
        // Container for bubble + triangle
        let stack = UIStackView()
        stack.axis = .vertical
        stack.alignment = .center
        stack.spacing = 0
        stack.translatesAutoresizingMaskIntoConstraints = false
        addSubview(stack)

        NSLayoutConstraint.activate([
            stack.topAnchor.constraint(equalTo: topAnchor),
            stack.bottomAnchor.constraint(equalTo: bottomAnchor),
            stack.leadingAnchor.constraint(greaterThanOrEqualTo: leadingAnchor),
            stack.trailingAnchor.constraint(lessThanOrEqualTo: trailingAnchor),
            stack.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])

        // Bubble
        let capsuleView = UIView()
        capsuleView.backgroundColor = .white
        capsuleView.layer.cornerRadius = 20
        capsuleView.layer.shadowColor = UIColor.black.cgColor
        capsuleView.layer.shadowOpacity = 0.1
        capsuleView.layer.shadowOffset = CGSize(width: 0, height: 1)
        capsuleView.layer.shadowRadius = 3
        capsuleView.translatesAutoresizingMaskIntoConstraints = false

        let avatarStack = UIStackView()
        avatarStack.axis = .horizontal
        avatarStack.spacing = 4
        avatarStack.alignment = .center
        avatarStack.translatesAutoresizingMaskIntoConstraints = false

        for initial in initials.prefix(3) {
            let label = makeInitialLabel(text: initial)
            avatarStack.addArrangedSubview(label)
        }

        if initials.count > 3 {
            let moreLabel = makeInitialLabel(text: "+\(initials.count - 3)")
            moreLabel.backgroundColor = UIColor.systemGray5
            avatarStack.addArrangedSubview(moreLabel)
        }

        capsuleView.addSubview(avatarStack)
        NSLayoutConstraint.activate([
            avatarStack.topAnchor.constraint(equalTo: capsuleView.topAnchor, constant: 8),
            avatarStack.bottomAnchor.constraint(equalTo: capsuleView.bottomAnchor, constant: -4),
            avatarStack.leadingAnchor.constraint(equalTo: capsuleView.leadingAnchor, constant: 10),
            avatarStack.trailingAnchor.constraint(equalTo: capsuleView.trailingAnchor, constant: -10)
        ])

        stack.addArrangedSubview(capsuleView)

        // Triangle
        let triangle = TriangleView()
        triangle.translatesAutoresizingMaskIntoConstraints = false
        triangle.backgroundColor = .clear
        triangle.widthAnchor.constraint(equalToConstant: 12).isActive = true
        triangle.heightAnchor.constraint(equalToConstant: 6).isActive = true

        stack.addArrangedSubview(triangle)
    }

    private func makeInitialLabel(text: String) -> UILabel {
        let label = UILabel()
        label.text = text
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 13, weight: .bold)
        label.textAlignment = .center
        label.backgroundColor = .white
        label.layer.borderColor = UIColor.gray.cgColor
        label.layer.borderWidth = 1
        label.layer.cornerRadius = 16
        label.layer.masksToBounds = true
        label.translatesAutoresizingMaskIntoConstraints = false
        label.widthAnchor.constraint(equalToConstant: 32).isActive = true
        label.heightAnchor.constraint(equalToConstant: 32).isActive = true
        return label
    }
}
