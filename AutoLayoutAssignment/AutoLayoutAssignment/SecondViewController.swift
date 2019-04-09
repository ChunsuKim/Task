//
//  SecondViewController.swift
//  AutoLayoutAssignment
//
//  Created by Chunsu Kim on 09/04/2019.
//  Copyright © 2019 Chunsu Kim. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    // MARK: - UIView Properties
    let firstView : UIView = UIView()
    let secondView : UIView = UIView()
    let thirdView : UIView = UIView()
    let fourthView : UIView = UIView()
    let fifthView : UIView = UIView()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // MARK: - 5개 view를 화면에 띄우는 함수를 호출
        activateLayoutAnchors()
    }
    
    
    private func activateLayoutAnchors() {
        
        // MARK: - View backgroundColor setting
        firstView.backgroundColor = #colorLiteral(red: 0.06274510175, green: 0, blue: 0.1921568662, alpha: 1)
        secondView.backgroundColor = #colorLiteral(red: 0.1215686277, green: 0.01176470611, blue: 0.4235294163, alpha: 1)
        thirdView.backgroundColor = #colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1)
        fourthView.backgroundColor = #colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)
        fifthView.backgroundColor = #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)
        
        // MARK: - View addSubview
        view.addSubview(firstView)
        view.addSubview(secondView)
        view.addSubview(thirdView)
        view.addSubview(fourthView)
        view.addSubview(fifthView)
        
        
        // MARK: - firstView option setting
        firstView.translatesAutoresizingMaskIntoConstraints = false // code로 AutoLayout 작성시 스토리보드에서 리사이징하는 것을 막는 코드
        
        firstView.heightAnchor.constraint(equalToConstant: 150).isActive = true // height 150 지정
        firstView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 60).isActive = true // top 값을 safeArea 부터 60만큼 constant 지정
        firstView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true // safeArea로 부터 leading(왼쪽)을 20만큼 constant 지정
        
        // MARK: - secondView option setting
        secondView.translatesAutoresizingMaskIntoConstraints = false
        
        secondView.widthAnchor.constraint(equalTo: firstView.widthAnchor, multiplier: 0.7, constant: -1).isActive = true // width 값을 firstView로 부터 0.7배 작게한 후 1만큼 작게 만든다.
        secondView.heightAnchor.constraint(equalToConstant: 150).isActive = true // height 150 지정
        secondView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 60).isActive = true // top 값을 safeArea로 부터 60만큼 constant 지정
        secondView.leadingAnchor.constraint(equalTo: firstView.trailingAnchor, constant: 8).isActive = true // firstView로 부터 leading(왼쪽)을 8만큼 constant 지정
        
        // MARK: - thirdView option setting
        thirdView.translatesAutoresizingMaskIntoConstraints = false
        
        thirdView.widthAnchor.constraint(equalTo: secondView.widthAnchor, multiplier: 0.7, constant: -2).isActive = true // width 값을 secondView로 부터 0.7배 작게한 후 2만큼 작게 만든다.
        thirdView.heightAnchor.constraint(equalToConstant: 150).isActive = true
        thirdView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 60).isActive = true
        thirdView.leadingAnchor.constraint(equalTo: secondView.trailingAnchor, constant: 8).isActive = true
        
        // MARK: - fourthView option setting
        fourthView.translatesAutoresizingMaskIntoConstraints = false
        
        fourthView.widthAnchor.constraint(equalTo: thirdView.widthAnchor, multiplier: 0.7, constant: -3).isActive = true // width 값을 thirdView로 부터 0.7배 작게한 후 3만큼 작게 만든다.
        fourthView.heightAnchor.constraint(equalToConstant: 150).isActive = true
        fourthView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 60).isActive = true
        fourthView.leadingAnchor.constraint(equalTo: thirdView.trailingAnchor, constant: 8).isActive = true
        
        // MARK: - fifthView option setting
        fifthView.translatesAutoresizingMaskIntoConstraints = false
        
        fifthView.widthAnchor.constraint(equalTo: fourthView.widthAnchor, multiplier: 0.7, constant: -4).isActive = true // width 값을 fourthView로 부터 0.7배 작게한 후 4만큼 작게 만든다.
        fifthView.heightAnchor.constraint(equalToConstant: 150).isActive = true
        fifthView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 60).isActive = true
        fifthView.leadingAnchor.constraint(equalTo: fourthView.trailingAnchor, constant: 8).isActive = true
        fifthView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true // safeArea로 부터 trailing(오른쪽)을 20만큼 constant 지정
    }

}
