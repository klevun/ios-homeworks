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
        button.setTitle("первая кнопка", for: .normal)
        button.backgroundColor = .systemBlue
        button.addTarget(self, action: #selector(feedButtonDidTap), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    private lazy var anotherButton: UIButton = {
        let button = UIButton()
        button.setTitle("другая кнопка", for: .normal)
        button.backgroundColor = .systemCyan
        button.addTarget(self, action: #selector(feedButtonDidTap), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private lazy var buttonStack: UIStackView = {
        let buttonStack = UIStackView()
        buttonStack.axis = .vertical
        buttonStack.spacing = 10
        buttonStack.distribution = .fillEqually
        buttonStack.translatesAutoresizingMaskIntoConstraints = false
        return buttonStack
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        self.view.addSubview(self.buttonStack)
        self.buttonStack.addArrangedSubview(self.feedButton)
        self.buttonStack.addArrangedSubview(self.anotherButton)


        let topConstraint = self.buttonStack.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 390)
        let leadingConstraint = self.buttonStack.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 100)
        let trailingConstraint = self.buttonStack.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -100)

        NSLayoutConstraint.activate([topConstraint, leadingConstraint, trailingConstraint].compactMap({ $0 }))

    }

     @objc private func feedButtonDidTap() {
        let postViewController = PostViewController()
         let post = Post(title: "Мой пост")
         postViewController.post = post
         self.navigationController?.pushViewController(postViewController, animated: true)
    }

}
