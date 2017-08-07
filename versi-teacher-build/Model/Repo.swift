//
//  Repo.swift
//  versi-teacher-build
//
//  Created by Caleb Stultz on 8/2/17.
//  Copyright © 2017 Caleb Stultz. All rights reserved.
//

import UIKit

class Repo {
    public private(set) var image: UIImage
    public private(set) var name: String
    public private(set) var description: String
    public private(set) var language: String
    public private(set) var numberOfDownloads: Int
    public private(set) var numberOfContributors: Int
    public private(set) var url: String

    init(image: UIImage, name: String, description: String, language: String, numberOfDownloads: Int, numberOfContributors: Int, url: String) {
        self.image = image
        self.name = name
        self.description = description
        self.language = language
        self.numberOfDownloads = numberOfDownloads
        self.numberOfContributors = numberOfContributors
        self.url = url
    }
}
