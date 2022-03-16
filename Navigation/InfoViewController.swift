//
//  InfoViewController.swift
//  Navigation
//
//  Created by Никита Базанков on 22.02.2022.
//

import UIKit

class InfoViewController: UIViewController {
    
    private lazy var alertButton: UIButton = {
        let alertButton = UIButton()
        alertButton.translatesAutoresizingMaskIntoConstraints = false
        return alertButton
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        
        view.backgroundColor = .systemGreen
        self.view.addSubview(self.alertButton)
        self.alertButton.setTitle("Внимание", for: .normal)
        self.alertButton.setTitleColor(.black, for: .normal)
        self.alertButton.backgroundColor = .systemBlue
        self.alertButton.layer.cornerRadius = 12
        self.alertButton.clipsToBounds = true
        let left = self.alertButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20)
        let right = self.alertButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20)
        let centerY = self.alertButton.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: 340)
        let height = self.alertButton.heightAnchor.constraint(equalToConstant: 50)

        NSLayoutConstraint.activate([left, right, centerY, height])

        self.alertButton.addTarget(self, action: #selector(alert), for: .touchUpInside)


    }

    @objc private func alert() {

        let alert = UIAlertController(title: "Сообщение", message: "Какое-то предупреждение", preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "Понятно", style: .cancel, handler: nil))
        alert.addAction(UIAlertAction(title: "Ясно", style: .default, handler: nil))

        present(alert, animated: true)
    }

}
