//
//  ImageStringPair.swift
//  StudyProject
//
//  Created by Stanislav on 02.02.2025.
//

import UIKit

var contentList = [
    Post(title: "Post 1", image: UIImage(named: "Image"), description: "True story"),
    Post(title: "Post 2", image: UIImage(named: "Image_1"), description: "What Are Stock Photos? (9 Examples & How to Use Them)"),
    Post(title: "Post 3", image: UIImage(named: "Image_2"), description: "Young Businessman With Gun Pointed At Laptop Stock Photo"),
]

struct Post {
    let title: String
    let image: UIImage?
    let description: String
}
