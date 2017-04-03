import Foundation

import UIKit

class Routing {
    
    let storyBoard:UIStoryboard = UIStoryboard(name: "Main", bundle: Bundle.main)
    let mainVC: MainViewController
    let presenter = Presenter()
    let interactor = Interactor()
    var navigationController: UINavigationController?
    
    init() {
        mainVC = storyBoard.instantiateViewController(withIdentifier: "MainViewController") as! MainViewController
    
        mainVC.presenter = presenter
        presenter.view = mainVC
        presenter.interactor = interactor
        presenter.routing = self
        interactor.presenter = presenter
        
        navigationController = UINavigationController(rootViewController: mainVC)
        
        presenter.onViewReady()
    }
    
    func openAddView() {
        let detailVC:ViewController = storyBoard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        detailVC.presenter = presenter
        
        mainVC.present(detailVC, animated: true, completion: nil)
    }
}
