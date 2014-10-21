import UIKit

// Oppgave 3b)
class ViewController: UIViewController, UITableViewDataSource {

    @IBOutlet weak var searchField: UITextField!
    @IBOutlet weak var weatherTable: UITableView!
    @IBOutlet weak var searchButton: UIButton!
    
    var weatherArray: [Weather] = []
    
    // Oppgave 3b
    func callback(weatherArray: [Weather]) {
        self.weatherArray = weatherArray
        
        NSOperationQueue.mainQueue().addOperationWithBlock {
            self.weatherTable.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Oppgave 2b (endret i 6)
        WeatherService.getWeather("Oslo", callback: callback)
        
        // Oppgave 3b) 3) sett datasource
        self.weatherTable.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Oppgave 3b
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return weatherArray.count;
    }
    
    // Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
    // Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = self.weatherTable.dequeueReusableCellWithIdentifier("cell") as UITableViewCell
        
        // Oppgave 3b) 4) fylle ut tekst i celle
        let weather = weatherArray[indexPath.row]
        cell.textLabel?.text = weather.description()
        
        return cell
    }
    
    // Oppgave 5
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if segue.identifier == "detailSegue" {
            let indexPath = self.weatherTable.indexPathForSelectedRow()
            let detailViewController = segue.destinationViewController as DetailViewController
            detailViewController.weather = weatherArray[indexPath!.row]
        }
    }
    
    // Oppgave 6
    @IBAction func performSearch(sender: AnyObject) {
        weatherArray = []
        self.weatherTable.reloadData()
        WeatherService.getWeather(searchField.text, callback: callback)
        self.searchField.resignFirstResponder()
        self.searchField.text = ""
    }

}

