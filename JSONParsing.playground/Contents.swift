import UIKit

// Astronauts information
let astronauts = "http://api.open-notify.org/astros.json"
let apiURL = URL(string: astronauts)!

let dataTask = URLSession.shared.dataTask(with: apiURL) { (data, response, error) in
    guard error == nil else { return print(error!) }
    guard let response = response as? HTTPURLResponse,
        200..<400 ~= response.statusCode
        else { return print("StatusCode is not valid") }
    guard let data = data,
        let jsonObject = try? JSONSerialization.jsonObject(with: data) as? [String: Any]
    else { return print("No Data") }
    print("jsonObject :", jsonObject)
    
    guard (jsonObject["message"] as? String) == "success",
        let people = jsonObject["people"] as? [[String: String]],
        let peopleCount = jsonObject["number"] as? Int
        else { return print("Parsing Error") }
    
    print("\n------ Parsing results ------\n")
    print("Total \(peopleCount) astronauts are in space right now.\n")
    
    print("List of Astronauts names\n")
    people
        .compactMap { $0["name"] }
        .forEach { print($0) }
}

dataTask.resume()

// [ Practice 1 ] The International Space Station (ISS) information

func practice1() {
    let infomationOfISS = "http://api.open-notify.org/iss-now.json"
    let apiURL = URL(string: infomationOfISS)!
    
    let dataTask = URLSession.shared.dataTask(with: apiURL) { (data, response, error) in
        guard let data = data,
            let jsonObject = try? JSONSerialization.jsonObject(with: data) as? [String: Any]
            else { return print("No Data") }
        
        guard let coordinate = jsonObject["iss_position"] as? [String: String],
            let longitude = coordinate["longitude"],
            let latitude = coordinate["latitude"]
            else { return }
        
        print("\n------ Coordinate of ISS ------\n")
        print(latitude, longitude)
    }
    dataTask.resume()
}

practice1()

/*
 [ Practice 2 ]
 User 구조체 타입을 선언하고
 다음 Json 형식의 문자열을 User 타입으로 바꾸어 출력하기
 
 e.g.
 User(id: 1, firstName: "Robert", lastName: "Schwartz", email: "rob23@gmail.com")
 User(id: 2, firstName: "Lucy", lastName: "Ballmer", email: "lucyb56@gmail.com")
 User(id: 3, firstName: "Anna", lastName: "Smith", email: "annasmith23@gmail.com")
 */

let jsonString2 = """
{
"users": [
{
"id": 1,
"first_name": "Robert",
"last_name": "Schwartz",
"email": "rob23@gmail.com"
},
{
"id": 2,
"first_name": "Lucy",
"last_name": "Ballmer",
"email": "lucyb56@gmail.com"
},
{
"id": 3,
"first_name": "Anna",
"last_name": "Smith",
"email": "annasmith23@gmail.com"
},
]
}
"""

struct User {
    let id: Int
    let firstName: String
    let lastName: String
    let email: String
    
    init?(from json: [String: Any]) {
        guard let id = json["id"] as? Int,
            let firstName = json["first_name"] as? String,
            let lastName = json["last_name"] as? String,
            let email = json["email"] as? String
            else { print("Parsing error"); return nil }
        
        self.id = id
        self.firstName = firstName
        self.lastName = lastName
        self.email = email
    }
}

func practice2() {
    guard let jsonData = jsonString2.data(using: .utf8),
        let json = try? JSONSerialization.jsonObject(with: jsonData) as? [String: Any],
        let userList = json["users"] as? [[String: Any]]
        else { return }
    
    let users: [User] = userList.compactMap {
        guard let user = User(from: $0) else { return nil }
        return user
    }
    
    print("\n------ Users ------\n")
    users.forEach { print($0)}
}

practice2()

/*
 [ 실습3 ]
 Post 구조체 타입을 선언하고
 다음 주소를 통해 얻은 JSON 데이터를 파싱하여 Post 타입으로 변환한 후 전체 개수 출력하기
 "https://jsonplaceholder.typicode.com/posts"
 */

struct Post {
    let userId: Int
    let id: Int
    let title: String
    let body: String
}

func practice3() {
    let apiUrl = "https://jsonplaceholder.typicode.com/posts"
    let url = URL(string: apiUrl)!
    
    let dataTask = URLSession.shared.dataTask(with: url) { (data, response, error) in
        guard let data = data,
            let postList = try? JSONSerialization.jsonObject(with: data) as? [[String: Any]]
            else { return print("No Data")}
        
        var posts: [Post] = []
        for post in postList {
            guard let userId = post["userId"] as? Int,
                let id = post["id"] as? Int,
                let title = post["title"] as? String,
                let body = post["body"] as? String
                else { continue }
            let post = Post(userId: userId, id: id, title: title, body: body)
            posts.append(post)
        }
        
        print("\n------ Post ------\n")
        print("Total \(posts.count)")
    }
    dataTask.resume()
}

practice3()
