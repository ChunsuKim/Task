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

  }
  

  // MARK: - Get, Post, Delete
  
  @IBAction func requestGet(_ sender: Any) {
    print("\n---------- [ Get Method ] ----------\n")
    let todoEndpoint = "https://jsonplaceholder.typicode.com/todos/1"
  }
  
  
  @IBAction func requestPost(_ sender: Any) {
    print("\n---------- [ Post Method ] ----------\n")
    let todoEndpoint = "https://jsonplaceholder.typicode.com/todos"
  }
  
  
  @IBAction func requestDelete(_ sender: Any) {
    print("\n---------- [ Delete Method ] ----------\n")
    let todoEndpoint = "https://jsonplaceholder.typicode.com/todos/1"
  }
}

