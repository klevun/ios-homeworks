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
        author.translatesAutoresizingMaskIntoConstraints = false
        return author
    }()

    private lazy var textView: UITextView = {
        let description = UITextView()
        description.translatesAutoresizingMaskIntoConstraints = false
        return description
    }()

    private lazy var likesLabel: UILabel = {
        let likes = UILabel()
        likes.translatesAutoresizingMaskIntoConstraints = false
        return likes
    }()

    private lazy var viewsLabel: UILabel = {
        let views = UILabel()
        views.translatesAutoresizingMaskIntoConstraints = false
        return views
    }()

    private lazy var postImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
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
//        likesLabel.text = post.likes
//        viewsLabel.text = post.views
    }

    private func layout() {
        contentView.addSubview(authorLabel)
        contentView.addSubview(textView)
        contentView.addSubview(likesLabel)
        contentView.addSubview(viewsLabel)
        contentView.addSubview(postImage)

        let topAuthorConstraint = self.authorLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0)
        let bottomAuthorConstraint = self.authorLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0)
        let leadingAuthorConstraint = self.authorLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0)
        let trailingAuthorConstraint = self.authorLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0)

        let topImageConstraint = self.postImage.topAnchor.constraint(equalTo: <#T##NSLayoutAnchor<NSLayoutYAxisAnchor>#>, constant: <#T##CGFloat#>)
        let bottomImageConstraint = self.postImage.bottomAnchor.constraint(equalTo: <#T##NSLayoutAnchor<NSLayoutYAxisAnchor>#>, constant: <#T##CGFloat#>)
        let leadingImageConstraint = self.postImage.leadingAnchor.constraint(equalTo: <#T##NSLayoutAnchor<NSLayoutXAxisAnchor>#>, constant: <#T##CGFloat#>)
        let trailingImageConstraint = self.postImage.trailingAnchor.constraint(equalTo: <#T##NSLayoutAnchor<NSLayoutXAxisAnchor>#>, constant: <#T##CGFloat#>)

        let topTextConstraint = self.textView.topAnchor.constraint(equalTo: <#T##NSLayoutAnchor<NSLayoutYAxisAnchor>#>, constant: <#T##CGFloat#>)
        let bottomTextConstraint = self.textView.bottomAnchor.constraint(equalTo: <#T##NSLayoutAnchor<NSLayoutYAxisAnchor>#>, constant: <#T##CGFloat#>)
        let leadingTextConstraint = self.textView.leadingAnchor.constraint(equalTo: <#T##NSLayoutAnchor<NSLayoutXAxisAnchor>#>, constant: <#T##CGFloat#>)
        let trailingTextConstraint = self.textView.trailingAnchor.constraint(equalTo: <#T##NSLayoutAnchor<NSLayoutXAxisAnchor>#>, constant: <#T##CGFloat#>)

        let topLikesConstraint = self.likesLabel.topAnchor.constraint(equalTo: <#T##NSLayoutAnchor<NSLayoutYAxisAnchor>#>, constant: <#T##CGFloat#>)
        let bottomLikesConstraint = self.likesLabel.bottomAnchor.constraint(equalTo: <#T##NSLayoutAnchor<NSLayoutYAxisAnchor>#>, constant: <#T##CGFloat#>)
        let leadingLikesConstraint = self.likesLabel.leadingAnchor.constraint(equalTo: <#T##NSLayoutAnchor<NSLayoutXAxisAnchor>#>, constant: <#T##CGFloat#>)
        let trailingLikesConstraint = self.likesLabel.trailingAnchor.constraint(equalTo: <#T##NSLayoutAnchor<NSLayoutXAxisAnchor>#>, constant: <#T##CGFloat#>)

        let topViewsConstraint = self.viewsLabel.topAnchor.constraint(equalTo: <#T##NSLayoutAnchor<NSLayoutYAxisAnchor>#>, constant: <#T##CGFloat#>)
        let bottomViewsConstraint = self.viewsLabel.bottomAnchor.constraint(equalTo: <#T##NSLayoutAnchor<NSLayoutYAxisAnchor>#>, constant: <#T##CGFloat#>)
        let leadingViewsConstraint = self.viewsLabel.leadingAnchor.constraint(equalTo: <#T##NSLayoutAnchor<NSLayoutXAxisAnchor>#>, constant: <#T##CGFloat#>)
        let trailingViewsConstraint = self.viewsLabel.trailingAnchor.constraint(equalTo: <#T##NSLayoutAnchor<AnchorType>#>, constant: <#T##CGFloat#>)

        NSLayoutConstraint.activate([topAuthorConstraint, bottomAuthorConstraint, leadingAuthorConstraint, trailingAuthorConstraint].compactMap( { $0 } ))
    }
}
