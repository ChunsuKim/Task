//
//  Data.swift
//  CollectionViewAnimation
//
//  Created by Chunsu Kim on 18/07/2019.
//  Copyright © 2019 Chunsu Kim. All rights reserved.
//

import Foundation

struct ThemeMenu {
    let menu: String
    let items: [Pool]
}

struct Pool {
    let title: String
    let imageName: String
    let price: String
}

var listMenuTitles = ["선착순 쿠폰","모텔","호텔/리조트", "펜션/풀빌라", "게스트하우스", "#무한쿠폰룸", "프랜차이즈", "#신축/리모델링", "#초특가호텔", "#인기숙소", "#파티룸", "#무료영화", "#스파펜션"]

let themeMenus: [ThemeMenu] = [
    ThemeMenu(menu: "풀빌라", items: [
        Pool(title: "가평 하버하우스풀빌라", imageName: "pool1", price: "180,000"),
        Pool(title: "경주 에디스풀빌라펜션", imageName: "pool2", price: "69,000"),
        Pool(title: "여수 까사413펜션", imageName: "pool3", price: "100,000"),
        Pool(title: "경주 비버리힐펜션", imageName: "pool4", price: "80,000")
        ]
    ),
    
    ThemeMenu(menu: "해수욕장", items: [
        Pool(title: "강릉 진배네", imageName: "pool4", price: "150,000"),
        Pool(title: "속초 은석이네", imageName: "pool3", price: "180,000"),
        Pool(title: "대천 천수네", imageName: "pool2", price: "300,000"),
        Pool(title: "울산 업스네", imageName: "pool1", price: "210,000")
        
        ]
    ),
    
    ThemeMenu(menu: "수영장", items: [
        Pool(title: "엠버서드 해운대", imageName: "pool2", price: "210,000"),
        Pool(title: "콘티넨탈 삼성", imageName: "pool1", price: "160,000"),
        Pool(title: "라마다 경주", imageName: "pool4", price: "200,000"),
        Pool(title: "휘슬락 호텔", imageName: "pool3", price: "270,000")
        
        ]
    ),
    
    ThemeMenu(menu: "계곡핫플", items: [
        Pool(title: "히든베이", imageName: "pool4", price: "190,000"),
        Pool(title: "강릉 세인트존스호텔", imageName: "pool3", price: "230,000"),
        Pool(title: "스카이베이", imageName: "pool2", price: "300,000"),
        Pool(title: "마리나 베이 서울", imageName: "pool1", price: "210,000")
        
        ]
    )
]


struct PopData {
    let imageName: String
}

struct PopDataManager {
    static let shared = PopDataManager()
    init() {}
    
    let pops: [PopData] = [
        PopData(imageName: "pool1"),
        PopData(imageName: "pool2"),
        PopData(imageName: "pool3"),
        PopData(imageName: "pool4")
    ]
}
