//
//  ItemManager.swift
//  DominoPizza
//
//  Created by Chunsu Kim on 29/04/2019.
//  Copyright © 2019 Chunsu Kim. All rights reserved.
//

import Foundation

struct ItemManager {
    
    static var shared = ItemManager()
    init(){}
    
    var countDict = [String:Int]()
    
    let categories: [String] = ["슈퍼시드", "프리미엄", "클래식", "사이드디시", "음료", "피클소스"]
    
    let items: [MenuList] = [
        Menu(title: "프리미엄", imageName: "더블크러스트 이베리코", count: 0, price: 10000),
        Menu(title: "프리미엄", imageName: "블랙앵거스 스테이크", count: 0, price: 10000),
        Menu(title: "프리미엄", imageName: "블랙타이거 슈림프", count: 0, price: 10000),
        Menu(title: "프리미엄", imageName: "와규 앤 비스테카", count: 0, price: 10000),
        Menu(title: "프리미엄", imageName: "직화 스테이크", count: 0, price: 10000),
        Menu(title: "프리미엄", imageName: "베이컨체더치즈", count: 0, price: 10000),
        Menu(title: "클래식", imageName: "불고기", count: 0, price: 10000),
        Menu(title: "클래식", imageName: "슈퍼디럭스", count: 0, price: 10000),
        Menu(title: "클래식", imageName: "슈퍼슈프림", count: 0, price: 10000),
        Menu(title: "클래식", imageName: "페페로니", count: 0, price: 10000),
        Menu(title: "클래식", imageName: "포테이토", count: 0, price: 10000),
        Menu(title: "슈퍼시드", imageName: "글램핑 바비큐", count: 0, price: 10000),
        Menu(title: "슈퍼시드", imageName: "알로하 하와이안", count: 0, price: 10000),
        Menu(title: "슈퍼시드", imageName: "우리 고구마", count: 0, price: 10000),
        Menu(title: "슈퍼시드", imageName: "콰트로 치즈 퐁듀", count: 0, price: 10000),
        Menu(title: "사이드디시", imageName: "딸기 슈크림", count: 0, price: 7000),
        Menu(title: "사이드디시", imageName: "슈퍼곡물 치킨", count: 0, price: 7000),
        Menu(title: "사이드디시", imageName: "애플 크러스트 디저트", count: 0, price: 7000),
        Menu(title: "사이드디시", imageName: "치킨퐁듀 그라탕", count: 0, price: 7000),
        Menu(title: "사이드디시", imageName: "퀴노아 치킨 샐러드", count: 0, price: 7000),
        Menu(title: "사이드디시", imageName: "포테이토 순살치킨", count: 0, price: 7000),
        Menu(title: "음료", imageName: "미닛메이드 스파클링 청포도", count: 0, price: 3000),
        Menu(title: "음료", imageName: "스프라이트", count: 0, price: 3000),
        Menu(title: "음료", imageName: "코카콜라 제로", count: 0, price: 3000),
        Menu(title: "음료", imageName: "코카콜라", count: 0, price: 3000),
        Menu(title: "피클소스", imageName: "갈릭 디핑 소스", count: 0, price: 500),
        Menu(title: "피클소스", imageName: "스위트 칠리소스", count: 0, price: 500),
        Menu(title: "피클소스", imageName: "우리 피클 L", count: 0, price: 500),
        Menu(title: "피클소스", imageName: "우리 피클 M", count: 0, price: 500),
        Menu(title: "피클소스", imageName: "핫소스", count: 0, price: 500)
    ]
}
