import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var weatherIcon: UIImageView!
    
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    var weather: Weather!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Oppgave 5
        println(weather.description())
        if let iconName = weather.iconName {
            
            var iconImage = UIImage(data: WeatherService.getWeatherIcon(iconName))
            weatherIcon.image = iconImage
        }
        var dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        dateLabel.text = dateFormatter.stringFromDate(weather.date!)
        
        temperatureLabel.text = "\(weather.weatherType!)\nMax: \(weather.tempMax!) C\nMin: \(weather.tempMin!) C"
    }
}
