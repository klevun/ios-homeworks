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
    var likes: Int
    var views: Int
    var isLiked: Bool
    var isWatched: Bool

    static func makePost() -> [FeedPosts] {
        var post = [FeedPosts]()
        post.append(FeedPosts(author: "Канадская слива", description: "В отличие от европейских слив, имеющих по 48 хромосом, в канадской (которая относится к американской диплоидной форме) хромосом 16. Очень зимостойкая, выдерживает морозы до -45...-50°С. Цветет позже всех остальных, благодаря этому ей не страшны весенние заморозки. Однако придется позаботиться о нескольких деревьях с одинаковым сроком цветения рядом для перекрестного опыления: к сожалению, канадские сливы не умеют самоопыляться. Известные сорта: 'Терри', 'Текумсеч', 'Де Сото'.", image: UIImage(named: "kanadskaya")!, likes: 0, views: 0, isLiked: false, isWatched: false))
        post.append(FeedPosts(author: "Яичная слива", description: "Название говорит само за себя: плоды яйцевидные, желтого или пурпурного цвета. Отлично подходит для потребления и переработки. Сорта: 'Яичная желтая', 'Яичная красная', 'Яичная синяя'.", image: UIImage(named: "yaichnaya")!, likes: 0, views: 0, isLiked: false, isWatched: false))
        post.append(FeedPosts(author: "Слива Ренклод", description: "О сортах ренклода мы говорили ранее, сейчас только упомяну, что мякоть плотная, очень сочная, сладкая, косточка во многих сортах тоже хорошо отделяется, но ренклоды мало хранятся, совсем не переносят перевозку. Урожай этой группы слив лучше собирать чуть недозрелым.", image: UIImage(named: "renklod")!, likes: 0, views: 0, isLiked: false, isWatched: false))
        post.append(FeedPosts(author: "Слива Стенли", description: "Слива 'Стенли'. Позднеспелый сорт сливы домашней, группа Венгерка", image: UIImage(named: "stenly")!, likes: 0, views: 0, isLiked: false, isWatched: false))
        return post
    }
}
