//
//  ViewController.swift
//  CheckBox
//
//  Created by Chunsu Kim on 04/10/2019.
//  Copyright © 2019 Chunsu Kim. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - Properties
    
    // navigationView
    private let navigationView = UIView()
    private let dismissButton = UIButton(type: .custom)
    private let naviTitleLabel = UILabel()
    private let navigationViewBottomLine = UIView()
    
    // bottom NextButton
    private let nextButton = UIButton()
    
    // total CheckBox
    private let totalCheckBox = UIButton(type: .custom)
    private let totalAgreeLabel = UILabel()
    private let totalAgreeBottomLine = UIView()
    
    // checkBoxes
    private let ageCheckBox = UIButton(type: .custom)
    private let serviceCheckBox = UIButton(type: .custom)
    private let privacyCheckBox = UIButton(type: .custom)
    private let locationCheckBox = UIButton(type: .custom)
    private let privacySelectiveCheckBox = UIButton(type: .custom)
    private let longTermIdPossessionCheckBox = UIButton(type: .custom)
    
    // Labels
    private let ageAgreeLabel = UILabel()
    private let serviceAgreeLabel = UILabel()
    private let serviceAgreeSubLabel = UILabel()
    private let privacyAgreeLabel = UILabel()
    private let privacyAgreeSubLabel = UILabel()
    
    private let locationAgreeLabel = UILabel()
    private let locationAgreeSubLabel = UILabel()
    private let privacySelectiveAgreeLabel = UILabel()
    private let privacySelectiveAgreeSubLabel = UILabel()
    private let longTermIdPossessionAgreeLabel = UILabel()
    private let longTermIdPossessionAgreeSubLabel = UILabel()
    
    private let lineView = UIView()
    private let descriptionLabel = UILabel()
    
    private let notificationCenter = NotificationCenter.default
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        configureNavigationView()
        configureTotalAgreeButtonAndLabel()
        configureNextButton()
        configureCheckBox()
        configureLabels()
        isSelectedTotalCheckbox()
    }
    
    // MARK: - Configuration
    
    // configuration navigationView
    private func configureNavigationView() {
        navigationView.backgroundColor = .white
        
        dismissButton.setImage(#imageLiteral(resourceName: "dismisslog"), for: .normal)
        dismissButton.contentMode = .scaleAspectFit
        dismissButton.addTarget(self, action: #selector(dismissButtonDidTap(_:)), for: .touchUpInside)
        
        naviTitleLabel.text = "회원가입 (1/2)"
        naviTitleLabel.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        naviTitleLabel.textColor = .black
        naviTitleLabel.textAlignment = .center
        
        navigationViewBottomLine.backgroundColor = #colorLiteral(red: 0.8774518967, green: 0.8826429248, blue: 0.8780108094, alpha: 1)
        
        view.addSubview(navigationView)
        navigationView.addSubview(dismissButton)
        navigationView.addSubview(naviTitleLabel)
        view.addSubview(navigationViewBottomLine)
        
        navigationView.translatesAutoresizingMaskIntoConstraints = false
        navigationView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        navigationView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        navigationView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        navigationView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.1).isActive = true
        
        dismissButton.translatesAutoresizingMaskIntoConstraints = false
        dismissButton.centerYAnchor.constraint(equalTo: naviTitleLabel.centerYAnchor).isActive = true
        dismissButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        dismissButton.widthAnchor.constraint(equalToConstant: 40).isActive = true
        dismissButton.heightAnchor.constraint(equalTo: navigationView.heightAnchor).isActive = true
        
        naviTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        naviTitleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 20).isActive = true
        naviTitleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        naviTitleLabel.widthAnchor.constraint(equalToConstant: 150).isActive = true
        naviTitleLabel.heightAnchor.constraint(equalTo: navigationView.heightAnchor).isActive = true
        
        navigationViewBottomLine.translatesAutoresizingMaskIntoConstraints = false
        navigationViewBottomLine.topAnchor.constraint(equalTo: navigationView.bottomAnchor).isActive = true
        navigationViewBottomLine.leadingAnchor.constraint(equalTo: navigationView.leadingAnchor).isActive = true
        navigationViewBottomLine.trailingAnchor.constraint(equalTo: navigationView.trailingAnchor).isActive = true
        navigationViewBottomLine.heightAnchor.constraint(equalToConstant: 1).isActive = true
    }
    
    // configuration total agree button and label
    private func configureTotalAgreeButtonAndLabel() {
        totalCheckBox.setBackgroundImage(UIImage(named: "box"), for: .normal)
        totalCheckBox.setBackgroundImage(UIImage(named: "checkbox"), for: .selected)
        totalCheckBox.addTarget(self, action: #selector(totalCheckBoxClicked(_:)), for: .touchUpInside)
        
        totalAgreeLabel.text = "전체 동의"
        totalAgreeLabel.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        
        totalAgreeBottomLine.backgroundColor = #colorLiteral(red: 0.8774518967, green: 0.8826429248, blue: 0.8780108094, alpha: 1)
        
        view.addSubview(totalCheckBox)
        view.addSubview(totalAgreeLabel)
        view.addSubview(totalAgreeBottomLine)
        
        totalCheckBox.translatesAutoresizingMaskIntoConstraints = false
        totalCheckBox.topAnchor.constraint(equalTo: navigationViewBottomLine.bottomAnchor, constant: 50).isActive = true
        totalCheckBox.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 50).isActive = true
        totalCheckBox.widthAnchor.constraint(equalToConstant: 25).isActive = true
        totalCheckBox.heightAnchor.constraint(equalToConstant: 25).isActive = true
        
        totalAgreeLabel.translatesAutoresizingMaskIntoConstraints = false
        totalAgreeLabel.centerYAnchor.constraint(equalTo: totalCheckBox.centerYAnchor).isActive = true
        totalAgreeLabel.leadingAnchor.constraint(equalTo: totalCheckBox.trailingAnchor, constant: 10).isActive = true
        totalAgreeLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -45).isActive = true
        totalAgreeLabel.heightAnchor.constraint(equalToConstant: 25).isActive = true
        
        totalAgreeBottomLine.translatesAutoresizingMaskIntoConstraints = false
        totalAgreeBottomLine.topAnchor.constraint(equalTo: totalAgreeLabel.bottomAnchor, constant: 15).isActive = true
        totalAgreeBottomLine.leadingAnchor.constraint(equalTo: totalCheckBox.leadingAnchor, constant: -5).isActive = true
        totalAgreeBottomLine.trailingAnchor.constraint(equalTo: totalAgreeLabel.trailingAnchor, constant: -5).isActive = true
        totalAgreeBottomLine.heightAnchor.constraint(equalToConstant: 1).isActive = true
    }
    
    // configuration checkboxes
    private func configureCheckBox() {
        
        ageCheckBox.setBackgroundImage(UIImage(named: "box"), for: .normal)
        ageCheckBox.setBackgroundImage(UIImage(named: "checkbox"), for: .selected)
        ageCheckBox.addTarget(self, action: #selector(checkBoxClicked(_:)), for: .touchUpInside)
        
        serviceCheckBox.setBackgroundImage(UIImage(named: "box"), for: .normal)
        serviceCheckBox.setBackgroundImage(UIImage(named: "checkbox"), for: .selected)
        serviceCheckBox.addTarget(self, action: #selector(checkBoxClicked(_:)), for: .touchUpInside)
        
        privacyCheckBox.setBackgroundImage(UIImage(named: "box"), for: .normal)
        privacyCheckBox.setBackgroundImage(UIImage(named: "checkbox"), for: .selected)
        privacyCheckBox.addTarget(self, action: #selector(checkBoxClicked(_:)), for: .touchUpInside)
        
        locationCheckBox.setBackgroundImage(UIImage(named: "box"), for: .normal)
        locationCheckBox.setBackgroundImage(UIImage(named: "checkbox"), for: .selected)
        locationCheckBox.addTarget(self, action: #selector(checkBoxClicked(_:)), for: .touchUpInside)
        
        privacySelectiveCheckBox.setBackgroundImage(UIImage(named: "box"), for: .normal)
        privacySelectiveCheckBox.setBackgroundImage(UIImage(named: "checkbox"), for: .selected)
        privacySelectiveCheckBox.addTarget(self, action: #selector(checkBoxClicked(_:)), for: .touchUpInside)
        
        longTermIdPossessionCheckBox.setBackgroundImage(UIImage(named: "box"), for: .normal)
        longTermIdPossessionCheckBox.setBackgroundImage(UIImage(named: "checkbox"), for: .selected)
        longTermIdPossessionCheckBox.addTarget(self, action: #selector(checkBoxClicked(_:)), for: .touchUpInside)
        
        view.addSubview(ageCheckBox)
        view.addSubview(serviceCheckBox)
        view.addSubview(privacyCheckBox)
        view.addSubview(locationCheckBox)
        view.addSubview(privacySelectiveCheckBox)
        view.addSubview(longTermIdPossessionCheckBox)
        
        // constraints
        ageCheckBox.translatesAutoresizingMaskIntoConstraints = false
        ageCheckBox.topAnchor.constraint(equalTo: totalAgreeBottomLine.bottomAnchor, constant: 25).isActive = true
        ageCheckBox.leadingAnchor.constraint(equalTo: totalCheckBox.leadingAnchor).isActive = true
        ageCheckBox.widthAnchor.constraint(equalTo: totalCheckBox.widthAnchor).isActive = true
        ageCheckBox.heightAnchor.constraint(equalTo: totalCheckBox.heightAnchor).isActive = true
        
        serviceCheckBox.translatesAutoresizingMaskIntoConstraints = false
        serviceCheckBox.topAnchor.constraint(equalTo: ageCheckBox.bottomAnchor, constant: 40).isActive = true
        serviceCheckBox.leadingAnchor.constraint(equalTo: ageCheckBox.leadingAnchor).isActive = true
        serviceCheckBox.widthAnchor.constraint(equalTo: ageCheckBox.widthAnchor).isActive = true
        serviceCheckBox.heightAnchor.constraint(equalTo: ageCheckBox.heightAnchor).isActive = true
        
        privacyCheckBox.translatesAutoresizingMaskIntoConstraints = false
        privacyCheckBox.topAnchor.constraint(equalTo: serviceCheckBox.bottomAnchor, constant: 40).isActive = true
        privacyCheckBox.leadingAnchor.constraint(equalTo: serviceCheckBox.leadingAnchor).isActive = true
        privacyCheckBox.widthAnchor.constraint(equalTo: serviceCheckBox.widthAnchor).isActive = true
        privacyCheckBox.heightAnchor.constraint(equalTo: serviceCheckBox.heightAnchor).isActive = true
        
        locationCheckBox.translatesAutoresizingMaskIntoConstraints = false
        locationCheckBox.topAnchor.constraint(equalTo: privacyCheckBox.bottomAnchor, constant: 40).isActive = true
        locationCheckBox.leadingAnchor.constraint(equalTo: privacyCheckBox.leadingAnchor).isActive = true
        locationCheckBox.widthAnchor.constraint(equalTo: privacyCheckBox.widthAnchor).isActive = true
        locationCheckBox.heightAnchor.constraint(equalTo: privacyCheckBox.heightAnchor).isActive = true
        
        privacySelectiveCheckBox.translatesAutoresizingMaskIntoConstraints = false
        privacySelectiveCheckBox.topAnchor.constraint(equalTo: locationCheckBox.bottomAnchor, constant: 40).isActive = true
        privacySelectiveCheckBox.leadingAnchor.constraint(equalTo: locationCheckBox.leadingAnchor).isActive = true
        privacySelectiveCheckBox.widthAnchor.constraint(equalTo: locationCheckBox.widthAnchor).isActive = true
        privacySelectiveCheckBox.heightAnchor.constraint(equalTo: locationCheckBox.heightAnchor).isActive = true
        
        longTermIdPossessionCheckBox.translatesAutoresizingMaskIntoConstraints = false
        longTermIdPossessionCheckBox.topAnchor.constraint(equalTo: privacySelectiveCheckBox.bottomAnchor, constant: 40).isActive = true
        longTermIdPossessionCheckBox.leadingAnchor.constraint(equalTo: privacySelectiveCheckBox.leadingAnchor).isActive = true
        longTermIdPossessionCheckBox.widthAnchor.constraint(equalTo: privacySelectiveCheckBox.widthAnchor).isActive = true
        longTermIdPossessionCheckBox.heightAnchor.constraint(equalTo: privacySelectiveCheckBox.heightAnchor).isActive = true
    }
    
    // configuration labels
    private func configureLabels() {
        let ageAgreeStringValue = "만 14세 이상 (필수)"
        let ageAgreeAttributedString: NSMutableAttributedString = NSMutableAttributedString(string: ageAgreeStringValue)
        ageAgreeAttributedString.setColorForText(textForAttribute: "만 14세 이상", withColor: #colorLiteral(red: 0.5646031499, green: 0.5648178458, blue: 0.5603218079, alpha: 1))
        ageAgreeAttributedString.setFontForText(textForAttribute: "만 14세 이상", withFont: UIFont.systemFont(ofSize: 15, weight: .light))
        ageAgreeAttributedString.setColorForText(textForAttribute: "(필수)", withColor: #colorLiteral(red: 0.8543364406, green: 0, blue: 0.3139223754, alpha: 1))
        ageAgreeAttributedString.setFontForText(textForAttribute: "(필수)", withFont: UIFont.systemFont(ofSize: 15, weight: .semibold))
        ageAgreeLabel.attributedText = ageAgreeAttributedString
        view.addSubview(ageAgreeLabel)
        
        let serviceAgreeStringValue = "서비스 이용약관 동의 (필수)"
        let serviceAgreeAttributedString: NSMutableAttributedString = NSMutableAttributedString(string: serviceAgreeStringValue)
        serviceAgreeAttributedString.setColorForText(textForAttribute: "서비스 이용약관 동의", withColor: #colorLiteral(red: 0.5646031499, green: 0.5648178458, blue: 0.5603218079, alpha: 1))
        serviceAgreeAttributedString.setFontForText(textForAttribute: "서비스 이용약관 동의", withFont: UIFont.systemFont(ofSize: 15, weight: .light))
        serviceAgreeAttributedString.setColorForText(textForAttribute: "(필수)", withColor: #colorLiteral(red: 0.8543364406, green: 0, blue: 0.3139223754, alpha: 1))
        serviceAgreeAttributedString.setFontForText(textForAttribute: "(필수)", withFont: UIFont.systemFont(ofSize: 15, weight: .semibold))
        serviceAgreeLabel.attributedText = serviceAgreeAttributedString
        view.addSubview(serviceAgreeLabel)
        
        serviceAgreeSubLabel.text = "광고성 정보 수신동의 포함"
        serviceAgreeSubLabel.font = UIFont.systemFont(ofSize: 12, weight: .ultraLight)
        serviceAgreeSubLabel.textColor = #colorLiteral(red: 0.5646031499, green: 0.5648178458, blue: 0.5603218079, alpha: 1)
        view.addSubview(serviceAgreeSubLabel)
        
        let privacyAgreeStringValue = "개인정보 수집 및 이용 동의 (필수)"
        let privacyAgreeAttributedString: NSMutableAttributedString = NSMutableAttributedString(string: privacyAgreeStringValue)
        privacyAgreeAttributedString.setColorForText(textForAttribute: "개인정보 수집 및 이용 동의", withColor: #colorLiteral(red: 0.5646031499, green: 0.5648178458, blue: 0.5603218079, alpha: 1))
        privacyAgreeAttributedString.setFontForText(textForAttribute: "개인정보 수집 및 이용 동의", withFont: UIFont.systemFont(ofSize: 15, weight: .light))
        privacyAgreeAttributedString.setColorForText(textForAttribute: "(필수)", withColor: #colorLiteral(red: 0.8543364406, green: 0, blue: 0.3139223754, alpha: 1))
        privacyAgreeAttributedString.setFontForText(textForAttribute: "(필수)", withFont: UIFont.systemFont(ofSize: 15, weight: .semibold))
        privacyAgreeLabel.attributedText = privacyAgreeAttributedString
        view.addSubview(privacyAgreeLabel)
        
        privacyAgreeSubLabel.text = "예약 및 서비스 이용을 위한 필수 개인정보 수집"
        privacyAgreeSubLabel.font = UIFont.systemFont(ofSize: 12, weight: .ultraLight)
        privacyAgreeSubLabel.textColor = #colorLiteral(red: 0.5646031499, green: 0.5648178458, blue: 0.5603218079, alpha: 1)
        view.addSubview(privacyAgreeSubLabel)
        
        let locationAgreeStringValue = "위치 정보 이용약관 동의 (선택)"
        let locationAgreeAttributedString: NSMutableAttributedString = NSMutableAttributedString(string: locationAgreeStringValue)
        locationAgreeAttributedString.setFontForText(textForAttribute: "위치 정보 이용약관 동의", withFont: UIFont.systemFont(ofSize: 15, weight: .light))
        locationAgreeAttributedString.setFontForText(textForAttribute: "(선택)", withFont: UIFont.systemFont(ofSize: 15, weight: .semibold))
        locationAgreeLabel.textColor = #colorLiteral(red: 0.5646031499, green: 0.5648178458, blue: 0.5603218079, alpha: 1)
        locationAgreeLabel.attributedText = locationAgreeAttributedString
        view.addSubview(locationAgreeLabel)
        
        locationAgreeSubLabel.text = "위치정보를 통한 내 주변 숙소 정보 제공"
        locationAgreeSubLabel.font = UIFont.systemFont(ofSize: 12, weight: .ultraLight)
        locationAgreeSubLabel.textColor = #colorLiteral(red: 0.5646031499, green: 0.5648178458, blue: 0.5603218079, alpha: 1)
        view.addSubview(locationAgreeSubLabel)
        
        let privacySelectiveAgreeStringValue = "개인정보 수집 및 이용 동의 (선택)"
        let privacySelectiveAgreeAttributedString: NSMutableAttributedString = NSMutableAttributedString(string: privacySelectiveAgreeStringValue)
        privacySelectiveAgreeAttributedString.setFontForText(textForAttribute: "개인정보 수집 및 이용 동의", withFont: UIFont.systemFont(ofSize: 15, weight: .light))
        privacySelectiveAgreeAttributedString.setFontForText(textForAttribute: "(선택)", withFont: UIFont.systemFont(ofSize: 15, weight: .semibold))
        privacySelectiveAgreeLabel.textColor = #colorLiteral(red: 0.5646031499, green: 0.5648178458, blue: 0.5603218079, alpha: 1)
        privacySelectiveAgreeLabel.attributedText = privacySelectiveAgreeAttributedString
        view.addSubview(privacySelectiveAgreeLabel)
        
        privacySelectiveAgreeSubLabel.text = "서비스 혜택 등의 정보 제공을 위한 개인정보 수집 및..."
        privacySelectiveAgreeSubLabel.font = UIFont.systemFont(ofSize: 12, weight: .ultraLight)
        privacySelectiveAgreeSubLabel.textColor = #colorLiteral(red: 0.5646031499, green: 0.5648178458, blue: 0.5603218079, alpha: 1)
        view.addSubview(privacySelectiveAgreeSubLabel)
        
        let longTermAgreeStringValue = "장기 미접속 시에도 계정 유지 (선택)"
        let longTermAgreeAttributedString: NSMutableAttributedString = NSMutableAttributedString(string: longTermAgreeStringValue)
        longTermAgreeAttributedString.setFontForText(textForAttribute: "장기 미접속 시에도 계정 유지", withFont: UIFont.systemFont(ofSize: 15, weight: .light))
        longTermAgreeAttributedString.setFontForText(textForAttribute: "(선택)", withFont: UIFont.systemFont(ofSize: 15, weight: .semibold))
        longTermIdPossessionAgreeLabel.textColor = #colorLiteral(red: 0.5646031499, green: 0.5648178458, blue: 0.5603218079, alpha: 1)
        longTermIdPossessionAgreeLabel.attributedText = longTermAgreeAttributedString
        view.addSubview(longTermIdPossessionAgreeLabel)
        
        longTermIdPossessionAgreeSubLabel.text = "※ 미동의 시 1년 미접속 회원 탈퇴 전환"
        longTermIdPossessionAgreeSubLabel.font = UIFont.systemFont(ofSize: 12, weight: .ultraLight)
        longTermIdPossessionAgreeSubLabel.textColor = #colorLiteral(red: 0.5646031499, green: 0.5648178458, blue: 0.5603218079, alpha: 1)
        view.addSubview(longTermIdPossessionAgreeSubLabel)
        
        lineView.backgroundColor = #colorLiteral(red: 0.8774518967, green: 0.8826429248, blue: 0.8780108094, alpha: 1)
        view.addSubview(lineView)
        
        descriptionLabel.numberOfLines = 0
        descriptionLabel.text = "※ 선택 항목에 동의하지 않으셔도 계속 가입을 진행하실 수 있습니다."
        descriptionLabel.font = UIFont.systemFont(ofSize: 12, weight: .ultraLight)
        descriptionLabel.textColor = #colorLiteral(red: 0.5646031499, green: 0.5648178458, blue: 0.5603218079, alpha: 1)
        view.addSubview(descriptionLabel)
        
        // constraints
        ageAgreeLabel.translatesAutoresizingMaskIntoConstraints = false
        ageAgreeLabel.centerYAnchor.constraint(equalTo: ageCheckBox.centerYAnchor).isActive = true
        ageAgreeLabel.leadingAnchor.constraint(equalTo: ageCheckBox.trailingAnchor, constant: 10).isActive = true
        ageAgreeLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -45).isActive = true
        ageAgreeLabel.heightAnchor.constraint(equalToConstant: 18).isActive = true
        
        serviceAgreeLabel.translatesAutoresizingMaskIntoConstraints = false
        serviceAgreeLabel.centerYAnchor.constraint(equalTo: serviceCheckBox.centerYAnchor).isActive = true
        serviceAgreeLabel.leadingAnchor.constraint(equalTo: serviceCheckBox.trailingAnchor, constant: 10).isActive = true
        serviceAgreeLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -45).isActive = true
        serviceAgreeLabel.heightAnchor.constraint(equalToConstant: 18).isActive = true
        
        serviceAgreeSubLabel.translatesAutoresizingMaskIntoConstraints = false
        serviceAgreeSubLabel.topAnchor.constraint(equalTo: serviceAgreeLabel.bottomAnchor).isActive = true
        serviceAgreeSubLabel.leadingAnchor.constraint(equalTo: serviceAgreeLabel.leadingAnchor).isActive = true
        serviceAgreeSubLabel.widthAnchor.constraint(equalTo: serviceAgreeLabel.widthAnchor).isActive = true
        serviceAgreeSubLabel.heightAnchor.constraint(equalToConstant: 15).isActive = true
        
        privacyAgreeLabel.translatesAutoresizingMaskIntoConstraints = false
        privacyAgreeLabel.centerYAnchor.constraint(equalTo: privacyCheckBox.centerYAnchor).isActive = true
        privacyAgreeLabel.leadingAnchor.constraint(equalTo: privacyCheckBox.trailingAnchor, constant: 10).isActive = true
        privacyAgreeLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -45).isActive = true
        privacyAgreeLabel.heightAnchor.constraint(equalToConstant: 18).isActive = true
        
        privacyAgreeSubLabel.translatesAutoresizingMaskIntoConstraints = false
        privacyAgreeSubLabel.topAnchor.constraint(equalTo: privacyAgreeLabel.bottomAnchor).isActive = true
        privacyAgreeSubLabel.leadingAnchor.constraint(equalTo: privacyAgreeLabel.leadingAnchor).isActive = true
        privacyAgreeSubLabel.widthAnchor.constraint(equalTo: privacyAgreeLabel.widthAnchor).isActive = true
        privacyAgreeSubLabel.heightAnchor.constraint(equalToConstant: 15).isActive = true
        
        locationAgreeLabel.translatesAutoresizingMaskIntoConstraints = false
        locationAgreeLabel.centerYAnchor.constraint(equalTo: locationCheckBox.centerYAnchor).isActive = true
        locationAgreeLabel.leadingAnchor.constraint(equalTo: locationCheckBox.trailingAnchor, constant: 10).isActive = true
        locationAgreeLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -45).isActive = true
        locationAgreeLabel.heightAnchor.constraint(equalToConstant: 18).isActive = true
        
        locationAgreeSubLabel.translatesAutoresizingMaskIntoConstraints = false
        locationAgreeSubLabel.topAnchor.constraint(equalTo: locationAgreeLabel.bottomAnchor).isActive = true
        locationAgreeSubLabel.leadingAnchor.constraint(equalTo: locationAgreeLabel.leadingAnchor).isActive = true
        locationAgreeSubLabel.widthAnchor.constraint(equalTo: locationAgreeLabel.widthAnchor).isActive = true
        locationAgreeSubLabel.heightAnchor.constraint(equalToConstant: 15).isActive = true
        
        privacySelectiveAgreeLabel.translatesAutoresizingMaskIntoConstraints = false
        privacySelectiveAgreeLabel.centerYAnchor.constraint(equalTo: privacySelectiveCheckBox.centerYAnchor).isActive = true
        privacySelectiveAgreeLabel.leadingAnchor.constraint(equalTo: privacySelectiveCheckBox.trailingAnchor, constant: 10).isActive = true
        privacySelectiveAgreeLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -45).isActive = true
        privacySelectiveAgreeLabel.heightAnchor.constraint(equalToConstant: 18).isActive = true
        
        privacySelectiveAgreeSubLabel.translatesAutoresizingMaskIntoConstraints = false
        privacySelectiveAgreeSubLabel.topAnchor.constraint(equalTo: privacySelectiveAgreeLabel.bottomAnchor).isActive = true
        privacySelectiveAgreeSubLabel.leadingAnchor.constraint(equalTo: privacySelectiveAgreeLabel.leadingAnchor).isActive = true
        privacySelectiveAgreeSubLabel.widthAnchor.constraint(equalTo: privacySelectiveAgreeLabel.widthAnchor).isActive = true
        privacySelectiveAgreeSubLabel.heightAnchor.constraint(equalToConstant: 15).isActive = true
        
        longTermIdPossessionAgreeLabel.translatesAutoresizingMaskIntoConstraints = false
        longTermIdPossessionAgreeLabel.centerYAnchor.constraint(equalTo: longTermIdPossessionCheckBox.centerYAnchor).isActive = true
        longTermIdPossessionAgreeLabel.leadingAnchor.constraint(equalTo: longTermIdPossessionCheckBox.trailingAnchor, constant: 10).isActive = true
        longTermIdPossessionAgreeLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -45).isActive = true
        longTermIdPossessionAgreeLabel.heightAnchor.constraint(equalToConstant: 18).isActive = true
        
        longTermIdPossessionAgreeSubLabel.translatesAutoresizingMaskIntoConstraints = false
        longTermIdPossessionAgreeSubLabel.topAnchor.constraint(equalTo: longTermIdPossessionAgreeLabel.bottomAnchor).isActive = true
        longTermIdPossessionAgreeSubLabel.leadingAnchor.constraint(equalTo: longTermIdPossessionAgreeLabel.leadingAnchor).isActive = true
        longTermIdPossessionAgreeSubLabel.widthAnchor.constraint(equalTo: longTermIdPossessionAgreeLabel.widthAnchor).isActive = true
        longTermIdPossessionAgreeSubLabel.heightAnchor.constraint(equalToConstant: 15).isActive = true
        
        lineView.translatesAutoresizingMaskIntoConstraints = false
        lineView.topAnchor.constraint(equalTo: longTermIdPossessionAgreeSubLabel.bottomAnchor, constant: 25).isActive = true
        lineView.leadingAnchor.constraint(equalTo: totalAgreeBottomLine.leadingAnchor).isActive = true
        lineView.trailingAnchor.constraint(equalTo: totalAgreeBottomLine.trailingAnchor).isActive = true
        lineView.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.topAnchor.constraint(equalTo: lineView.bottomAnchor, constant: 5).isActive = true
        descriptionLabel.leadingAnchor.constraint(equalTo: lineView.leadingAnchor).isActive = true
        descriptionLabel.trailingAnchor.constraint(equalTo: lineView.trailingAnchor).isActive = true
        descriptionLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }
    
    // configuration bottom next button
    private func configureNextButton() {
        
        nextButton.setTitle("다음", for: .normal)
        nextButton.backgroundColor = .lightGray
        nextButton.layer.cornerRadius = 5
        nextButton.isEnabled = false
        nextButton.addTarget(self, action: #selector(nextButtonDidTap(_:)), for: .touchUpInside)
        
        let buttonLineView = UIView()
        buttonLineView.backgroundColor = #colorLiteral(red: 0.8774518967, green: 0.8826429248, blue: 0.8780108094, alpha: 1)
        
        view.addSubview(nextButton)
        view.addSubview(buttonLineView)
        
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        nextButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10).isActive = true
        nextButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        nextButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        nextButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
        
        buttonLineView.translatesAutoresizingMaskIntoConstraints = false
        buttonLineView.bottomAnchor.constraint(equalTo: nextButton.topAnchor, constant: -10).isActive = true
        buttonLineView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        buttonLineView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        buttonLineView.heightAnchor.constraint(equalToConstant: 1).isActive = true
    }
    
    // MARK: - Action Methods
    
    @objc private func dismissButtonDidTap(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    @objc private func totalCheckBoxClicked(_ sender: UIButton) {
        sender.isSelected.toggle()
        
        let checkboxButtonArray = [ageCheckBox, serviceCheckBox, privacyCheckBox, locationCheckBox, privacySelectiveCheckBox, longTermIdPossessionCheckBox]
        
        if sender.isSelected {
            checkboxButtonArray.forEach {
                $0.isSelected = true
                nextButton.isEnabled = true
                nextButton.backgroundColor = #colorLiteral(red: 0.9960784314, green: 0.2039215686, blue: 0.4705882353, alpha: 1)
            }
        } else {
            checkboxButtonArray.forEach {
                $0.isSelected = false
                nextButton.isEnabled = false
                nextButton.backgroundColor = .lightGray
            }
        }
    }
    
    @objc private func checkBoxClicked(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        
        if ageCheckBox.isSelected && serviceCheckBox.isSelected && privacyCheckBox.isSelected {
            nextButton.isEnabled = true
            nextButton.backgroundColor = #colorLiteral(red: 0.9960784314, green: 0.2039215686, blue: 0.4705882353, alpha: 1)
        } else {
            nextButton.isEnabled = false
            nextButton.backgroundColor = .lightGray
            totalCheckBox.isSelected = false
        }
        let checkboxButtonArray = [ageCheckBox, serviceCheckBox, privacyCheckBox, locationCheckBox, privacySelectiveCheckBox, longTermIdPossessionCheckBox]
        var count = 0
        for x in checkboxButtonArray {
            if x.isSelected {
                count += 1
            } else {
                count -= 1
            }
            if count == 6 {
                totalCheckBox.isSelected = true
            }
        }
    }
    
    private func isSelectedTotalCheckbox() {
        notificationCenter.addObserver(self, selector: #selector(selectedTotalCheckbox(_:)), name: Notification.Name("isSelectedTotalCheckbox"), object: nil)
    }
    
    @objc private func selectedTotalCheckbox(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        
        if ageCheckBox.isSelected && serviceCheckBox.isSelected && privacyCheckBox.isSelected && locationCheckBox.isSelected && privacySelectiveCheckBox.isSelected && longTermIdPossessionCheckBox.isSelected {
            totalCheckBox.isSelected = true
            nextButton.isEnabled = true
            nextButton.backgroundColor = #colorLiteral(red: 0.9960784314, green: 0.2039215686, blue: 0.4705882353, alpha: 1)
        } else {
            totalCheckBox.isSelected = false
            nextButton.isEnabled = false
            nextButton.backgroundColor = .lightGray
        }
    }
    
    @objc private func nextButtonDidTap(_ sender: UIButton) {
        let secondRegisterViewController = RegisterSecondViewController()
        show(secondRegisterViewController, sender: nil)
    }
    
}

// MARK: - Extension for String color and font
extension NSMutableAttributedString {
    func setColorForText(textForAttribute: String, withColor color: UIColor) {
        let range: NSRange = self.mutableString.range(of: textForAttribute, options: .caseInsensitive)
        
        self.addAttribute(NSAttributedString.Key.foregroundColor, value: color, range: range)
    }
    
    func setFontForText(textForAttribute: String, withFont font: UIFont) {
        let range: NSRange = self.mutableString.range(of: textForAttribute, options: .caseInsensitive)
        
        self.addAttribute(NSAttributedString.Key.font, value: font, range: range)
    }
}
