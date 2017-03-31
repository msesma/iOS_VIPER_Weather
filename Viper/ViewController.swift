import UIKit

class ViewController: UIViewController {

    var presenter:Presenter?

    @IBOutlet weak var name: UITextField!
    
    @IBOutlet weak var surname: UITextField!

    @IBAction func add(_ sender: UIButton) {
        presenter?.addNewObjectWithData(name: self.name.text!, surname: self.surname.text!)
        
        self.presentingViewController?.dismiss(animated: true, completion:nil)
    }
    
    
    @IBAction func cancel(_ sender: UIButton) {
        self.presentingViewController?.dismiss(animated: true, completion: nil)
    }
}
