import UIKit

struct WeatherSummary: Codable {
    struct Weather: Codable {
        struct Minutely: Codable {
            struct Sky: Codable {
                let code: String
                let name: String
            }
            
            struct Temperature: Codable {
                let tc: String
                let tmax: String
                let tmin: String
            }
            
            let sky: Sky
            let temperature: Temperature
        }
        
        let minutely: [Minutely]
    }
    
    struct Result: Codable {
        let code: Int
        let message: String
    }
    
    let weather: Weather
    let result: Result
}

let apiUrl = "https://api2.sktelecom.com/weather/current/minutely?version=1&lat=37.498206&lon=127.02761&appKey=3bdcec28-436f-4a09-97c2-413ff2dd712e"

let url = URL(string: apiUrl)!

let session = URLSession.shared

let task = session.dataTask(with: url) { (data, response, error) in
    if let error = error {
        print(error)
        return
    }
    
    guard let httpResponse = response as? HTTPURLResponse else {
        print("Invalid response")
        return
    }
    
    guard (200...299).contains(httpResponse.statusCode) else {
        print(httpResponse.statusCode)
        return
    }
    
    guard let data = data else {
        fatalError("Invalid Data")
    }
    
    do {
        let decoder = JSONDecoder()
        let summary = try decoder.decode(WeatherSummary.self, from: data)
        
        summary.result.code
        summary.result.message
        
        summary.weather.minutely.first?.sky.code
        summary.weather.minutely.first?.sky.name
        
        summary.weather.minutely.first?.temperature.tc
        summary.weather.minutely.first?.temperature.tmax
        summary.weather.minutely.first?.temperature.tmin
    } catch {
        print(error)
    }
}

task.resume()
