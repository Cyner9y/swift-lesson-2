//
//  PhotosCollectionController.swift
//  VkClient
//
//  Created by Yuriy Fedorov on 13.12.2020.
//

import UIKit

private let reuseIdentifier = "Cell"

class PhotosCollectionController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    var photo: UIImage?
    
    @IBAction func goToPhoto(segue: UIStoryboardSegue) {
        guard
            segue.identifier == "goToPhoto",
            let controller = segue.source as? FriendsTableViewController,
            let indexPath = controller.tableView.indexPathForSelectedRow
        else { return }
        let photo = UIImage(named: controller.friends[indexPath.row].avatar)
    }

    // MARK: UICollectionViewDataSource
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotosCell", for: indexPath)
                as? PhotosCell
        else { return UICollectionViewCell() }
        
        cell.photo.image = photo
    
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.bounds.width
        return CGSize(width: width, height: width)
    }
}
