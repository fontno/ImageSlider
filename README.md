# ImageSlider

Swift package to easily add an ImageSlider to compare two images in your SwiftUI projects



https://github.com/user-attachments/assets/ce5ce5af-33e7-460d-be45-b9d2ff06a653



## Usage

```swift
import ImageSlider

struct ContentView: View {

    let lhs: UIImage = 'PATH TO YOUR UIIMAGE'
    let rhs: UIImage = 'PATH TO YOUR UIIMAGE'

    var body: some View {
        GeometryReader { geometryProxy in
          ImageSlider(lhs: lhs, rhs: rhs)
            .frame(width: geometryProxy.size.width, height: geometryProxy.size.width)
        }
    }
}
```

### Required parameters - init 
- `lhs` - The left hand `UIImage` to compare
- `rhs` - The right hand `UIImage` to compare

## Requirements

* iOS 17.0+ 

## Installation 

### [Swift Package Manager](https://swift.org/package-manager/)

```swift
dependencies: [
    .package(url: "https://github.com/fontno/ImageSlider.git")
]
```

## Hire Me

I am available to work on Swift projects. 

Contact me on github to talk.
