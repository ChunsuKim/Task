//
//  CodeSpotInfoViewController.swift
//  VacationSpots
//
//  Created by Chunsu Kim on 29/05/2019.
//  Copyright © 2019 Jawwad Ahmad. All rights reserved.
//

import UIKit

class CodeSpotInfoViewController: UIViewController {
    
    // MARK: - Properties
    let scrollView = UIScrollView()
    let topView = UIView()
    let topStackView = UIStackView()
    let hideButton = UIButton(type: .system)
    
    let whyVisitStackView = UIStackView()
    let whyVisitTitleLabel = UILabel()
    let whyVisitLabel = UILabel()
    
    let weatherStackView = UIStackView()
    let weatherLabel = UILabel()
    let weatherInfoLabel = UILabel()
    
    let whatToSeeStackView = UIStackView()
    let whatToSeeTitleLabel = UILabel()
    let whatToSeeLabel = UILabel()
    
    let ratingStackView = UIStackView()
    let ratingLabel = UILabel()
    let userRatingLabel = UILabel()
    
    let buttonStackView = UIStackView()
    let submitButton = UIButton(type: .system)
    let viewMapButton = UIButton(type: .system)
    let wikipediaButton = UIButton(type: .system)
    
    var vacationSpot: VacationSpot!

    override func viewDidLoad() {
        super.viewDidLoad()

        configure()
        autoLayout()
    }
    
    // MARK: - Configure and AutoLayout
    func configure() {
        hideButton.setTitle("Hide", for: .normal)
        hideButton.setTitle("Show", for: .selected)
        hideButton.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        hideButton.addTarget(self, action: #selector(handleHide(_:)), for: .touchUpInside)
        
        whyVisitTitleLabel.text = "WHY VISIT"
        whyVisitLabel.text = vacationSpot.whyVisit
        whyVisitStackView.axis = .vertical
        whyVisitStackView.alignment = .fill
        whyVisitStackView.distribution = .fill
        whyVisitStackView.spacing = 0
        
        weatherLabel.text = "WEATHER"
        weatherInfoLabel.text = vacationSpot.weatherInfo
        weatherStackView.axis = .vertical
        weatherStackView.alignment = .leading
        weatherStackView.distribution = .fill
        weatherStackView.spacing = 0
        
        whatToSeeTitleLabel.text = "WHAT TO SEE"
        whatToSeeLabel.text = vacationSpot.whatToSee
        whatToSeeStackView.axis = .vertical
        whatToSeeStackView.alignment = .fill
        whatToSeeStackView.distribution = .fill
        whatToSeeStackView.spacing = 0
        
        ratingLabel.text = "RATING"
        userRatingLabel.text = String(repeating: "★", count: vacationSpot.userRating)
        ratingStackView.axis = .horizontal
        ratingStackView.alignment = .fill
        ratingStackView.distribution = .fillEqually
        ratingStackView.spacing = 8
        userRatingLabel.textColor = #colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)
        
        buttonStackView.axis = .horizontal
        buttonStackView.alignment = .fill
        buttonStackView.distribution = .equalSpacing
        buttonStackView.spacing = 0
        
        topStackView.axis = .vertical
        topStackView.spacing = 20
        topStackView.alignment = .fill
        topStackView.distribution = .fill
        
        submitButton.setTitle("Submit Rating", for: .normal)
        viewMapButton.setTitle("View Map", for: .normal)
        wikipediaButton.setTitle("Wikipedia", for: .normal)
        
        whyVisitLabel.numberOfLines = 0
        weatherInfoLabel.numberOfLines = 0
        whatToSeeLabel.numberOfLines = 0
        
        view.addSubview(scrollView)
        view.addSubview(hideButton)
        scrollView.addSubview(topView)
        topView.addSubview(topStackView)
        
        topStackView.addArrangedSubview(whyVisitStackView)
        topStackView.addArrangedSubview(weatherStackView)
        topStackView.addArrangedSubview(whatToSeeStackView)
        topStackView.addArrangedSubview(ratingStackView)
        topStackView.addArrangedSubview(buttonStackView)
        
        whyVisitStackView.addArrangedSubview(whyVisitTitleLabel)
        whyVisitStackView.addArrangedSubview(whyVisitLabel)
        
        weatherStackView.addArrangedSubview(weatherLabel)
        weatherStackView.addArrangedSubview(weatherInfoLabel)
        
        whatToSeeStackView.addArrangedSubview(whatToSeeTitleLabel)
        whatToSeeStackView.addArrangedSubview(whatToSeeLabel)
        
        ratingStackView.addArrangedSubview(ratingLabel)
        ratingStackView.addArrangedSubview(userRatingLabel)
        
        buttonStackView.addArrangedSubview(submitButton)
        buttonStackView.addArrangedSubview(viewMapButton)
        buttonStackView.addArrangedSubview(wikipediaButton)
    }
    
    func autoLayout() {
        hideButton.translatesAutoresizingMaskIntoConstraints = false
        hideButton.leadingAnchor.constraint(equalTo: weatherLabel.trailingAnchor, constant: 10).isActive = true
        hideButton.firstBaselineAnchor.constraint(equalTo: weatherLabel.firstBaselineAnchor).isActive = true
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        
        topView.translatesAutoresizingMaskIntoConstraints = false
        topView.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        topView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        topView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        topView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
        
        topStackView.translatesAutoresizingMaskIntoConstraints = false
        topStackView.topAnchor.constraint(equalTo: topView.topAnchor).isActive = true
        topStackView.leadingAnchor.constraint(equalTo: topView.leadingAnchor).isActive = true
        topStackView.trailingAnchor.constraint(equalTo: topView.trailingAnchor).isActive = true
        
    }

    @objc func handleHide(_ sender: UIButton) {
        
        sender.isSelected.toggle()
        
        if sender.isSelected {
            UIView.animate(withDuration: 0.3) {
                self.weatherInfoLabel.isHidden = true
            }
        } else {
            UIView.animate(withDuration: 0.3) {
                self.weatherInfoLabel.isHidden = false
            }
        }
    }

}
