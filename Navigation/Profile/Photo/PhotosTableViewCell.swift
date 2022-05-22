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
        label.tintColor = .black
        label.font = .systemFont(ofSize: 24, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var arrowImage: UIImageView = {
        let image = UIImageView(image: UIImage(systemName: "arrow.right"))
        image.tintColor = .black
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()

    private lazy var firstImage: UIImageView = {
        let image = UIImageView(image: UIImage(named: "1"))
        image.clipsToBounds = true
        image.layer.cornerRadius = 6
        image.contentMode = .scaleAspectFill
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()

    private lazy var secondImage: UIImageView = {
        let image = UIImageView(image: UIImage(named: "2"))
        image.clipsToBounds = true
        image.layer.cornerRadius = 6
        image.contentMode = .scaleAspectFill
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()

    private lazy var thirdImage: UIImageView = {
        let image = UIImageView(image: UIImage(named: "5"))
        image.clipsToBounds = true
        image.layer.cornerRadius = 6
        image.contentMode = .scaleAspectFill
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()

    private lazy var fourthImage: UIImageView = {
        let image = UIImageView(image: UIImage(named: "6"))
        image.clipsToBounds = true
        image.layer.cornerRadius = 6
        image.contentMode = .scaleAspectFill
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()

    private lazy var imageStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.distribution = .fillEqually
        stack.spacing = 8
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
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
        contentView.addSubview(imageStack)
        imageStack.addArrangedSubview(firstImage)
        imageStack.addArrangedSubview(secondImage)
        imageStack.addArrangedSubview(thirdImage)
        imageStack.addArrangedSubview(fourthImage)

        let topLabelConstraint = self.photoLabel.topAnchor.constraint(equalTo: self.contentView.safeAreaLayoutGuide.topAnchor, constant: 12)
        let leadingLabelConstraint = self.photoLabel.leadingAnchor.constraint(equalTo: self.contentView.safeAreaLayoutGuide.leadingAnchor, constant: 12)

        let trailingArrowConstraint = self.arrowImage.trailingAnchor.constraint(equalTo: self.contentView.safeAreaLayoutGuide.trailingAnchor, constant: -12)
        let yCenterArrow = self.arrowImage.centerYAnchor.constraint(equalTo: self.photoLabel.centerYAnchor)

        let topStackConstraint = self.imageStack.topAnchor.constraint(equalTo: self.photoLabel.bottomAnchor, constant: 12)
        let bottomStackConstraint = self.imageStack.bottomAnchor.constraint(equalTo: self.contentView.safeAreaLayoutGuide.bottomAnchor, constant: 12)
        let leadingStackConstraint = self.imageStack.leadingAnchor.constraint(equalTo: self.contentView.safeAreaLayoutGuide.leadingAnchor, constant: 8)
        let trailingStackConstraint = self.imageStack.trailingAnchor.constraint(equalTo: self.contentView.safeAreaLayoutGuide.trailingAnchor, constant: -12)
        let heightStack = self.fourthImage.heightAnchor.constraint(equalToConstant: (UIScreen.main.bounds.width - (12 * 2 + 12 * 3)) / 4)

        NSLayoutConstraint.activate([topLabelConstraint, leadingLabelConstraint,
                                     trailingArrowConstraint, yCenterArrow,
                                     topStackConstraint, bottomStackConstraint, leadingStackConstraint, trailingStackConstraint, heightStack].compactMap( { $0 } ))
    }
}
