import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var weatherIcon: UIImageView!
    
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    var weather: Weather!
    
    private let transitionManager = TransitionManager()
    
    @IBOutlet weak var btnClose: UIButton!
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
        
        btnClose.layer.borderWidth = 2
        btnClose.layer.borderColor = btnClose.titleColorForState(UIControlState.Normal)?.CGColor
        btnClose.layer.cornerRadius = btnClose.frame.width/2
        
        self.transitioningDelegate = transitionManager
    }
}
