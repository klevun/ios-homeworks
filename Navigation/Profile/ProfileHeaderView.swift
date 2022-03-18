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
        let profileImage = UIImage(named: "pic")
        var imageView = UIImageView(image: profileImage)
        imageView.clipsToBounds = true
        imageView.layer.borderWidth = 3
        imageView.layer.borderColor = UIColor.white.cgColor
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = 75
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private lazy var nameLabel: UILabel = {
        let nameLabel = UILabel()
        nameLabel.textColor = .black
        nameLabel.text = "Какое-то имя"
        nameLabel.font = .systemFont(ofSize: 18, weight: .bold)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        return nameLabel
    }()

    private lazy var statusLabel: UILabel = {
        let statusLabel = UILabel()
        statusLabel.textColor = .gray
        statusLabel.font = .systemFont(ofSize: 14, weight: .regular)
        statusLabel.text = "Какой-то статус"
        statusLabel.translatesAutoresizingMaskIntoConstraints = false
        return statusLabel
    }()

    private lazy var textField: UITextField = {
        let textField = UITextField()
        textField.isHidden = true
        textField.font = .systemFont(ofSize: 15, weight: .regular)
        textField.textColor = .black
        textField.backgroundColor = .white
        textField.clipsToBounds = true
        textField.layer.cornerRadius = 12
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.black.cgColor
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.addTarget(self, action: #selector(self.statusTextChanged), for: .editingChanged)
        return textField
    }()


    private lazy var statusButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(.white, for: .normal)
        button.setTitle("Установить статус", for: .normal)
        button.backgroundColor = .systemBlue
        button.clipsToBounds = true
        button.layer.cornerRadius = 4
        button.layer.masksToBounds = false
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOffset = CGSize(width: 4, height: 4)
        button.layer.shadowOpacity = 0.7
        button.layer.shadowRadius = 4
        button.addTarget(self, action: #selector(self.didTapButton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private var buttonTopConstraint: NSLayoutConstraint?
    private var statusText = String()

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
        let topStatusLabelConstraint = self.statusLabel.topAnchor.constraint(equalTo: self.nameLabel.bottomAnchor, constant: 80)

        self.buttonTopConstraint = self.statusButton.topAnchor.constraint(equalTo: self.imageView.bottomAnchor, constant: 16)
        let leadingButtonConstraint = self.statusButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16)
        let trailingButtonConstraint = self.statusButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16)
        let buttonHeight = self.statusButton.heightAnchor.constraint(equalToConstant: 50)


        NSLayoutConstraint.activate([topImageConstraint, leadingImageConstraint, heightImageConstraint, widthImageConstraint,
                                     topNameConstraint, leadingNameConstraint, trailingNameConstraint,
                                     leadingStatusLabelConstraint, trailingStatusLabelConstraint, topStatusLabelConstraint,
                                     self.buttonTopConstraint, leadingButtonConstraint, trailingButtonConstraint, buttonHeight
        ].compactMap({ $0 }))
    }

    @objc private func didTapButton() {

//        print(statusLabel.text!)
//        это для основного задания. ниже = дополнительное

        if self.textField.isHidden {
            self.addSubview(self.textField)

            self.buttonTopConstraint?.isActive = false

            let topTextFieldConstraint = self.textField.topAnchor.constraint(equalTo: self.statusLabel.bottomAnchor, constant: 10)
            let leadingTextFieldConstraint = self.textField.leadingAnchor.constraint(equalTo: self.imageView.trailingAnchor, constant: 15)
            let trailingTextFieldConstraint = self.textField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16)
            let heightTextFieldConstraint = self.textField.heightAnchor.constraint(equalToConstant: 40)

            self.buttonTopConstraint = self.statusButton.topAnchor.constraint(equalTo: self.textField.bottomAnchor, constant: 20)

            NSLayoutConstraint.activate([
                                        topTextFieldConstraint, leadingTextFieldConstraint, trailingTextFieldConstraint, heightTextFieldConstraint,
                                        self.buttonTopConstraint].compactMap( { $0 } ))
        } else {

            self.textField.removeFromSuperview()
            self.buttonTopConstraint = self.statusButton.topAnchor.constraint(equalTo: self.imageView.bottomAnchor, constant: 16)
            NSLayoutConstraint.activate([self.buttonTopConstraint].compactMap( { $0 } ))
        }

        self.delegate?.didTapStatusButton(textFieldIsVisible: self.textField.isHidden) { [weak self] in
            self?.textField.isHidden.toggle()
        }
    }

    @objc func statusTextChanged(_ textField: UITextField) {
        statusText
    }

}


