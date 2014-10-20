import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    
    // Oppgave 2c
    func callback(/* Ditt objekt her */) {
        // GUI bør/må oppdateres via main-tråden
        NSOperationQueue.mainQueue().addOperationWithBlock {

        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Oppgave 1
        let name = "Taylor Swift"
        nameLabel.text = "Hello, \(name)!"
        
        // Oppgave 2b - kall på værtjenesten
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

