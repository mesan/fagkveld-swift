import UIKit

class ViewController: UIViewController, UITableViewDataSource {

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

    //Oppgave 3b
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // TODO: implementer denne
        return 0
    }
    
    // Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
    // Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        // Hint: Du trenger noe som dette og må returnere cellen du lager
        // var cell = self.weatherTable.dequeueReusableCellWithIdentifier("cell") as UITableViewCell
        
        // Oppgave 3b) 4) fylle ut tekst i celle
        
        return UITableViewCell()
    }
}

