//
//  ViewController.swift
//  CustomCollectionAndTapBar
//
//  Created by Chunsu Kim on 19/06/2019.
//  Copyright © 2019 Chunsu Kim. All rights reserved.
//

import UIKit

class CustomCollectionAndTapBar: UIViewController {
    
    // MARK: - Properties
    
    let menuBar = MenuBar()
    
    let pageCollectionView : UICollectionView = {
        
        // flow layout
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        
        // collection view
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.isPagingEnabled = true
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .white
        
        return collectionView
    }()
    
    var menuTitles = ["menu1", "menu2", "menu3", "menu4"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureCustomTapBar()
        configureConstraints()
    }
    
    private func configureCustomTapBar() {
        menuBar.menuTitles = menuTitles
        pageCollectionView.register(MenuCell.self, forCellWithReuseIdentifier: "menuCell")
        
        pageCollectionView.dataSource = self
        pageCollectionView.delegate = self
        menuBar.delegate = self
        // navigationbar hidden
        navigationController?.isNavigationBarHidden = true
        
        view.addSubview(menuBar)
        view.addSubview(pageCollectionView)
        
    }
    
    private func configureConstraints() {
        menuBar.translatesAutoresizingMaskIntoConstraints = false
        
        let guide = view.safeAreaLayoutGuide
        menuBar.topAnchor.constraint(equalTo: guide.topAnchor).isActive = true
        menuBar.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        menuBar.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        menuBar.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        menuBar.indicatorBar.widthAnchor.constraint(equalToConstant: self.view.frame.width / CGFloat(menuTitles.count)).isActive = true
        
        pageCollectionView.topAnchor.constraint(equalTo: menuBar.bottomAnchor).isActive = true
        pageCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        pageCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        pageCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }


}

extension CustomCollectionAndTapBar: MenuBarDelegate {
    func menuBarDidSelected(_ indexPath: IndexPath) {

        pageCollectionView.selectItem(at: indexPath, animated: true, scrollPosition: .centeredHorizontally)
    }
    
}


extension CustomCollectionAndTapBar: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return menuTitles.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "menuCell", for: indexPath) as! MenuCell
        cell.label.text = menuTitles[indexPath.row]
        
        return cell
    }
    
    
}

extension CustomCollectionAndTapBar: UICollectionViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        menuBar.indicatorBarLeadingConstraint.constant = scrollView.contentOffset.x / CGFloat(menuTitles.count)
    }
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        
        let itemAt = Int(targetContentOffset.pointee.x / self.view.frame.width)
        menuBar.menuCollectionView.selectItem(at: IndexPath(item: itemAt, section: 0), animated: true, scrollPosition: .centeredHorizontally)
    }
}

extension CustomCollectionAndTapBar: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: self.view.frame.width, height: self.view.frame.height - menuBar.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        
        return 0
    }
}
