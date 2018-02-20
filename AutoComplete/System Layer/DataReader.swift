import Foundation

protocol DataReader: class {
    func Read(url: URL) throws -> [String]
}
