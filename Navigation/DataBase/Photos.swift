//
//  Photo.swift
//  Navigation
//
//  Created by Никита Базанков on 22.05.2022.
//

import UIKit

struct Photos {
    
    let image: UIImage?

    static func showPhoto() -> [Photos] {
        var photo = [Photos]()
        photo.append(Photos(image: UIImage(named: "1")))
        photo.append(Photos(image: UIImage(named: "2")))
        photo.append(Photos(image: UIImage(named: "3")))
        photo.append(Photos(image: UIImage(named: "4")))
        photo.append(Photos(image: UIImage(named: "5")))
        photo.append(Photos(image: UIImage(named: "6")))
        photo.append(Photos(image: UIImage(named: "7")))
        photo.append(Photos(image: UIImage(named: "8")))
        photo.append(Photos(image: UIImage(named: "9")))
        photo.append(Photos(image: UIImage(named: "10")))
        photo.append(Photos(image: UIImage(named: "11")))
        photo.append(Photos(image: UIImage(named: "12")))
        photo.append(Photos(image: UIImage(named: "13")))
        photo.append(Photos(image: UIImage(named: "14")))
        photo.append(Photos(image: UIImage(named: "15")))
        photo.append(Photos(image: UIImage(named: "16")))
        photo.append(Photos(image: UIImage(named: "17")))
        photo.append(Photos(image: UIImage(named: "18")))
        photo.append(Photos(image: UIImage(named: "19")))
        photo.append(Photos(image: UIImage(named: "20")))
        return photo
    }
}
