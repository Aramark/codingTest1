import Foundation

class AnimalRepository: BaseRepository {
    typealias DataModel = Animal
    
    var animals: [Animal] = []
    
    func write(model: Animal) {
        animals.append(model)
    }
    
    func getAll() -> [Animal] {
        return animals
    }
}
