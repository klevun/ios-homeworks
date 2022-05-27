//
//  PostTableViewCell.swift
//  Navigation
//
//  Created by Никита Базанков on 20.05.2022.
//

import UIKit

class PostTableViewCell: UITableViewCell {


    private lazy var backView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private lazy var authorLabel: UILabel = {
        let author = UILabel()
        author.font = .systemFont(ofSize: 20, weight: .bold)
        author.textColor = .black
        author.numberOfLines = 2
        author.translatesAutoresizingMaskIntoConstraints = false
        return author
    }()

    private lazy var textView: UILabel = {
        let description = UILabel()
        description.font = .systemFont(ofSize: 14, weight: .regular)
        description.numberOfLines = 3
        description.translatesAutoresizingMaskIntoConstraints = false
        return description
    }()

    private lazy var likesLabel: UILabel = {
        let likes = UILabel()
        likes.textColor = .black
        likes.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(plusLike)))
        likes.isUserInteractionEnabled = true
        likes.font = .systemFont(ofSize: 16, weight: .regular)
        likes.translatesAutoresizingMaskIntoConstraints = false
        return likes
    }()

    private lazy var viewsLabel: UILabel = {
        let views = UILabel()
        views.textColor = .black
        views.font = .systemFont(ofSize: 16, weight: .regular)
        views.translatesAutoresizingMaskIntoConstraints = false
        return views
    }()

    private lazy var postImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.backgroundColor = .black
        image.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(plusView)))
        image.isUserInteractionEnabled = true
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()

    private lazy var viewsLikesStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.distribution = .equalSpacing
        stack.isUserInteractionEnabled = true
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        layout()
        setupLikeGesture()
    }

    var post: FeedPosts? {
        didSet {
            guard let post = post else { return }
            authorLabel.text = post.author
            postImage.image = post.image
            textView.text = post.description
            likesLabel.text = "Likes: \(post.likes)"
            viewsLabel.text = "Views: \(post.views)"
        }
    }

    var likeTap: ((_ post: FeedPosts) -> ())?
    var viewWatched: ((_ post: FeedPosts) -> ())?

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


    func setupLikeGesture() {
        let likeGesture = UITapGestureRecognizer(target: self, action: #selector(plusLike))
        let viewGesture = UITapGestureRecognizer(target: self, action: #selector(plusView))
        likesLabel.addGestureRecognizer(likeGesture)
        textView.addGestureRecognizer(viewGesture)
    }

    private func layout() {
        contentView.addSubview(backView)
        backView.addSubview(authorLabel)
        backView.addSubview(textView)
        backView.addSubview(viewsLikesStack)
        backView.addSubview(postImage)
        viewsLikesStack.addArrangedSubview(likesLabel)
        viewsLikesStack.addArrangedSubview(viewsLabel)

        let topBackConstraint = self.backView.topAnchor.constraint(equalTo: self.contentView.topAnchor)
        let bottomBackConstraint = self.backView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor)
        let leadingBackConstraint = self.backView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor)
        let trailingBackConstraint = self.backView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor)

        let topAuthorConstraint = self.authorLabel.topAnchor.constraint(equalTo: backView.topAnchor, constant: 16)
        let leadingAuthorConstraint = self.authorLabel.leadingAnchor.constraint(equalTo: backView.leadingAnchor, constant: 16)
        let trailingAuthorConstraint = self.authorLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16)

        let topImageConstraint = self.postImage.topAnchor.constraint(equalTo: self.authorLabel.bottomAnchor, constant: 12)
        let imigeWidth = self.postImage.widthAnchor.constraint(equalTo: self.backView.widthAnchor)
        let imigeHieght = imigeWidth

        let topTextConstraint = self.textView.topAnchor.constraint(equalTo: self.postImage.bottomAnchor, constant: 16)
        let leadingTextConstraint = self.textView.leadingAnchor.constraint(equalTo: backView.leadingAnchor, constant: 16)
        let trailingTextConstraint = self.textView.trailingAnchor.constraint(equalTo: backView.trailingAnchor, constant: -16)

        let topStackConstraint = self.viewsLikesStack.topAnchor.constraint(equalTo: self.textView.bottomAnchor, constant: 16)
        let leadingStackConstraint = self.viewsLikesStack.leadingAnchor.constraint(equalTo: self.backView.leadingAnchor, constant: 16)
        let trailingStackConstraint = self.viewsLikesStack.trailingAnchor.constraint(equalTo: self.backView.trailingAnchor, constant: -16)
        let bottomStackConstraint = self.viewsLikesStack.bottomAnchor.constraint(equalTo: self.backView.bottomAnchor, constant: -16)

        NSLayoutConstraint.activate([topBackConstraint, bottomBackConstraint, trailingBackConstraint, leadingBackConstraint,
                                     topAuthorConstraint, leadingAuthorConstraint, trailingAuthorConstraint,
                                    topTextConstraint, leadingTextConstraint, trailingTextConstraint,
                                    topImageConstraint, imigeWidth, imigeHieght,
                                    topStackConstraint, leadingStackConstraint, trailingStackConstraint, bottomStackConstraint].compactMap( { $0 } ))
    }

    @objc func plusLike() {
        if var post = self.post, post.isLiked == false {
            post.isLiked.toggle()
            post.likes = post.likes + 1
            likesLabel.text = "Likes: \(post.likes)"
            likeTap?(post)
            return
        }

        if var post = self.post, post.isLiked == true {
            post.isLiked.toggle()
            post.likes = post.likes - 1
            likesLabel.text = "Likes: \(post.likes)"
            likeTap?(post)
            return
        }
    }

    @objc func plusView() {
        if var post = self.post, post.isWatched == false {
            post.views = post.views + 1
            viewWatched?(post)
            return
        }
    }
}
