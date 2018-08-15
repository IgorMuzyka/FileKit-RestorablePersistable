
import FileKit

public typealias RestorablePersistable = Restorable & Persistable

public protocol Restorable: Readable {}

public protocol Persistable: ReadableWritable {

    static var fileExtension: String { get }
    var fileName: String { get }
}

extension Restorable {

    public static func restore(from path: Path) throws -> Self {
        return try Self.read(from: path)
    }
}

extension Persistable {

    @discardableResult
    public func persist(to directory: Path, override shouldOverride: Bool = true) throws -> File<Self> {
        let path = directory + (fileName + Self.fileExtension)
        let file = File<Self>(path: path)
        if file.exists && shouldOverride { try file.delete() }
        try file.create()
        try write(to: file.path)
        return file
    }
}

extension File where DataType: Restorable & Codable {

    public func restore() throws -> DataType {
        return try DataType.restore(from: path)
    }
}

extension Readable where Self: Codable & Restorable {

    public static func read(from path: Path) throws -> Self {
        let data = try Data.read(from: path)
        return try FileKit.jsonDecoder.decode(Self.self, from: data)
    }
}

extension Writable where Self: Codable & Persistable {

    public func write(to path: Path, atomically useAuxiliaryFile: Bool) throws {
        let data = try FileKit.jsonEncoder.encode(self)
        try data.write(to: path, atomically: useAuxiliaryFile)
    }
}

