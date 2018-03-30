import Foundation

class MockAnimalRepository: AnimalRepository {
    typealias DataModel = Animal
    
    override func write(model: Animal) {
        animals.append(model)
    }
    
    override func getAll() -> [Animal] {
        return animals
    }
}
