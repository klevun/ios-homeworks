//
//  PostTableViewCell.swift
//  Navigation
//
//  Created by Никита Базанков on 20.05.2022.
//

import UIKit

class PostTableViewCell: UITableViewCell {

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
        description.numberOfLines = 0
        description.translatesAutoresizingMaskIntoConstraints = false
        return description
    }()

    private lazy var likesLabel: UILabel = {
        let likes = UILabel()
        likes.textColor = .black
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
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()

    private lazy var viewsLikesStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.distribution = .equalSpacing
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        layout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupCell(_ post: FeedPosts) {
        authorLabel.text = post.author
        postImage.image = post.image
        textView.text = post.description
        likesLabel.text = "Likes: \(post.likes)"
        viewsLabel.text = "Views: \(post.views)"
    }

    private func layout() {
        contentView.addSubview(authorLabel)
        contentView.addSubview(textView)
        contentView.addSubview(viewsLikesStack)
        viewsLikesStack.addArrangedSubview(likesLabel)
        viewsLikesStack.addArrangedSubview(viewsLabel)
        contentView.addSubview(postImage)

        let topAuthorConstraint = self.authorLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16)
        let leadingAuthorConstraint = self.authorLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16)
        let trailingAuthorConstraint = self.authorLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16)

        let topImageConstraint = self.postImage.topAnchor.constraint(equalTo: self.authorLabel.bottomAnchor, constant: 12)
        let imigeWidth = self.postImage.widthAnchor.constraint(equalTo: self.contentView.widthAnchor)
        let imigeHieght = imigeWidth

        let topTextConstraint = self.textView.topAnchor.constraint(equalTo: self.postImage.bottomAnchor, constant: 16)
        let leadingTextConstraint = self.textView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16)
        let trailingTextConstraint = self.textView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16)

        let topStackConstraint = self.viewsLikesStack.topAnchor.constraint(equalTo: self.textView.bottomAnchor, constant: 16)
        let leadingStackConstraint = self.viewsLikesStack.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 16)
        let trailingStackConstraint = self.viewsLikesStack.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -16)
        let bottomStackConstraint = self.viewsLikesStack.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -16)

        NSLayoutConstraint.activate([topAuthorConstraint, leadingAuthorConstraint, trailingAuthorConstraint,
                                    topTextConstraint, leadingTextConstraint, trailingTextConstraint,
                                    topImageConstraint, imigeWidth, imigeHieght,
                                    topStackConstraint, leadingStackConstraint, trailingStackConstraint, bottomStackConstraint].compactMap( { $0 } ))
    }
}
