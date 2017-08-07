//
//  SearchCell.swift
//  versi-teacher-build
//
//  Created by Caleb Stultz on 8/2/17.
//  Copyright © 2017 Caleb Stultz. All rights reserved.
//

import UIKit

class SearchCell: UITableViewCell {

    @IBOutlet weak var repoImageView: UIImageView!
    @IBOutlet weak var repoNameLbl: UILabel!
    @IBOutlet weak var repoDescLbl: UILabel!
    @IBOutlet weak var repoDownloadsLbl: UILabel!
    @IBOutlet weak var repoLanguageLbl: UILabel!
    @IBOutlet weak var backView: UIView!
    
    var repoUrl: String?
    
    func configureCell(repo: Repo) {
        self.repoUrl = repo.url
        self.repoImageView.image = UIImage(named: "gitHubLogo")
        self.repoNameLbl.text = repo.name
        self.repoDescLbl.text = repo.description
        self.repoDownloadsLbl.text = String(describing: repo.numberOfDownloads)
        self.repoLanguageLbl.text = repo.language
    }
    
    override func layoutSubviews() {
        self.backView.layer.cornerRadius = 15
    }
}
