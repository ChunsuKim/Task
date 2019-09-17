//
//  ViewController.swift
//  ImagePickerControllerExample
//
//  Created by giftbot on 2019. 5. 3..
//  Copyright © 2019년 giftbot. All rights reserved.
//

import MobileCoreServices
import UIKit

final class ViewController: UIViewController {

  @IBOutlet private weak var imageView: UIImageView!
  private let imagePickerController = UIImagePickerController()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    imagePickerController.delegate = self
  }
  
  @IBAction private func pickImage(_ sender: Any) {
    print("\n---------- [ pickImage ] ----------\n")
    
//    imagePickerController.sourceType = .photoLibrary
    imagePickerController.sourceType = .savedPhotosAlbum
    
    present(imagePickerController, animated: true)  // 앨범에서 사진목록 보여주기
    
  }
  
  
  @IBAction private func takePicture(_ sender: Any) {
    print("\n---------- [ takePicture ] ----------\n")
    
    guard UIImagePickerController.isSourceTypeAvailable(.camera) else { return }
    imagePickerController.sourceType = .camera
    print(imagePickerController.mediaTypes)
    
    imagePickerController.mediaTypes = [kUTTypeImage as String]
//    imagePickerController.mediaTypes = ["public.image"]
    
//    let mediaTypes = UIImagePickerController.availableMediaTypes(for: .camera)
//    imagePickerController.mediaTypes = mediaTypes ?? []
    
    present(imagePickerController, animated: true)
  }
  
  @IBAction private func takePictureWithDelay(_ sender: Any) {
    print("\n---------- [ takePictureWithDelay ] ----------\n")
    
    guard UIImagePickerController.isSourceTypeAvailable(.camera) else { return }
    imagePickerController.sourceType = .camera
    imagePickerController.mediaTypes = [kUTTypeImage as String]
    
    present(imagePickerController, animated: true) {
//        self.imagePickerController.takePicture()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: {  // 2초뒤에 사진 촬영
            self.imagePickerController.takePicture()
        })
    }
  }
  
  
  @IBAction private func recordingVideo(_ sender: Any) {
    print("\n---------- [ recordingVideo ] ----------\n")
    
    guard UIImagePickerController.isSourceTypeAvailable(.camera) else { return }
    imagePickerController.sourceType = .camera
    
    print(imagePickerController.mediaTypes)
//    imagePickerController.mediaTypes = [kUTTypeMovie as String]
//    imagePickerController.mediaTypes = ["public.movie"]
    
//    imagePickerController.cameraDevice = .front   // 셀카로 시작 default: rear
    
    let mediaTypes = UIImagePickerController.availableMediaTypes(for: .camera)
    imagePickerController.mediaTypes = mediaTypes ?? [] // video, camera 사용 선택 가능
    
    imagePickerController.cameraCaptureMode = .video    // video mode로 시작
    
    present(imagePickerController, animated: true)
    
//    imagePickerController.startVideoCapture()
//    imagePickerController.stopVideoCapture()
  }

  @IBAction private func toggleAllowsEditing(_ sender: Any) {
    print("\n---------- [ toggleAllowsEditing ] ----------\n")
    
    imagePickerController.allowsEditing.toggle()
  }
}

extension ViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true)
        print("cancel")
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        print( " ------ didFinishPickingMediaWithInfo ------ " )
        
        let mediaType = info[.mediaType] as! NSString
        if UTTypeEqual(mediaType, kUTTypeImage) {
            let originalImage = info[.originalImage] as! UIImage
            let editedImage = info[.editedImage] as? UIImage
            let selectedImage = editedImage ?? originalImage
            imageView.image = selectedImage
//        imageView.image = originalImage
            
            if picker.sourceType == .camera {   // camera로 사진을 찍었을 때만 저장
                UIImageWriteToSavedPhotosAlbum(selectedImage, nil, nil, nil)
            }
            
        } else if UTTypeEqual(mediaType, kUTTypeMovie) {
            print("Video info :", info)
            if let mediaPath = (info[.mediaURL] as? NSURL)?.path,
                UIVideoAtPathIsCompatibleWithSavedPhotosAlbum(mediaPath) {
                UISaveVideoAtPathToSavedPhotosAlbum(mediaPath, nil, nil, nil)
            }
        }
        
        picker.dismiss(animated: true)
    }
}
