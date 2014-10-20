import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    
    // Oppgave 3a
    func callback(weather: Weather?) {
        NSOperationQueue.mainQueue().addOperationWithBlock {
            if let weatherToday = weather {
                var dateFormatter = NSDateFormatter()
                dateFormatter.dateFormat = "yyyy-MM-dd"
                self.nameLabel.text = "\(dateFormatter.stringFromDate(weatherToday.date!)) - \(weatherToday.weatherType!) - \(weatherToday.tempMax!) C / \(weatherToday.tempMin!) C"
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Oppgave 1
        let name = "Taylor Swift"
        nameLabel.text = "Hello, \(name)!"
        
        // Oppgave 2b
        WeatherService.getWeather(callback)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

