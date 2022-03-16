//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Никита Базанков on 09.03.2022.
//

import UIKit

protocol ProfileHeaderViewProtocol: AnyObject {
    func didTapStatusButton(textFieldIsVisible: Bool, completion: @escaping () -> Void)
}

class ProfileHeaderView: UIView {

    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.backgroundColor = .red
        imageView.layer.borderWidth = 3
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private lazy var nameLabel: UILabel = {
        let nameLabel = UILabel()
        nameLabel.textColor = .black
        nameLabel.text = "Okay"
        nameLabel.backgroundColor = .systemBrown
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        return nameLabel
    }()

    private lazy var statusLabel: UILabel = {
        let statusLabel = UILabel()
        statusLabel.backgroundColor = .white
        statusLabel.text = "Not Okay"
        statusLabel.translatesAutoresizingMaskIntoConstraints = false
        return statusLabel
    }()

    private lazy var textField: UITextField = {
        let textField = UITextField()
        textField.isHidden = true
        textField.backgroundColor = .systemYellow
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()


    private lazy var statusButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(.white, for: .normal)
        button.setTitle("Установить статус", for: .normal)
        button.backgroundColor = .systemBlue
        button.clipsToBounds = true
        button.layer.cornerRadius = 4
        button.addTarget(self, action: #selector(self.didTapButton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()


    weak var delegate: ProfileHeaderViewProtocol?

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.drawSelf()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        fatalError("init(coder:) has not been implemented")
    }

    private func drawSelf() {

        self.addSubview(self.statusButton)
        self.addSubview(self.textField)
        self.addSubview(self.imageView)
        self.addSubview(self.nameLabel)
        self.addSubview(self.statusLabel)

        let topImageConstraint = self.imageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 16)
        let leadingImageConstraint = self.imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16)
        let heightImageConstraint = self.imageView.heightAnchor.constraint(equalToConstant: 150)
        let widthImageConstraint = self.imageView.widthAnchor.constraint(equalToConstant: 150)

        let topNameConstraint = self.nameLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 27)
        let leadingNameConstraint = self.nameLabel.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 10)
        let trailingNameConstraint = self.nameLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16)

        let leadingStatusLabelConstraint = self.statusLabel.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 10)
        let trailingStatusLabelConstraint = self.statusLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16)
        let bottomStatusLabelConstraint = self.statusLabel.bottomAnchor.constraint(equalTo: self.statusButton.topAnchor, constant: -34)

        let buttonTopConstraint = self.statusButton.topAnchor.constraint(equalTo: self.imageView.bottomAnchor, constant: 16)
        let leadingButtonConstraint = self.statusButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16)
        let trailingButtonConstraint = self.statusButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16)
        let buttonHeight = self.statusButton.heightAnchor.constraint(equalToConstant: 50)


        NSLayoutConstraint.activate([topImageConstraint, leadingImageConstraint, heightImageConstraint, widthImageConstraint,
                                     topNameConstraint, leadingNameConstraint, trailingNameConstraint,
                                     leadingStatusLabelConstraint, trailingStatusLabelConstraint, bottomStatusLabelConstraint,
                                     buttonTopConstraint, leadingButtonConstraint, trailingButtonConstraint, buttonHeight
        ].compactMap({ $0 }))
    }

    @objc private func didTapButton() {

        print(statusLabel.text!)
        
    }

}


