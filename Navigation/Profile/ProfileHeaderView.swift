//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Никита Базанков on 09.03.2022.
//

import UIKit


class ProfileHeaderView: UIView {

    private lazy var imageView: UIImageView = {
        let profileImage = UIImage(named: "pic")
        var imageView = UIImageView(image: profileImage)
        imageView.clipsToBounds = true
        imageView.layer.borderWidth = 3
        imageView.layer.borderColor = UIColor.white.cgColor
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = 75
        imageView.isUserInteractionEnabled = true
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

    private lazy var backgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        view.alpha = 0.0
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private lazy var closeButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .blue
        button.isUserInteractionEnabled = false
        button.isHidden = true
        button.addTarget(self, action: #selector(closePhoto), for: .touchUpInside)
        button.setImage(UIImage(systemName: "multiply.circle"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()


    private var statusText = String()

    override init(frame: CGRect) {
        super.init(frame: frame)
        drawSelf()
        setupGesture()
        self.backgroundColor = .lightGray
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        fatalError("init(coder:) has not been implemented")
    }

    private func setupGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapAction))
        imageView.addGestureRecognizer(tapGesture)
    }

    @objc private func tapAction() {

        UIImageView.animate(withDuration: 3, animations: {
            self.imageView.layer.cornerRadius = 0
            self.imageView.layer.borderWidth = 0
            self.backgroundView.alpha = 0.5
            self.widthImageConstraint.constant = UIScreen.main.bounds.width
            self.heightImageConstraint.constant = UIScreen.main.bounds.width
            self.topImageConstraint.constant = -(UIScreen.main.bounds.midX - UIScreen.main.bounds.width)
            self.closeButton.isHidden = false
            self.closeButton.isUserInteractionEnabled = true
            self.layoutIfNeeded()
        }, completion: { _ in

        })

        self.addSubview(backgroundView)
        self.backgroundView.addSubview(closeButton)
        let top = self.backgroundView.topAnchor.constraint(equalTo: self.topAnchor)
        let lead = self.backgroundView.leadingAnchor.constraint(equalTo: self.leadingAnchor)
        let trail = self.backgroundView.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        let height = self.backgroundView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height)

        let topCloseButtonConstraint = self.closeButton.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 20)
        let trailingCloseButtonConstraint = self.closeButton.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -20)

        NSLayoutConstraint.activate([top, lead, trail, height,
                                    topCloseButtonConstraint, trailingCloseButtonConstraint].compactMap( { $0 } ))
    }

    @objc private func closePhoto() {
        self.imageView.layer.cornerRadius = 75
        self.imageView.layer.borderWidth = 3
        self.backgroundView.alpha = 0.0
        self.closeButton.isHidden = true
        topImageConstraint = self.imageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 16)
        leadingImageConstraint = self.imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16)
        heightImageConstraint = self.imageView.heightAnchor.constraint(equalToConstant: 150)
        widthImageConstraint = self.imageView.widthAnchor.constraint(equalToConstant: 150)

        NSLayoutConstraint.activate([topImageConstraint, leadingImageConstraint, heightImageConstraint, widthImageConstraint])
        self.layoutIfNeeded()
    }

    private var topImageConstraint = NSLayoutConstraint()
    private var leadingImageConstraint = NSLayoutConstraint()
    private var heightImageConstraint = NSLayoutConstraint()
    private var widthImageConstraint = NSLayoutConstraint()

    private func drawSelf() {

        self.addSubview(self.statusButton)
        self.addSubview(self.imageView)
        self.addSubview(self.nameLabel)
        self.addSubview(self.statusLabel)
        self.addSubview(self.textField)

        topImageConstraint = self.imageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 16)
        leadingImageConstraint = self.imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16)
        heightImageConstraint = self.imageView.heightAnchor.constraint(equalToConstant: 150)
        widthImageConstraint = self.imageView.widthAnchor.constraint(equalToConstant: 150)

        let topNameConstraint = self.nameLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 27)
        let leadingNameConstraint = self.nameLabel.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 10)
        let trailingNameConstraint = self.nameLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16)

        let leadingStatusLabelConstraint = self.statusLabel.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 10)
        let trailingStatusLabelConstraint = self.statusLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16)
        let topStatusLabelConstraint = self.statusLabel.topAnchor.constraint(equalTo: self.nameLabel.bottomAnchor, constant: 80)

        let buttonTopConstraint = self.statusButton.topAnchor.constraint(equalTo: self.textField.bottomAnchor, constant: 20)
        let leadingButtonConstraint = self.statusButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16)
        let trailingButtonConstraint = self.statusButton.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -16)
        let buttonHeight = self.statusButton.heightAnchor.constraint(equalToConstant: 50)

        let topTextFieldConstraint = self.textField.topAnchor.constraint(equalTo: self.statusLabel.bottomAnchor, constant: 10)
        let leadingTextFieldConstraint = self.textField.leadingAnchor.constraint(equalTo: self.imageView.trailingAnchor, constant: 15)
        let trailingTextFieldConstraint = self.textField.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -16)
        let heightTextFieldConstraint = self.textField.heightAnchor.constraint(equalToConstant: 40)


        NSLayoutConstraint.activate([topImageConstraint, leadingImageConstraint, heightImageConstraint, widthImageConstraint,
                                     topNameConstraint, leadingNameConstraint, trailingNameConstraint,
                                     leadingStatusLabelConstraint, trailingStatusLabelConstraint, topStatusLabelConstraint,
                                     buttonTopConstraint, leadingButtonConstraint, trailingButtonConstraint, buttonHeight,
                                     topTextFieldConstraint, leadingTextFieldConstraint, trailingTextFieldConstraint, heightTextFieldConstraint
        ].compactMap({ $0 }))
    }

    @objc private func didTapButton() {
        self.endEditing(true)
    }

    @objc func statusTextChanged(_ textField: UITextField) {

        if let text = textField.text {
            statusText = text
            statusLabel.text = statusText
        }
    }

}

