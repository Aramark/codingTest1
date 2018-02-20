import Foundation

protocol BaseRepository: class {
    associatedtype DataModel
    func write(model: DataModel)
    func getAll() -> [DataModel]
}
