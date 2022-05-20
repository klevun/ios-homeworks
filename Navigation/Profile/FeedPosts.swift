//
//  FeedPosts.swift
//  Navigation
//
//  Created by Никита Базанков on 18.05.2022.
//

import UIKit

struct FeedPosts {

    let author: String
    let description: String
    let image: UIImage
    let likes: Int
    let views: Int

    static func makePost() -> [FeedPosts] {
        var post = [FeedPosts]()
        post.append(FeedPosts(author: "ewrrwet", description: "dsfv", image: UIImage(named: "kanadskaya")!, likes: 1, views: 2))
        post.append(FeedPosts(author: "rewg", description: "fdsv", image: UIImage(named: "yaichnaya")!, likes: 4, views: 3))
        post.append(FeedPosts(author: "ewrrwet", description: "dsfv", image: UIImage(named: "renklod")!, likes: 10, views: 2))
        post.append(FeedPosts(author: "ewrrwet", description: "dsfv", image: UIImage(named: "stenly")!, likes: 9, views: 54))
        return post
    }
}
