import Foundation
import RxSwift

protocol BaseUseCase: class {
    func execute() -> Observable<Bool>
}
