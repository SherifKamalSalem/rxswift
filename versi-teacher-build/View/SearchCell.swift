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
        repoUrl = repo.url
        repoImageView.image = UIImage(named: "gitHubLogo")
        repoNameLbl.text = repo.name
        repoDescLbl.text = repo.description
        repoDownloadsLbl.text = String(describing: repo.numberOfDownloads)
        repoLanguageLbl.text = repo.language
    }
    
    override func layoutSubviews() {
        backView.layer.cornerRadius = 15
        backView.layer.shadowColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        backView.layer.shadowOpacity = 0.25
        backView.layer.shadowRadius = 3.0
        backView.layer.shadowOffset = CGSize(width: 0, height: 0)
    }
}
