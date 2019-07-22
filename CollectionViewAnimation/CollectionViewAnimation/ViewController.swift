//
//  ViewController.swift
//  CollectionViewAnimation
//
//  Created by Chunsu Kim on 18/07/2019.
//  Copyright © 2019 Chunsu Kim. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource {
    
    private var popList = PopDataManager.shared.pops
    
    private let pagecontrols = UIPageControl()
    private var x = 1
    private let popViewCollectionView: UICollectionView = {
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.backgroundColor = .white
        
        return collectionView
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureCollectionView()
        configureCollectionViewConstraints()
        configurePagecontrols()
        setTimer()
        
    }
    
    private func configureCollectionView() {
        popViewCollectionView.dataSource = self
        popViewCollectionView.delegate = self
        popViewCollectionView.clipsToBounds = true
        popViewCollectionView.layer.cornerRadius = 10
        popViewCollectionView.isPagingEnabled = true
        
        popViewCollectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: CollectionViewCell.identifier)
        
        view.addSubview(popViewCollectionView)
    }
    
    private func configureCollectionViewConstraints() {
        popViewCollectionView.translatesAutoresizingMaskIntoConstraints = false
        popViewCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        popViewCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        popViewCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        popViewCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20).isActive = true
        popViewCollectionView.heightAnchor.constraint(equalToConstant: 260).isActive = true
    }
    
    private func configurePagecontrols() {
        pagecontrols.numberOfPages = 4
        popViewCollectionView.addSubview(pagecontrols)
        
        pagecontrols.translatesAutoresizingMaskIntoConstraints = false
        pagecontrols.bottomAnchor.constraint(equalTo: popViewCollectionView.safeAreaLayoutGuide.bottomAnchor, constant: 0).isActive = true
        pagecontrols.heightAnchor.constraint(equalToConstant: 30).isActive = true
        pagecontrols.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        pagecontrols.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    }
    
    private func setTimer() {
        let _ = Timer.scheduledTimer(timeInterval: 3, target: self, selector: #selector(startTimer), userInfo: nil, repeats: true)
    }
    
    // MARK: - Action Method
    @objc private func startTimer() {
        pagecontrols.currentPage = x
        if x < 4 {
            let indexPath = IndexPath(item: x, section: 0)
            popViewCollectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
            x = x + 1
        } else {
            x = 0
            let indexPath = IndexPath(item: 0, section: 0)
            popViewCollectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
            pagecontrols.currentPage = indexPath.row
        }
        
    }
    
    // MARK: - UICollectionView DataSource
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return popList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell.identifier, for: indexPath) as! CollectionViewCell
        cell.configureCellContent(image: UIImage(named: popList[indexPath.row].imageName))
        
        return cell
    }
}

// MARK: - UICollectionView Delegate FlowLayout
extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: view.frame.width - 40, height: view.frame.height - 40)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        //        return UIEdgeInsets(top: 10, left: 20, bottom: 10, right: 20)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        
        return 0
    }
}
