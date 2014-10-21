import Foundation

// Oppgave 2b
class WeatherService {
    
    // Oppgave 5
    class func getWeatherIcon(iconName: String) -> NSData {
        let url: NSURL =  NSURL.URLWithString("http://openweathermap.org/img/w/\(iconName).png")
        var err: NSError? = nil
        var imageData :NSData = NSData.dataWithContentsOfURL(url,options: NSDataReadingOptions.DataReadingMappedIfSafe, error: &err)
        
        return imageData
    }
    
    class func getWeather(callback: (([Weather]) -> Void)!) {
        
        // Oppgave 3a
        let url: String = "http://api.openweathermap.org/data/2.5/forecast/daily?q=Oslo&mode=json&units=metric&cnt=7"
        var request : NSMutableURLRequest = NSMutableURLRequest()
        request.URL = NSURL(string: url)
        request.HTTPMethod = "GET"
        
        NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue(), completionHandler:{ (response:NSURLResponse!, data: NSData!, error: NSError!) -> Void in
            var error: AutoreleasingUnsafeMutablePointer<NSError?> = nil
            let jsonResult: NSDictionary! = NSJSONSerialization.JSONObjectWithData(data, options:NSJSONReadingOptions.MutableContainers, error: error) as? NSDictionary
            
            var weatherType: String?
            var weatherArray = self.getWeatherArray(jsonResult)
            
            callback(weatherArray)
        })
    }
    
    class func getWeatherTuple(jsonResult: NSDictionary?) -> (date: NSDate?, tempMin: Double?, tempMax: Double?, weatherType: String?) {
        var weatherTuple: (date: NSDate?, tempMin: Double?, tempMax: Double?, weatherType: String?)
        if let result = jsonResult {
            if let list = result["list"] as? NSArray {
                if let weatherItem = list[0] as? NSDictionary {
                    if let unixDate = weatherItem["dt"] as? Double {
                        weatherTuple.date = NSDate(timeIntervalSince1970: unixDate)
                    }
                    if let temp = weatherItem["temp"] as? NSDictionary {
                        weatherTuple.tempMin = temp["min"] as? Double
                        weatherTuple.tempMax = temp["max"] as? Double
                    }
                    if let weatherList = weatherItem["weather"] as? NSArray {
                        if let weather = weatherList[0] as? NSDictionary {
                            weatherTuple.weatherType = weather["main"] as? String
                        }
                    }
                }
            }
            
        } else {
            println("Error")
            // couldn't load JSON, look at error
        }
        println(weatherTuple)
        return weatherTuple
    }
    
    // Bruk denne i oppgave 3a
    class func getWeatherArray(jsonResult: NSDictionary?) -> [Weather] {
        var weatherArray: [Weather] = []
        if let result = jsonResult {
            if let list = result["list"] as? NSArray {
                for item in list {
                    var weatherTuple: (date: NSDate?, tempMin: Double?, tempMax: Double?, weatherType: String?, iconName: String?)
                    
                    if let weatherItem = item as? NSDictionary {
                        if let unixDate = weatherItem["dt"] as? Double {
                            weatherTuple.date = NSDate(timeIntervalSince1970: unixDate)
                        }
                        if let temp = weatherItem["temp"] as? NSDictionary {
                            weatherTuple.tempMin = temp["min"] as? Double
                            weatherTuple.tempMax = temp["max"] as? Double
                        }
                        if let weatherList = weatherItem["weather"] as? NSArray {
                            if let weather = weatherList[0] as? NSDictionary {
                                weatherTuple.weatherType = weather["main"] as? String
                                weatherTuple.iconName = weather["icon"] as? String
                            }
                        }
                    }
                    
                    weatherArray.append(Weather(weatherType: weatherTuple.weatherType, date: weatherTuple.date, tempMin: weatherTuple.tempMin, tempMax: weatherTuple.tempMax, iconName: weatherTuple.iconName))
                }
            }

        } else {
            println("Error")
            // couldn't load JSON, look at error
        }
        
        for weather in weatherArray {
            println(weather.description())
        }
        
            
        return weatherArray
    }
}