//
//  TriangleView.swift
//  Maps UIKit
//
//  Created by Cleo Howard on 8/26/25.
//


import UIKit

final class TriangleView: UIView {
    override func draw(_ rect: CGRect) {
        guard let ctx = UIGraphicsGetCurrentContext() else { return }

        ctx.beginPath()
        ctx.move(to: CGPoint(x: rect.midX, y: rect.maxY)) // bottom center
        ctx.addLine(to: CGPoint(x: rect.maxX, y: rect.minY)) // top right
        ctx.addLine(to: CGPoint(x: rect.minX, y: rect.minY)) // top left
        ctx.closePath()

        ctx.setFillColor(UIColor.white.cgColor)
        ctx.setShadow(offset: CGSize(width: 0, height: 1), blur: 1, color: UIColor.black.withAlphaComponent(0.1).cgColor)
        ctx.fillPath()
    }
}