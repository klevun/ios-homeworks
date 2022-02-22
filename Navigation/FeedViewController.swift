//
//  FeedViewController.swift
//  Navigation
//
//  Created by Никита Базанков on 22.02.2022.
//

import UIKit

class FeedViewController: UIViewController {

    private lazy var feedButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        self.view.addSubview(self.feedButton)
        self.feedButton.setTitle("Мой пост", for: .normal)
        self.feedButton.setTitleColor(.black, for: .normal)
        self.feedButton.backgroundColor = .systemBlue
        self.feedButton.layer.cornerRadius = 12
        self.feedButton.clipsToBounds = true
        let left = self.feedButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20)
        let right = self.feedButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20)
        let centerY = self.feedButton.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: 340)

        NSLayoutConstraint.activate([left, right, centerY])

        self.feedButton.addTarget(self, action: #selector(feedButtonDidTap), for: .touchUpInside)
    }

     @objc private func feedButtonDidTap() {
        let postViewController = PostViewController()
         self.navigationController?.pushViewController(postViewController, animated: true)
    }

}
