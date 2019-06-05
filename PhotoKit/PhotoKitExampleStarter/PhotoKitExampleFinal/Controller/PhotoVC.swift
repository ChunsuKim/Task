//
//  PhotoVC.swift
//  PhotoKitExampleFinal
//
//  Created by Wi on 04/06/2019.
//  Copyright © 2019 Wi. All rights reserved.
//

import UIKit
import Photos

private let reuseIdentifier = "PhotoCell"
private let reuseHeaderIndentifier = "PhotoHeader"

class PhotoVC: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    // MARK: - Properties
    
    var images = [UIImage]()
    var assets = [PHAsset]()
    var selectedImage: UIImage?
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Register cell classes
        self.collectionView.register(PhotoCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        self.collectionView.register(PhotoCell.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: reuseHeaderIndentifier)
        
        collectionView.backgroundColor = .white
        
        fetchPhotos()
        
    }
    
    // MARK: - UICollectionView

    // MARK: UICollectionViewFlowLayout
    
    // 헤더 크기 정하기
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        let width = view.frame.width
        return CGSize(width: width, height: width)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (view.frame.width - 3) / 4
        return CGSize(width: width, height: width)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
    // MARK: UICollctionViewDatasource
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? PhotoCell else { fatalError("cell is not Photocell Type") }
        cell.photoImageView.image = images[indexPath.row]
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: reuseHeaderIndentifier, for: indexPath) as? PhotoCell else { fatalError("header is not PhotoCell type") }
//        header.photoImageView.image = selectedImage
        
        if let selectedImage = self.selectedImage {
            // index 구하기
            if let index = self.images.index(of: selectedImage) {
                let selectedAsset = self.assets[index]
                let imageManager = PHImageManager.default()
                let targetSize = CGSize(width: 600, height: 600)
                
                imageManager.requestImage(for: selectedAsset, targetSize: targetSize, contentMode: .default, options: nil) { (image, info) in
                    header.photoImageView.image = image
                }
            }
        }
        
        return header
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.selectedImage = images[indexPath.row]
        self.collectionView.reloadData()
    }
    
    // MARK: - Photos func
    
    func fetchPhotos(){
        
        // setting options
        let options = PHFetchOptions()
        
        // How many photos will be recieved
        options.fetchLimit = .max // .max or Int
        
        // type of desciption
        let sortDesciptor = NSSortDescriptor(key: "creationDate", ascending: false)
        
        // function of option
        options.sortDescriptors = [sortDesciptor]
        DispatchQueue.global(qos: .background).async {
            
            // receving the photo asset
            let allPhotos = PHAsset.fetchAssets(with: .image, options: options)
            allPhotos.enumerateObjects { (asset, count, stop) in
                print(count)
                
                // image manager
                let imageManager = PHImageManager.default()
                
                // photo size
                let targetSize = CGSize(width: 200, height: 200)
                
                // image request option
                let options = PHImageRequestOptions()
                
                // image를 동기적으로 가져올것인지
                options.isSynchronous = true
                
                // image request
                imageManager.requestImage(for: asset, targetSize: targetSize, contentMode: .aspectFit, options: options, resultHandler: { (image, info) in
                    
                    if let image = image {
                        // adding image
                        self.images.append(image)
                        // select 할때 더 큰 이미지를 요청할 용도
                        self.assets.append(asset)
                        
                        if self.selectedImage == nil {
                            self.selectedImage = image
                        }
                        
                        DispatchQueue.main.async {
                            
                            self.collectionView.reloadData()
                        }
        
        
                    print("reload")
                }
            })
        }
    }
    
}
}
