import Foundation

// Oppgave 2b
class WeatherService {
    
    class func getWeather(callback: ((Weather?) -> Void)!) {
        
        var url : String = "http://api.openweathermap.org/data/2.5/forecast/daily?q=Oslo&mode=json&units=metric&cnt=1"
        var request : NSMutableURLRequest = NSMutableURLRequest()
        request.URL = NSURL(string: url)
        request.HTTPMethod = "GET"
        
        NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue(), completionHandler:{ (response:NSURLResponse!, data: NSData!, error: NSError!) -> Void in
            var error: AutoreleasingUnsafeMutablePointer<NSError?> = nil
            let jsonResult: NSDictionary! = NSJSONSerialization.JSONObjectWithData(data, options:NSJSONReadingOptions.MutableContainers, error: error) as? NSDictionary
            
            var weatherType: String?
            var weatherTuple = self.getWeatherTuple(jsonResult)
            var weatherToday = Weather(weatherType: weatherTuple.weatherType, date: weatherTuple.date, tempMin: weatherTuple.tempMin, tempMax: weatherTuple.tempMax)
            callback(weatherToday)
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
}