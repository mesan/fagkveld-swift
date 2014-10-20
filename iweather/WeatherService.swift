import Foundation

// Oppgave 2b
class WeatherService {
    
    class func getWeather(/* callback: ((DittObjekt?) -> Void)! */) {
        
        var url : String = "http://api.openweathermap.org/data/2.5/forecast/daily?q=Oslo&mode=json&units=metric&cnt=1"
        var request : NSMutableURLRequest = NSMutableURLRequest()
        request.URL = NSURL(string: url)
        request.HTTPMethod = "GET"
        
        NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue(), completionHandler:{ (response:NSURLResponse!, data: NSData!, error: NSError!) -> Void in
            var error: AutoreleasingUnsafeMutablePointer<NSError?> = nil
            let jsonResult: NSDictionary! = NSJSONSerialization.JSONObjectWithData(data, options:NSJSONReadingOptions.MutableContainers, error: error) as? NSDictionary
            
            var weatherTuple = self.getWeatherTuple(jsonResult)
            // 2b Opprett en instans av ditt objekt utfra dataene i tuplet
            // Kall på callback-funksjonen med instansen av objektet

        })
    }
    
    class func getWeatherTuple(jsonResult: NSDictionary?) -> (date: NSDate?, tempMin: Double?, tempMax: Double?, weatherType: String?) {
        var weatherTuple: (date: NSDate?, tempMin: Double?, tempMax: Double?, weatherType: String?)
        
        // Bruk denne printen for å se på json-objektet
        println(jsonResult)
        
        if let result = jsonResult {
            if let list = result["list"] as? NSArray {
                if let weatherItem = list[0] as? NSDictionary {
                    if let unixDate = weatherItem["dt"] as? Double {
                        weatherTuple.date = NSDate(timeIntervalSince1970: unixDate)
                    }
                    // 2b 2 hent ut resten av infoen vi er interessert i og legg dem i tuplet
                    
                }
            }

        } else {
            println("Error")
            // couldn't load JSON, look at error
        }
        
        // Printer det ferdige tuplet
        println(weatherTuple)
        
        return weatherTuple
    }
}