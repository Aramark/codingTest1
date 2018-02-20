import Foundation
import RxSwift

class GetMatchingAnimalVMs: BaseUseCase {
    let animalRepository: AnimalRepository = AppDelegate.instance.animalRepository
    let filter: String
    let results = Variable<[AnimalViewModel]>([])
    
    init(filter: String) {
        self.filter = filter
    }
    
    func execute() -> Observable<Bool> {
        return Observable<Bool>.create { o in
            let filteredAnimals = self.animalRepository.getAll().map({$0.name}).filter({ $0 == self.filter }).map({AnimalViewModel(name: $0)})
            self.results.value = filteredAnimals
            o.onNext(true)
            o.onCompleted()
            return Disposables.create()
        }
    }
}
