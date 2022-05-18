//
//  LogInViewController.swift
//  Navigation
//
//  Created by Никита Базанков on 16.05.2022.
//

import UIKit

extension UIColor {
   convenience init(red: Int, green: Int, blue: Int) {
       assert(red >= 0 && red <= 255, "Invalid red component")
       assert(green >= 0 && green <= 255, "Invalid green component")
       assert(blue >= 0 && blue <= 255, "Invalid blue component")

       self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
   }

   convenience init(rgb: Int) {
       self.init(
           red: (rgb >> 16) & 0xFF,
           green: (rgb >> 8) & 0xFF,
           blue: rgb & 0xFF
       )
   }
}

class LogInViewController: UIViewController {

    private let notificationCenter = NotificationCenter.default

    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()

    private let contentView: UIView = {
        let contentView = UIView()
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.backgroundColor = .white
        return contentView
    }()

    private lazy var vkImage: UIImageView = {
        let logoImage = UIImage(named: "logo")
        var vkImage = UIImageView(image: logoImage)
        vkImage.translatesAutoresizingMaskIntoConstraints = false
        return vkImage
    }()

    private lazy var loginTextField: UITextField = {
        let login = UITextField()
        login.backgroundColor = .systemGray6
        login.textColor = .black
        login.font = .systemFont(ofSize: 16, weight: .regular)
        login.autocapitalizationType = .none
        login.layer.borderColor = UIColor.lightGray.cgColor
        login.layer.borderWidth = 0.5
        login.layer.cornerRadius = 10
        login.translatesAutoresizingMaskIntoConstraints = false
        return login
    }()

    private lazy var passwordTextField: UITextField  = {
        let password = UITextField()
        password.isSecureTextEntry = true
        password.backgroundColor = .systemGray6
        password.textColor = .black
        password.font = .systemFont(ofSize: 16, weight: .regular)
        password.autocapitalizationType = .none
        password.layer.borderColor = UIColor.lightGray.cgColor
        password.layer.borderWidth = 0.5
        password.layer.cornerRadius = 10
        password.translatesAutoresizingMaskIntoConstraints = false
        return password
    }()

    private lazy var textFieldStack: UIStackView = {
        let textFieldStack = UIStackView()
        textFieldStack.axis = .vertical
        textFieldStack.spacing = 0
        textFieldStack.distribution = .fillEqually
        textFieldStack.translatesAutoresizingMaskIntoConstraints = false
        return textFieldStack
    }()

    private lazy var loginButton: UIButton = {
        let button = UIButton()
        let color = UIColor(rgb: 0x4885CC)
        button.backgroundColor = color
        button.addTarget(self, action: #selector(self.didTapButton), for: .touchUpInside)
        button.setTitle("Войти", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 10
        button.layer.masksToBounds = false
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override func viewDidLoad() {
         super.viewDidLoad()

        view.backgroundColor = .white
        self.navigationController?.navigationBar.isHidden = true
        self.setupView()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        notificationCenter.addObserver(self, selector: #selector(keyboardShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        notificationCenter.addObserver(self, selector: #selector(keyboardHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        notificationCenter.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        notificationCenter.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }

    @objc func keyboardShow(notification: NSNotification) {

        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            scrollView.contentInset.bottom = keyboardSize.height
            scrollView.verticalScrollIndicatorInsets = UIEdgeInsets(top: 0, left: 0, bottom: keyboardSize.height, right: 0)
        }
    }

    @objc func keyboardHide() {
        scrollView.contentInset = .zero
        scrollView.verticalScrollIndicatorInsets = .zero
    }


    private func setupView() {
        self.view.addSubview(scrollView)
        self.scrollView.addSubview(contentView)
        contentView.addSubview(self.loginButton)
        contentView.addSubview(self.vkImage)
        contentView.addSubview(self.textFieldStack)
        self.textFieldStack.addArrangedSubview(loginTextField)
        self.textFieldStack.addArrangedSubview(passwordTextField)

        let topButtonConstraint = self.loginButton.topAnchor.constraint(equalTo: self.textFieldStack.bottomAnchor, constant: 16)
        let heightButtonConstraint = self.loginButton.heightAnchor.constraint(equalToConstant: 50)
        let leadingBButtonConstraint = self.loginButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20)
        let trailingButtonConstratint = self.loginButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20)
        let bottomButtonConstraint = self.loginButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)

        let topImageConstraint = self.vkImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 120)
        let heightImage = self.vkImage.heightAnchor.constraint(equalToConstant: 100)
        let widthImage = self.vkImage.widthAnchor.constraint(equalToConstant: 100)
        let leadingImageConstraint = self.vkImage.leadingAnchor.constraint(equalTo: contentView.centerXAnchor, constant: -50)

        let topStackConstraint = self.textFieldStack.topAnchor.constraint(equalTo: self.vkImage.bottomAnchor, constant: 120)
        let leadingStackConstraint = self.textFieldStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16)
        let trailingStackConstraint = self.textFieldStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16)
        let heigthStack = self.textFieldStack.heightAnchor.constraint(equalToConstant: 100)

        let topScrollConstraint = self.scrollView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor)
        let bottomScrollConstraint = self.scrollView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor)
        let leadingScrollConstraint = self.scrollView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor)
        let trailingScrollConstraont = self.scrollView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)

        let topContentConstraint = self.contentView.topAnchor.constraint(equalTo: scrollView.topAnchor)
        let bottomContentConstraint = self.contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor)
        let leadingContentConstraint = self.contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor)
        let trailingContentConstraint = self.contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor)
        let widthContent = self.contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)

        NSLayoutConstraint.activate([topButtonConstraint, heightButtonConstraint, leadingBButtonConstraint, trailingButtonConstratint, bottomButtonConstraint,
                                    topImageConstraint, heightImage, widthImage, leadingImageConstraint,
                                    topStackConstraint, leadingStackConstraint, trailingStackConstraint, heigthStack,
                                    topScrollConstraint, bottomScrollConstraint, leadingScrollConstraint, trailingScrollConstraont,
                                    topContentConstraint, bottomContentConstraint, leadingContentConstraint, trailingContentConstraint, widthContent].compactMap( { $0 } ))

    }

    @objc private func didTapButton() {

        let profileViewController = ProfileViewController()
        self.navigationController?.pushViewController(profileViewController, animated: true)

    }

}

extension LogInViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
        return true
    }
}
