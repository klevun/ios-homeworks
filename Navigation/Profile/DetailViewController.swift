//
//  DetailViewController.swift
//  Navigation
//
//  Created by Никита Базанков on 27.05.2022.
//

import UIKit

class DetailViewController: UIViewController {

    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()

    private lazy var contentView: UIView = {
        let contentView = UIView()
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.backgroundColor = .white
        return contentView
    }()

    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.textColor = .black
        label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    lazy var postImage: UIImageView = {
        let image = UIImageView()
        image.backgroundColor = .black
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()

    lazy var textLabel: UILabel = {
        let text = UILabel()
        text.numberOfLines = 0
        text.translatesAutoresizingMaskIntoConstraints = false
        return text
    }()

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        self.navigationController?.navigationBar.isHidden = false
        self.navigationController?.navigationBar.prefersLargeTitles = false
        self.navigationItem.title = "Пост"
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        view.backgroundColor = .white
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

        self.navigationController?.navigationBar.isHidden = true
    }

    func setupVC(_ post: FeedPosts) {
        nameLabel.text = post.author
        postImage.image = post.image
        textLabel.text = post.description
    }

    private func setupView() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(nameLabel)
        contentView.addSubview(postImage)
        contentView.addSubview(textLabel)

        let topScrollConstraint = self.scrollView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor)
        let bottomScrollConstraint = self.scrollView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor)
        let leadingScrollConstraint = self.scrollView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor)
        let trailingScrollConstraint = self.scrollView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor)

        let topContentConstraint = self.contentView.topAnchor.constraint(equalTo: self.scrollView.topAnchor)
        let bottomContentConstraint = self.contentView.bottomAnchor.constraint(equalTo: self.scrollView.bottomAnchor)
        let leadingContentConstraint = self.contentView.leadingAnchor.constraint(equalTo: self.scrollView.leadingAnchor)
        let trailingContentConstraint = self.contentView.trailingAnchor.constraint(equalTo: self.scrollView.trailingAnchor)
        let widthContent = self.contentView.widthAnchor.constraint(equalTo: self.scrollView.widthAnchor)

        let topNameConstraint = self.nameLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 15)
        let leadingNameConstraint = self.nameLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 20)
        let trailingNameConstraint = self.nameLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -20)

        let topImageConstraint = self.postImage.topAnchor.constraint(equalTo: self.nameLabel.bottomAnchor, constant: 20)
        let leadingImageConstraint = self.postImage.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor)
        let trailingImageConstraint = self.postImage.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor)

        let topTextConstraint = self.textLabel.topAnchor.constraint(equalTo: self.postImage.bottomAnchor, constant: 20)
        let bottomTextConstraint = self.textLabel.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor)
        let leadingTextConstraint = self.textLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 20)
        let trailingTextConstraint = self.textLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -20)



        NSLayoutConstraint.activate([topScrollConstraint, bottomScrollConstraint, leadingScrollConstraint, trailingScrollConstraint,
                                    topContentConstraint, bottomContentConstraint, leadingContentConstraint, trailingContentConstraint, widthContent,
                                    topNameConstraint, leadingNameConstraint, trailingNameConstraint,
                                    topImageConstraint, leadingImageConstraint, trailingImageConstraint,
                                    topTextConstraint, bottomTextConstraint, leadingTextConstraint, trailingTextConstraint].compactMap( { $0 } ))
    }

}
