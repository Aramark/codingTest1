import Foundation
import RxSwift

class LoadAnimalNames: BaseUseCase {
     lazy var animalRepository: AnimalRepository = AppDelegate.instance.animalRepository
    
    func execute() -> Observable<Bool> {
        return Observable<Bool>.create { o in
            let fileReader = FileReader()
            if let url = Bundle.main.url(forResource: "Animals", withExtension: "txt") {
                do {
                    let animals = try fileReader.Read(url: url)
                    for animalName in animals {
                        let model = Animal(name: animalName)
                        self.animalRepository.write(model: model)
                    }
                } catch {
                    o.onNext(false)
                    o.onError(error)
                }
                o.onNext(true)
                o.onCompleted()
            }
            return Disposables.create()
        }
    }
}
