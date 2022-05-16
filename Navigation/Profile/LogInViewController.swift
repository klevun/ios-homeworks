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

    private lazy var vkImage: UIImageView = {
        let logoImage = UIImage(named: "logo")
        var vkImage = UIImageView(image: logoImage)
        vkImage.center = view.center
        vkImage.translatesAutoresizingMaskIntoConstraints = false
        return vkImage
    }()

    private lazy var loginTextField: UITextField = {
        let login = UITextField()
        login.backgroundColor = .systemGray
        login.textColor = .black
//        login.font = .systemFont(ofSize: 16, weight: normal)
//        login.tintColor = .accentColor
        login.autocapitalizationType = .none
        login.layer.borderColor = UIColor.lightGray.cgColor
        login.layer.borderWidth = 0.5
        login.layer.cornerRadius = 10
        login.translatesAutoresizingMaskIntoConstraints = false
        return login
    }()

    private lazy var passwordTextField: UITextField  = {
        let password = UITextField()
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
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override func viewDidLoad() {
         super.viewDidLoad()

        view.backgroundColor = .white
        self.navigationController?.navigationBar.isHidden = true
        self.setupView()
    }

    private func setupView() {
        self.view.addSubview(self.loginButton)
        self.view.addSubview(self.vkImage)
        self.view.addSubview(self.textFieldStack)
        self.textFieldStack.addArrangedSubview(loginTextField)
        self.textFieldStack.addArrangedSubview(passwordTextField)

        let topButtonConstraint = self.loginButton.topAnchor.constraint(equalTo: self.textFieldStack.bottomAnchor, constant: 16)
        let heightButtonConstraint = self.loginButton.heightAnchor.constraint(equalToConstant: 50)
        let leadingBButtonConstraint = self.loginButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20)
        let trailingButtonConstratint = self.loginButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20)

        let topImageConstraint = self.vkImage.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 120)
        let heightImage = self.vkImage.heightAnchor.constraint(equalToConstant: 100)
        let widthImage = self.vkImage.widthAnchor.constraint(equalToConstant: 100)

        let topStackConstraint = self.textFieldStack.topAnchor.constraint(equalTo: self.vkImage.bottomAnchor, constant: 120)
        let leadingStackConstraint = self.textFieldStack.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 16)
        let trailingStackConstraint = self.textFieldStack.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -16)
        let heigthStack = self.textFieldStack.heightAnchor.constraint(equalToConstant: 100)

        NSLayoutConstraint.activate([topButtonConstraint, heightButtonConstraint, leadingBButtonConstraint, trailingButtonConstratint,
                                    topImageConstraint, heightImage, widthImage,
                                    topStackConstraint, leadingStackConstraint, trailingStackConstraint, heigthStack].compactMap( { $0 } ))

    }

}
