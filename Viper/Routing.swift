import Foundation

import UIKit

class Routing {
    
    let vc:TableViewController = TableViewController()
    let presenter = Presenter()
    let interactor = Interactor()
    var navigationController: UINavigationController?
    
    init() {
        vc.presenter = presenter
        presenter.view = vc
        presenter.interactor = interactor
        presenter.routing = self
        interactor.presenter = presenter
        navigationController = UINavigationController(rootViewController: vc)
    }
    
    func openAddView() {
        let storyBoard:UIStoryboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let addVC:ViewController = storyBoard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        addVC.presenter = presenter
        
        vc.present(addVC, animated: true, completion: nil)
    }
}
