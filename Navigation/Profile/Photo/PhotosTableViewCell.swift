//
//  PhotosTableViewCell.swift
//  Navigation
//
//  Created by Никита Базанков on 22.05.2022.
//

import UIKit

class PhotosTableViewCell: UITableViewCell {

    private lazy var photoLabel: UILabel = {
        let label = UILabel()
        label.text = "Мои Фото"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var arrowImage: UIImageView = {
        let image = UIImageView(image: UIImage(systemName: "arrow.right"))
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()

    private lazy var firstImage: UIImageView = {
        let image = UIImageView(image: UIImage(named: "1"))
        image.layer.cornerRadius = 6
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()

    private lazy var secondImage: UIImageView = {
        let image = UIImageView(image: UIImage(named: "2"))
        image.layer.cornerRadius = 6
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()

    private lazy var thirdImage: UIImageView = {
        let image = UIImageView(image: UIImage(named: "3"))
        image.layer.cornerRadius = 6
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()

    private lazy var fourthImage: UIImageView = {
        let image = UIImageView(image: UIImage(named: "4"))
        image.layer.cornerRadius = 6
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        layout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func layout() {
        contentView.addSubview(photoLabel)
        contentView.addSubview(arrowImage)
        contentView.addSubview(firstImage)
        contentView.addSubview(secondImage)
        contentView.addSubview(thirdImage)
        contentView.addSubview(fourthImage)

        let topLabelConstraint = self.photoLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 12)
        let leadingLabelConstraint = self.photoLabel.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 12)

        let topFirstConstraint = self.firstImage.topAnchor.constraint(equalTo: self.photoLabel.bottomAnchor, constant: 12)
        let bottomFirstConstraint = self.firstImage.bottomAnchor.constraint(equalTo: self.contentView.safeAreaLayoutGuide.bottomAnchor, constant: 12)
        let leadingFirstConstraint = self.firstImage.leadingAnchor.constraint(equalTo: self.contentView.safeAreaLayoutGuide.leadingAnchor, constant: 12)

        let topScondConstraint = self.secondImage.topAnchor.constraint(equalTo: self.photoLabel.bottomAnchor, constant: 12)
        let bottomSecondConstraint = self.secondImage.bottomAnchor.constraint(equalTo: self.contentView.safeAreaLayoutGuide.bottomAnchor, constant: 12)
        let leadingSecondConstraint = self.secondImage.leadingAnchor.constraint(equalTo: self.firstImage.trailingAnchor, constant: 8)

        let topThirdConstraint = self.thirdImage.topAnchor.constraint(equalTo: self.photoLabel.bottomAnchor, constant: 12)
        let bottomThridConstraint = self.thirdImage.bottomAnchor.constraint(equalTo: self.contentView.safeAreaLayoutGuide.bottomAnchor, constant: 12)
        let leadingThirdConstraint = self.thirdImage.leadingAnchor.constraint(equalTo: self.secondImage.trailingAnchor, constant: 8)

        let topForthConstraint = self.fourthImage.topAnchor.constraint(equalTo: self.photoLabel.bottomAnchor, constant: 12)
        let bottomForthConstraint = self.fourthImage.bottomAnchor.constraint(equalTo: self.contentView.safeAreaLayoutGuide.bottomAnchor, constant: 12)
        let leadingForthConstraint = self.fourthImage.leadingAnchor.constraint(equalTo: self.thirdImage.trailingAnchor, constant: 8)
        let trailingForthConstraint = self.fourthImage.trailingAnchor.constraint(equalTo: self.contentView.safeAreaLayoutGuide.trailingAnchor, constant: -12)

        NSLayoutConstraint.activate([topLabelConstraint, leadingLabelConstraint,
                                    topFirstConstraint, leadingFirstConstraint, bottomFirstConstraint,
                                    topScondConstraint, leadingSecondConstraint, bottomSecondConstraint,
                                    topThirdConstraint, leadingThirdConstraint, bottomThridConstraint,
                                    topForthConstraint, leadingForthConstraint, bottomForthConstraint, trailingForthConstraint].compactMap( { $0 } ))
    }
}
