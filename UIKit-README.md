# MapKit Clustering – UIKit Edition

A fully programmatic UIKit-based implementation of MapKit clustering, matching custom UI specs from a Figma design. This project showcases how to build a modern Apple Maps experience without Storyboards or SwiftUI, using `MKMapView`, `MKAnnotationView`, and custom UIKit components.

**Target:** iOS 17+ · Xcode 15+ · Swift 5.9+

---
/var/folders/db/ds5kfr995ps4f1fd8k2g4_yr0000gn/T/TemporaryItems/NSIRD_screencaptureui_Opm5Qj/Screenshot 2025-08-26 at 12.17.50 PM.png

## 🚀 Features

- ✅ 100% UIKit, no Storyboards or SwiftUI
- ✅ Custom `MKAnnotationView` pins with avatars
- ✅ Custom `MKClusterAnnotationView` bubbles using overlapping initials
- ✅ Capsule-style cluster UI with triangle pointer
- ✅ Cluster tap-to-zoom behavior
- ✅ Scalable structure for live location or BLE integration

---

## 🧱 Project Structure

### `AppDelegate.swift` & `SceneDelegate.swift`
Standard programmatic app setup. No Storyboards involved.

### `ViewController.swift`
- Hosts the `MKMapView`
- Generates sample map points via `LocationGenerator`
- Configures annotation views and clustering behavior

### `Location.swift`
Basic model holding a UUID and a `CLLocationCoordinate2D`.

### `LocationGenerator.swift`
Deterministic/randomized generator for development testing.

---

## 🧩 Custom Views

### `AvatarPinView.swift`
- Subclass of `MKAnnotationView`
- Renders a circular emoji or placeholder image
- Fully reusable for avatar-style map pins

### `ClusterBubbleUIView.swift`
- Subclass of `UIView`
- Horizontally stacked initials (max 3 + `+N`)
- Capsule background with drop shadow

### `TriangleView.swift`
- Subclass of `UIView`
- Custom `draw(_:)` method to create a downward-pointing triangle
- Used as a tail beneath cluster bubbles

### `ClusterBubbleAnnotationView.swift`
- Subclass of `MKAnnotationView`
- Embeds `ClusterBubbleUIView` for Figma-style visual clustering

---

## 💡 Design Inspiration

This UI is inspired by Apple’s Find My app:
- Overlapping avatars (or initials) inside a capsule
- Clean cluster representation instead of default blue bubbles
- Downward arrow indicating pin location

---

## 🛠 How It Works

1. `ViewController` registers `AvatarPinView` and `ClusterBubbleAnnotationView`
2. Pins use `AvatarPinView`
3. Clusters use `ClusterBubbleAnnotationView` which embeds `ClusterBubbleUIView`
4. Custom layout is handled entirely in code — no Storyboards, no Interface Builder

---

## 🧪 Running the Project

1. Open in **Xcode 15+**
2. Run on an **iOS 17+ simulator**
3. Pan and zoom around the Las Vegas region
4. Tap cluster bubbles to zoom in

> Change the number of annotations here:

```swift
LocationGenerator.generate(center: ..., count: 100)
```

---

## 🧭 Roadmap

- [ ] Add image-based avatars
- [ ] Add BLE or CoreLocation for live pins
- [ ] Animate cluster bubble entry
- [ ] Add tap/callout on clusters
- [ ] UI test cluster tap behaviors

---

## 🤝 Contributing

- Keep everything UIKit-based
- Avoid Storyboards
- Prefer `UIView` composition over external libraries
- Follow Apple’s MapKit conventions for annotation reuse and clustering

---
