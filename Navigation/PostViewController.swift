//
//  PostViewController.swift
//  Navigation
//
//  Created by Никита Базанков on 22.02.2022.
//

import UIKit

class PostViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemMint
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationItem.title = FeedViewController.post.title

        let barButton = UIBarButtonItem(barButtonSystemItem: .bookmarks, target: self, action: #selector(infoViewController))

        navigationItem.rightBarButtonItem = barButton

    }

    @objc func infoViewController() {
        let infoViewController = InfoViewController()
        self.present(infoViewController, animated: true, completion: nil)
    }

}
