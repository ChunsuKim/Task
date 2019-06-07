//
//  ViewController.swift
//  URLSessionExample
//
//  Created by giftbot on 2019. 6. 6..
//  Copyright © 2019년 giftbot. All rights reserved.
//

import UIKit

final class ViewController: UIViewController {
  
  @IBOutlet private weak var imageView: UIImageView!
  private let imageUrlStr = "https://loremflickr.com/860/640/cat"
  
  
  // MARK: - Sync method
  
  @IBAction private func syncMethod() {
    print("\n---------- [ syncMethod ] ----------\n")
    let url = URL(string: imageUrlStr)!
    
    // sync(동기) async(비동기)
    // 동기: 호출한 메서드가 종료될 때까지 기다렸다가 다음 작업 수행
    // 비동기: 메서드를 호출만 하고 완료를 기다리지 않고 다음 작업 수행
//    if let data = try? Data(contentsOf: url) {
//        imageView.image = UIImage(data: data)
//    }
    
    // 동기이지만 비동기처럼 처리하는 방법
    DispatchQueue.global().async {
        if let data = try? Data(contentsOf: url) {
            DispatchQueue.main.async {
                self.imageView.image = UIImage(data: data)
            }
        }
    }
  }
  
  
  // MARK: - URLComponents
  
  @IBAction private func urlComponentsExample(_ sender: Any) {
    print("\n---------- [ urlComponentsExample ] ----------\n")
    /***************************************************
     http://username:password@www.example.com:80/index.html?key1=value1&key2=value2#frag
     ***************************************************/
    
    var components = URLComponents()
    components.scheme = "http"
    print(components)
    components.user = "username"
    print(components)
    components.password = "password"
    print(components)
    components.host = "www.example.com"
    print(components)
    components.port = 80
    print(components)
    components.path = "/index.html"
    print(components)
    components.query = "key1=value1&key2=value2"
    print(components)
    components.fragment = "frag"
    print(components)
    
    components.queryItems = [
        URLQueryItem(name: "key1", value: "value1"),
        URLQueryItem(name: "key2", value: "value2")]
    print(components)
    
//    var comp = URLComponents(string: "http://username:password@www.example.com:80/index.html?key1=value1&key2=value2#frag")
//    comp?.fragment = "myFragment"
//    print(comp)

  }
  
  
  // MARK: - URL Encoding Example
  
  @IBAction private func urlEncodingExample() {
    print("\n---------- [ urlEncodingExample ] ----------\n")
    
    // 영어 주소
    let urlStringE = "https://search.naver.com/search.naver?query=swift"
    if let url = URL(string: urlStringE) {
        print(url)
    } else {
        print("nil")
    }
    
    // 한글 주소
    let urlStringK = "https://search.naver.com/search.naver?query=한글"
    if let url = URL(string: urlStringK) {
        print(url)
    } else {
        print("nil")
    }
    
    // Query 변환
    let str = "https://search.naver.com/search.naver?query=한글"
//    let str = "한글"
    let queryEncodedStr = str.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
    let convertedURL = URL(string: queryEncodedStr)!
    print(convertedURL)
    
    let originalString = "color-#708090"
    var allowed = CharacterSet.urlFragmentAllowed
    allowed.insert("#")
    let encodedString = originalString.addingPercentEncoding(withAllowedCharacters: .urlFragmentAllowed)
    print(encodedString)    // "color-%23708090"
    
    //
    let encodedUrlString = "https://example.com/#color-%23708090"
    let url = URL(string: encodedUrlString)!
    let components = URLComponents(url: url, resolvingAgainstBaseURL: true)!
    let fragment = components.fragment!
    print(fragment) // "color-#708090"
  }
  
  
  
  // MARK: - Session Configuration
  
  @IBAction private func sessionConfig(_ sender: Any) {
    print("\n---------- [ Session Configuration ] ----------\n")
    
    _ = URLSession.shared
    _ = URLSessionConfiguration.default
    _ = URLSessionConfiguration.ephemeral
    _ = URLSessionConfiguration.background(withIdentifier: "backgroundID")
    
    let sessionConfig = URLSessionConfiguration.default
    sessionConfig.allowsCellularAccess = false  // default = true. Wi-fi만 가능하도록 할 때는 false
    sessionConfig.httpMaximumConnectionsPerHost = 5 // default = 4
    sessionConfig.timeoutIntervalForRequest = 20    // default = 60 sec
    sessionConfig.requestCachePolicy = .reloadIgnoringLocalCacheData    // default = .useProtocolCachePolicy
    sessionConfig.waitsForConnectivity = true   // default = false 네트워크 연결관련
    
    // 16 KB (16 * 1024 = 16384), 256 MB (256 * 1024 * 1024 = 268435456)
    let myCache = URLCache(memoryCapacity: 16_384, diskCapacity: 268_435_456, diskPath: nil)
    sessionConfig.urlCache = myCache
    
//    FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask)[0]
    let cache = URLCache.shared
    sessionConfig.urlCache = cache
    print(cache.diskCapacity)
    print(cache.currentDiskUsage)
    
//    cache.removeAllCachedResponses()    // total cache delete
    
    let mySession = URLSession(configuration: sessionConfig)
    let url = URL(string: imageUrlStr)!
    let task = mySession.dataTask(with: url) { [weak self] (data, response, error) in
        guard let data = data else { return }
        DispatchQueue.main.async {
            self?.imageView.image = UIImage(data: data)!
            print("download completed")
        }
    }
    task.resume()
  }
  

  // MARK: - Get, Post, Delete
  
  @IBAction func requestGet(_ sender: Any) {
    print("\n---------- [ Get Method ] ----------\n")
    let todoEndpoint = "https://jsonplaceholder.typicode.com/todos/1"
    
    let url = URL(string: todoEndpoint)!
    
    let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
        guard error == nil else { return print(error!.localizedDescription) }
        // client Error
        guard let response = response as? HTTPURLResponse,
            (200..<300).contains(response.statusCode),
            response.mimeType == "application/json"
            else { return } // server Error
        guard let data = data else {
            return print("Error: did not receive data")
        }
        guard let todo = try? JSONSerialization.jsonObject(with: data) as? [String: Any],
            let todoId = todo["id"] as? Int,
            let todoTitle = todo["title"] as? String
            else { return print("Could not get parsed data") }
        print("ID :", todoId)
        print("Title :", todoTitle)
    }
    task.resume()
  }
  
  
  @IBAction func requestPost(_ sender: Any) {
    print("\n---------- [ Post Method ] ----------\n")
    let todoEndpoint = "https://jsonplaceholder.typicode.com/todos"
    guard let url = URL(string: todoEndpoint) else {
        return print("Error: cannot create URL")
    }
    
    let newTodo: [String: Any] = [
        "userId": 1,
        "title": "My First todo",
        "completed": false,
    ]
    guard let encodedTodo = try? JSONSerialization.data(withJSONObject: newTodo) else { return }
    
    var urlRequest = URLRequest(url: url)
    urlRequest.httpMethod = "POST"
    urlRequest.httpBody = encodedTodo
    
    let task = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
        guard error == nil else { return print(error?.localizedDescription) }
        guard let data = data else { return print("Error: did not receive data") }
        
        guard let receivedTodo = try? JSONSerialization.jsonObject(with: data) as? [String: Any] else { return print("Could not get parsed data")}
        
        print(receivedTodo)
    }
    task.resume()
  }
  
  
  @IBAction func requestDelete(_ sender: Any) {
    print("\n---------- [ Delete Method ] ----------\n")
    let todoEndpoint = "https://jsonplaceholder.typicode.com/todos/1"
    
    let url = URL(string: todoEndpoint)!
    var urlRequest = URLRequest(url: url)
    urlRequest.httpMethod = "DELETE"
    
    let task = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
        guard error == nil else { return print(error!) }
        guard let response = response as? HTTPURLResponse,
            200..<300 ~= response.statusCode else { return }
        
        
        guard let _ = data else { return print("Error: did not receive data")}
        print(response.statusCode)   // 200 OK
        print("DELETE ok")
    }
    task.resume()
  }
}

