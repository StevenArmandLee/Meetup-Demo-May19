//
//  UploadImageSectionController.swift
//  IGListKitDemo
//
//  Created by steven lee on 2/5/19.
//  Copyright © 2019 steven lee. All rights reserved.
//

import Foundation
import IGListKit
import UIKit

final class UploadImageSectionModel: NSObject, ListBoundable {
    func boundedSectionController() -> ListSectionController {
        return UploadImageSectionController()
    }
    var currentImage: UIImage?
    let noImageUploadedTitle: String
    let imageUploadedTitle: String
    init(noImageUploadedTitle: String, imageUploadedTitle: String) {
        self.noImageUploadedTitle = noImageUploadedTitle
        self.imageUploadedTitle = imageUploadedTitle
    }
}

extension UploadImageSectionModel {
    override func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
        return self === object ? true : self.isEqual(object)
    }
    
}

final class UploadImageSectionController: ListSectionController {
    
    private var model: UploadImageSectionModel!
    
    override func sizeForItem(at index: Int) -> CGSize {
        let width: CGFloat = collectionContext?.containerSize.width ?? 0
        return CGSize(width: width, height: 56)
    }
    func configureCell(_ cell: UploadImageCell, at index: Int) {
        if let image = model.currentImage {
            cell.imageView.image = image
            cell.titleLabel.text = model.imageUploadedTitle
        } else {
            cell.imageView.image = UIImage(named: "btnAddPhoto")
            cell.titleLabel.text = model.noImageUploadedTitle
        }
    }
    override func cellForItem(at index: Int) -> UICollectionViewCell {
        let cell = dequeCell(type: UploadImageCell.self, atIndex: index)
        configureCell(cell, at: index)
        return cell
    }
    
    override func didUpdate(to object: Any) {
        model = (object as! UploadImageSectionModel)
    }
    
    override func didSelectItem(at index: Int) {
        self.showImagePicker()
        
    }
}

//REMARK upload image handler
extension UploadImageSectionController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    private func showImagePicker() {
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        
        let alertController = UIAlertController(title: "", message: "Upload image", preferredStyle: .actionSheet)
        
        let cameraButton = UIAlertAction(title: "Camera", style: .default, handler: { (_) -> Void in
            if UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.camera) {
                imagePickerController.sourceType =  UIImagePickerController.SourceType.camera
                self.viewController?.present(imagePickerController, animated: true, completion: nil)
            }
        })
        
        let  libraryButton = UIAlertAction(title: "Photo library", style: .default, handler: { (_) -> Void in
            imagePickerController.sourceType =  UIImagePickerController.SourceType.photoLibrary
            self.viewController?.present(imagePickerController, animated: true, completion: nil)
        })
        
        let cancelButton = UIAlertAction(title: "Cancel", style: UIAlertAction.Style.cancel, handler: nil)
        alertController.addAction(cameraButton)
        alertController.addAction(libraryButton)
        alertController.addAction(cancelButton)
        self.viewController?.navigationController?.present(alertController, animated: true, completion: nil)
    }
    
    private func uploadImageData( _ data: Data, onSuccess: @escaping ()-> Void, onError: @escaping ()-> Void) {
        //image upload code
        onSuccess()
    }
    
    private func refreshCell() {
        guard let cell = collectionContext?.cellForItem(at: 0, sectionController: self) as? UploadImageCell else { return }
        configureCell(cell, at: 0)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.presentingViewController?.dismiss(animated: true, completion: nil)
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            let imageData = image.pngData()
            uploadImageData(imageData!, onSuccess: {
                self.model.currentImage = image
                self.refreshCell()
            }, onError: {
               
            })
        }
    }
}
