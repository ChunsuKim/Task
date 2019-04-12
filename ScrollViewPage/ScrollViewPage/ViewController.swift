//
//  ViewController.swift
//  ScrollViewPage
//
//  Created by Chunsu Kim on 11/04/2019.
//  Copyright © 2019 Chunsu Kim. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {
    
    // MARK: - Properties
    @IBOutlet weak var scrollView: UIScrollView!    // scroll view
    @IBOutlet weak var pageControl: UIPageControl!  // page control
    

    // MARK: - scroll view delegate
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.delegate = self
    }
    
    // MARK: - pageControl 구현부
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let pageNumber = round(scrollView.contentOffset.x / scrollView.frame.size.width)
        pageControl.currentPage = Int(pageNumber)
//        print(scrollView.contentOffset.x) 첫번째 뷰에서 가장 왼쪽이 (0.0)
    }
}

