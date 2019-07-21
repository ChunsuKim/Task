//
//  TableViewCell.swift
//  HideAndShow
//
//  Created by Chunsu Kim on 21/07/2019.
//  Copyright © 2019 Chunsu Kim. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    static let identifier = "TableViewCell"
    
    private let popBackgroundView = UIView()
    private let popHiddenView = UIView()
    
    private let popNowdaysLabel = UILabel()
    private let popUpArrowImageView = UIImageView()
    
    private let popFirstLabelStackView = UIStackView()
    private let popFirstNumberLabel = UILabel()
    private let popNumberOneLabel = UILabel()
    
    private let popSecondLabelStackView = UIStackView()
    private let popSecondNumberLabel = UILabel()
    private let popNumberTwoLabel = UILabel()
    
    private let popThirdLabelStackView = UIStackView()
    private let popThirdNumberLabel = UILabel()
    private let popNumberThreeLabel = UILabel()
    
    private let popFourthLabelStackView = UIStackView()
    private let popFourthNumberLabel = UILabel()
    private let popNumberFourLabel = UILabel()
    
    private let popFifthLabelStackView = UIStackView()
    private let popFifthNumberLabel = UILabel()
    private let popNumberFiveLabel = UILabel()
    
    let popDownButton = UIButton(type: .custom)
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.selectionStyle = .none
        
        configureViews()
        configurePopBackgroundViewConstraints()
        configurePopHiddenViewConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    private func configureViews() {
        
        popHiddenView.isHidden = true
        
        
        popNowdaysLabel.textColor = #colorLiteral(red: 0.9960784314, green: 0.2039215686, blue: 0.4705882353, alpha: 1)
        popNowdaysLabel.text = "요즘 뜨는"
        popNowdaysLabel.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
        
        popUpArrowImageView.image = #imageLiteral(resourceName: "pop")
        popUpArrowImageView.contentMode = .scaleAspectFit
        
        popFirstLabelStackView.axis = .horizontal
        popFirstLabelStackView.distribution = .fillProportionally
        popFirstLabelStackView.spacing = 5
        
        popSecondLabelStackView.axis = .horizontal
        popSecondLabelStackView.distribution = .fillProportionally
        popSecondLabelStackView.spacing = 5
        
        popThirdLabelStackView.axis = .horizontal
        popThirdLabelStackView.distribution = .fillProportionally
        popThirdLabelStackView.spacing = 5
        
        popFourthLabelStackView.axis = .horizontal
        popFourthLabelStackView.distribution = .fillProportionally
        popFourthLabelStackView.spacing = 5
        
        popFifthLabelStackView.axis = .horizontal
        popFifthLabelStackView.distribution = .fillProportionally
        popFifthLabelStackView.spacing = 5
        
        popFirstNumberLabel.text = "1"
        popFirstNumberLabel.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        
        popNumberOneLabel.text = "서울호캉스"
        popNumberOneLabel.font = UIFont.systemFont(ofSize: 15, weight: .light)
        
        popSecondNumberLabel.text = "2"
        popSecondNumberLabel.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        popNumberTwoLabel.font = UIFont.systemFont(ofSize: 15, weight: .light)
        
        popThirdNumberLabel.text = "3"
        popThirdNumberLabel.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        popNumberThreeLabel.font = UIFont.systemFont(ofSize: 15, weight: .light)
        
        popFourthNumberLabel.text = "4"
        popFourthNumberLabel.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        popNumberFourLabel.font = UIFont.systemFont(ofSize: 15, weight: .light)
        
        popFifthNumberLabel.text = "5"
        popFifthNumberLabel.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        popNumberFiveLabel.font = UIFont.systemFont(ofSize: 15, weight: .light)
        
        popDownButton.setImage(#imageLiteral(resourceName: "down"), for: .normal)
        popDownButton.setImage(#imageLiteral(resourceName: "up"), for: .selected)
        popDownButton.contentMode = .scaleAspectFit
        
        contentView.addSubview(popBackgroundView)
        popBackgroundView.addSubview(popNowdaysLabel)
        popBackgroundView.addSubview(popUpArrowImageView)
        popBackgroundView.addSubview(popFirstLabelStackView)
        popFirstLabelStackView.addArrangedSubview(popFirstNumberLabel)
        popFirstLabelStackView.addArrangedSubview(popNumberOneLabel)
        popBackgroundView.addSubview(popDownButton)
        
        contentView.addSubview(popHiddenView)
        popHiddenView.addSubview(popSecondLabelStackView)
        popSecondLabelStackView.addArrangedSubview(popSecondNumberLabel)
        popSecondLabelStackView.addArrangedSubview(popNumberTwoLabel)
        popHiddenView.addSubview(popThirdLabelStackView)
        popThirdLabelStackView.addArrangedSubview(popThirdNumberLabel)
        popThirdLabelStackView.addArrangedSubview(popNumberThreeLabel)
        popHiddenView.addSubview(popFourthLabelStackView)
        popFourthLabelStackView.addArrangedSubview(popFourthNumberLabel)
        popFourthLabelStackView.addArrangedSubview(popNumberFourLabel)
        popHiddenView.addSubview(popFifthLabelStackView)
        popFifthLabelStackView.addArrangedSubview(popFifthNumberLabel)
        popFifthLabelStackView.addArrangedSubview(popNumberFiveLabel)
        
    }
    
    var popBackgroundViewBottomPriority: NSLayoutConstraint?
    var popHidddenViewBottomPriority: NSLayoutConstraint?
    
    private func configurePopBackgroundViewConstraints() {
        popBackgroundView.translatesAutoresizingMaskIntoConstraints = false
        popBackgroundView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        popBackgroundView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        popBackgroundView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        popBackgroundView.heightAnchor.constraint(equalToConstant: 40).isActive = true
        popBackgroundViewBottomPriority = popBackgroundView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        popBackgroundViewBottomPriority?.priority = UILayoutPriority(1000)
        popBackgroundViewBottomPriority?.isActive = true
        
        popNowdaysLabel.translatesAutoresizingMaskIntoConstraints = false
        popNowdaysLabel.centerYAnchor.constraint(equalTo: popBackgroundView.centerYAnchor).isActive = true
        popNowdaysLabel.leadingAnchor.constraint(equalTo: popBackgroundView.leadingAnchor, constant: 20).isActive = true
        popNowdaysLabel.heightAnchor.constraint(equalToConstant: 15).isActive = true
        popNowdaysLabel.widthAnchor.constraint(equalToConstant: 60).isActive = true
        
        popUpArrowImageView.translatesAutoresizingMaskIntoConstraints = false
        popUpArrowImageView.leadingAnchor.constraint(equalTo: popNowdaysLabel.trailingAnchor).isActive = true
        popUpArrowImageView.centerYAnchor.constraint(equalTo: popNowdaysLabel.centerYAnchor).isActive = true
        popUpArrowImageView.widthAnchor.constraint(equalToConstant: 15).isActive = true
        popUpArrowImageView.heightAnchor.constraint(equalToConstant: 15).isActive = true
        
        popFirstLabelStackView.translatesAutoresizingMaskIntoConstraints = false
        popFirstLabelStackView.leadingAnchor.constraint(equalTo: popUpArrowImageView.trailingAnchor, constant: 15).isActive = true
        popFirstLabelStackView.trailingAnchor.constraint(equalTo: popDownButton.leadingAnchor).isActive = true
        popFirstLabelStackView.centerYAnchor.constraint(equalTo: popUpArrowImageView.centerYAnchor).isActive = true
        popFirstLabelStackView.heightAnchor.constraint(equalToConstant: 15).isActive = true
        
        popFirstNumberLabel.translatesAutoresizingMaskIntoConstraints = false
        popFirstNumberLabel.heightAnchor.constraint(equalToConstant: 15).isActive = true
        popFirstNumberLabel.widthAnchor.constraint(equalToConstant: 10).isActive = true
        
        popNumberOneLabel.translatesAutoresizingMaskIntoConstraints = false
        popNumberOneLabel.heightAnchor.constraint(equalToConstant: 15).isActive = true
        popNumberOneLabel.leadingAnchor.constraint(equalTo: popFirstNumberLabel.trailingAnchor, constant: 5).isActive = true
        popNumberOneLabel.trailingAnchor.constraint(equalTo: popFirstLabelStackView.trailingAnchor).isActive = true
        
        popDownButton.translatesAutoresizingMaskIntoConstraints = false
        popDownButton.centerYAnchor.constraint(equalTo: popNowdaysLabel.centerYAnchor).isActive = true
        popDownButton.trailingAnchor.constraint(equalTo: popBackgroundView.trailingAnchor, constant: -20).isActive = true
        popDownButton.widthAnchor.constraint(equalToConstant: 20).isActive = true
        popDownButton.heightAnchor.constraint(equalToConstant: 20).isActive = true
    }
    
    private func configurePopHiddenViewConstraints() {
        
        popHiddenView.translatesAutoresizingMaskIntoConstraints = false
        popHiddenView.topAnchor.constraint(equalTo: popBackgroundView.bottomAnchor).isActive = true
        popHiddenView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        popHiddenView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true

        popHiddenView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        popHidddenViewBottomPriority = popHiddenView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        popHidddenViewBottomPriority?.priority = UILayoutPriority(750)
        popHidddenViewBottomPriority?.isActive = true
        
        popSecondLabelStackView.translatesAutoresizingMaskIntoConstraints = false
        popSecondLabelStackView.topAnchor.constraint(equalTo: popHiddenView.topAnchor).isActive = true
        popSecondLabelStackView.leadingAnchor.constraint(equalTo: popHiddenView.leadingAnchor, constant: 110).isActive = true
        popSecondLabelStackView.trailingAnchor.constraint(equalTo: popHiddenView.trailingAnchor, constant: -40).isActive = true
        popSecondLabelStackView.heightAnchor.constraint(equalToConstant: 15).isActive = true
        
        popSecondNumberLabel.translatesAutoresizingMaskIntoConstraints = false
        popSecondNumberLabel.heightAnchor.constraint(equalToConstant: 15).isActive = true
        popSecondNumberLabel.widthAnchor.constraint(equalToConstant: 10).isActive = true
        
        popNumberTwoLabel.translatesAutoresizingMaskIntoConstraints = false
        popNumberTwoLabel.heightAnchor.constraint(equalToConstant: 15).isActive = true
        popNumberTwoLabel.leadingAnchor.constraint(equalTo: popSecondNumberLabel.trailingAnchor, constant: 5).isActive = true
        popNumberTwoLabel.trailingAnchor.constraint(equalTo: popSecondLabelStackView.trailingAnchor).isActive = true
        
        popThirdLabelStackView.translatesAutoresizingMaskIntoConstraints = false
        popThirdLabelStackView.topAnchor.constraint(equalTo: popSecondLabelStackView.bottomAnchor, constant: 10).isActive = true
        popThirdLabelStackView.leadingAnchor.constraint(equalTo: popHiddenView.leadingAnchor, constant: 110).isActive = true
        popThirdLabelStackView.trailingAnchor.constraint(equalTo: popHiddenView.trailingAnchor, constant: -40).isActive = true
        popThirdLabelStackView.heightAnchor.constraint(equalToConstant: 15).isActive = true
        
        popThirdNumberLabel.translatesAutoresizingMaskIntoConstraints = false
        popThirdNumberLabel.heightAnchor.constraint(equalToConstant: 15).isActive = true
        popThirdNumberLabel.widthAnchor.constraint(equalToConstant: 10).isActive = true
        
        popNumberThreeLabel.translatesAutoresizingMaskIntoConstraints = false
        popNumberThreeLabel.heightAnchor.constraint(equalToConstant: 15).isActive = true
        popNumberThreeLabel.leadingAnchor.constraint(equalTo: popThirdNumberLabel.trailingAnchor, constant: 5).isActive = true
        popNumberThreeLabel.trailingAnchor.constraint(equalTo: popThirdLabelStackView.trailingAnchor).isActive = true
        
        popFourthLabelStackView.translatesAutoresizingMaskIntoConstraints = false
        popFourthLabelStackView.topAnchor.constraint(equalTo: popThirdLabelStackView.bottomAnchor, constant: 10).isActive = true
        popFourthLabelStackView.leadingAnchor.constraint(equalTo: popHiddenView.leadingAnchor, constant: 110).isActive = true
        popFourthLabelStackView.trailingAnchor.constraint(equalTo: popHiddenView.trailingAnchor, constant: -40).isActive = true
        popFourthLabelStackView.heightAnchor.constraint(equalToConstant: 15).isActive = true
        
        popFourthNumberLabel.translatesAutoresizingMaskIntoConstraints = false
        popFourthNumberLabel.heightAnchor.constraint(equalToConstant: 15).isActive = true
        popFourthNumberLabel.widthAnchor.constraint(equalToConstant: 10).isActive = true
        
        popNumberFourLabel.translatesAutoresizingMaskIntoConstraints = false
        popNumberFourLabel.heightAnchor.constraint(equalToConstant: 15).isActive = true
        popNumberFourLabel.leadingAnchor.constraint(equalTo: popFourthNumberLabel.trailingAnchor, constant: 5).isActive = true
        popNumberFourLabel.trailingAnchor.constraint(equalTo: popFourthLabelStackView.trailingAnchor).isActive = true
        
        popFifthLabelStackView.translatesAutoresizingMaskIntoConstraints = false
        popFifthLabelStackView.topAnchor.constraint(equalTo: popFourthLabelStackView.bottomAnchor, constant: 10).isActive = true
        popFifthLabelStackView.leadingAnchor.constraint(equalTo: popHiddenView.leadingAnchor, constant: 110).isActive = true
        popFifthLabelStackView.trailingAnchor.constraint(equalTo: popHiddenView.trailingAnchor, constant: -40).isActive = true
        popFifthLabelStackView.heightAnchor.constraint(equalToConstant: 15).isActive = true
        
        popFifthNumberLabel.translatesAutoresizingMaskIntoConstraints = false
        popFifthNumberLabel.heightAnchor.constraint(equalToConstant: 15).isActive = true
        popFifthNumberLabel.widthAnchor.constraint(equalToConstant: 10).isActive = true
        
        popNumberFiveLabel.translatesAutoresizingMaskIntoConstraints = false
        popNumberFiveLabel.heightAnchor.constraint(equalToConstant: 15).isActive = true
        popNumberFiveLabel.leadingAnchor.constraint(equalTo: popFifthNumberLabel.trailingAnchor, constant: 5).isActive = true
        popNumberFiveLabel.trailingAnchor.constraint(equalTo: popFifthLabelStackView.trailingAnchor).isActive = true
    }
    
    func popInputData(numberOne: String, numberTwo: String, numberThree: String, numberFour:String, numberFive: String) {
        popNumberOneLabel.text = numberOne
        popNumberTwoLabel.text = numberTwo
        popNumberThreeLabel.text = numberThree
        popNumberFourLabel.text = numberFour
        popNumberFiveLabel.text = numberFive
    }
    
    func isSelectedHiddenViewState(state: Bool) {
        popHiddenView.isHidden = state
    }


}
