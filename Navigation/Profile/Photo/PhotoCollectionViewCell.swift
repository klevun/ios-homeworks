//
//  PhotoCollectionViewCell.swift
//  Navigation
//
//  Created by Никита Базанков on 23.05.2022.
//

import UIKit

class PhotosCollectionViewCell: UICollectionViewCell {
    
    private lazy var photosView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupCell(_ cell: Photos) {
        if let image = cell.image {
            photosView.image = image
        } else {
            photosView.image = UIImage(named: "no photo.svg")
        }
    }

    private var xPhotoConstraint = NSLayoutConstraint()
    private var yPhotoConstraint = NSLayoutConstraint()
    private var heightPhoto = NSLayoutConstraint()
    private var widthPhoto = NSLayoutConstraint()

    private func setupView() {
        contentView.addSubview(photosView)

        xPhotoConstraint = self.photosView.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor)
        yPhotoConstraint = self.photosView.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor)
        heightPhoto = self.photosView.heightAnchor.constraint(equalTo: self.contentView.heightAnchor)
        widthPhoto = self.photosView.widthAnchor.constraint(equalTo: self.contentView.widthAnchor)


        NSLayoutConstraint.activate([xPhotoConstraint, yPhotoConstraint, heightPhoto, widthPhoto].compactMap({ $0 }))
    }


}
