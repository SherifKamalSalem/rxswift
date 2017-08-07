//
//  Repo.swift
//  versi-teacher-build
//
//  Created by Caleb Stultz on 8/2/17.
//  Copyright © 2017 Caleb Stultz. All rights reserved.
//

import UIKit

class Repo {
    private var _image: UIImage
    private var _name: String
    private var _description: String
    private var _language: String
    private var _numberOfDownloads: Int
    private var _numberOfContributors: Int
    private var _url: String
    
    var image: UIImage {
        return _image
    }
    
    var name: String {
        return _name
    }
    
    var description: String {
        return _description
    }

    var language: String {
        return _language
    }

    var numberOfDownloads: Int {
        return _numberOfDownloads
    }

    var numberOfContributors: Int {
        return _numberOfContributors
    }
    
    var url: String {
        return _url
    }

    init(image: UIImage, name: String, description: String, language: String, numberOfDownloads: Int, numberOfContributors: Int, url: String) {
        self._image = image
        self._name = name
        self._description = description
        self._language = language
        self._numberOfDownloads = numberOfDownloads
        self._numberOfContributors = numberOfContributors
        self._url = url
    }
}
