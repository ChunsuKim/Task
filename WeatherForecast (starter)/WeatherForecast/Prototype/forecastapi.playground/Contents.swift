import UIKit

struct Forecast: Codable {
    struct Weather: Codable {
        struct Forecast3Days: Codable {
            struct Fcst3Hour: Codable {
                struct Sky: Codable {
                    let code4hour: String
                    let name4hour: String
                    let code7hour: String
                    let name7hour: String
                    let code10hour: String
                    let name10hour: String
                    let code13hour: String
                    let name13hour: String
                    let code16hour: String
                    let name16hour: String
                    let code19hour: String
                    let name19hour: String
                    let code22hour: String
                    let name22hour: String
                    let code25hour: String
                    let name25hour: String
                    let code28hour: String
                    let name28hour: String
                    let code31hour: String
                    let name31hour: String
                    let code34hour: String
                    let name34hour: String
                    let code40hour: String
                    let name40hour: String
                    let code43hour: String
                    let name43hour: String
                    let code46hour: String
                    let name46hour: String
                    let code49hour: String
                    let name49hour: String
                    let code52hour: String
                    let name52hour: String
                    let code55hour: String
                    let name55hour: String
                    let code58hour: String
                    let name58hour: String
                    let code61hour: String
                    let name61hour: String
                    let code64hour: String
                    let name64hour: String
                    let code67hour: String
                    let name67hour: String
                }
                
                struct Temperature: Codable {
                    let temp4hour: String
                    let temp7hour: String
                    let temp10hour: String
                    let temp13hour: String
                    let temp16hour: String
                    let temp19hour: String
                    let temp22hour: String
                    let temp25hour: String
                    let temp28hour: String
                    let temp31hour: String
                    let temp34hour: String
                    let temp37hour: String
                    let temp40hour: String
                    let temp43hour: String
                    let temp46hour: String
                    let temp49hour: String
                    let temp52hour: String
                    let temp55hour: String
                    let temp58hour: String
                    let temp61hour: String
                    let temp64hour: String
                    let temp67hour: String
                }
                
                let sky: Sky
                let temperature: Temperature
            }
            
            let fcst3hour: Fcst3Hour
        }
        
        let forecast3days: [Forecast3Days]
    }
    
    struct Result: Codable {
        let code: Int
        let message: String
    }
    
    let weather: Weather
    let result: Result
}

let apiUrl = "https://api2.sktelecom.com/weather/forecast/3days?version=1&lat=37.498206&lon=127.02761&appKey=3bdcec28-436f-4a09-97c2-413ff2dd712e"

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
        let forecast = try decoder.decode(Forecast.self, from: data)
        
        forecast.result.code
        forecast.result.message
        
        forecast.weather.forecast3days.first?.fcst3hour.sky
        forecast.weather.forecast3days.first?.fcst3hour.temperature
    } catch {
        print(error)
    }
}

task.resume()

