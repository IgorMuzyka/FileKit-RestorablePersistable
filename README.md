## Restorable Persistable

Missing extra conveniences of FileKit.

## Installation

### Cocoapods
To install it, simply add the following line to your Podfile:

```ruby
pod 'FileKit'
pod 'FileKit-RestorablePersistable', :git => 'https://github.com/IgorMuzyka/FileKit-RestorablePersistable.git'
```

### Swift Package Manager
To install it add the following line to dependencies in your Package.swift file

```swift
.package(url: "https://github.com/IgorMuzyka/FileKit-RestorablePersistable", .branch("master"))
```

## Usage

*Conform* to `Codable`

```swift
struct Object: Codable {
    
    let id: String
}
```

And then *conform* to `RestorablePersistable`

```swift
import FileKit_RestorablePersistable

extension Object: RestorablePersistable {
    
    static let fileExtension: String = ".object"
    var fileName: String { return id }
}
```

Now you able to save this type to disk or load from there at any time as follows

```swift
let object = Object(id: "0")
let file = try! object.persist(to: .userDocuments) // save object to user documents
let objectFromFile = try! file.restore() // load object from file
let objectFromPath = try! Object.restore(from: file.path) // load object from path
```

## Author

Igor Muzyka, igormuzyka42@gmail.com

## License

RestorablePersistable is available under the MIT license. See the LICENSE file for more info.
