import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController, UITableViewDelegate {
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var searchField: UITextField!
    
    @IBAction func searchTapped(_ sender: Any) {
        let filteredVMsUseCase = GetMatchingAnimalVMs(filter: searchField.text ?? "")
        
        filteredVMsUseCase.execute().subscribe(onNext: { (success) in
            if success {
                filteredVMsUseCase.results.asObservable().bind(to: self.tableView.rx.items(cellIdentifier: "Cell", cellType: UITableViewCell.self)) { (row, element, cell) in
                    cell.textLabel?.text = element.animalName
                }
            }
        })
    }
    
    override func viewDidLoad() {
        LoadAnimalNames().execute().subscribe(onNext: { (success) in
            print("Finished downloading animal names")
        })
    }
    
}

