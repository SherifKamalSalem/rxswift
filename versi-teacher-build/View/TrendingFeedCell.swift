//
//  TrendingFeedCell.swift
//  versi-teacher-build
//
//  Created by Caleb Stultz on 8/2/17.
//  Copyright © 2017 Caleb Stultz. All rights reserved.
//

import UIKit
import SafariServices

class TrendingFeedCell: UITableViewCell {

    @IBOutlet weak var repoImageView: UIImageView!
    @IBOutlet weak var repoNameLbl: UILabel!
    @IBOutlet weak var repoDescLbl: UILabel!
    @IBOutlet weak var numberOfDownloadsLbl: UILabel!
    @IBOutlet weak var languageLbl: UILabel!
    @IBOutlet weak var contributorsLbl: UILabel!
    @IBOutlet weak var backView: UIView!
    
    var repoUrl: String?
    
    func configureCell(repo: Repo) {
        repoImageView.image = repo.image
        repoNameLbl.text = repo.name
        repoDescLbl.text = repo.description
        numberOfDownloadsLbl.text = String(describing: repo.numberOfDownloads)
        languageLbl.text = repo.language
        contributorsLbl.text = String(describing: repo.numberOfContributors)
        repoUrl = repo.url
    }
    
    override func layoutSubviews() {
        backView.layer.cornerRadius = 15
        backView.layer.shadowColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        backView.layer.shadowOpacity = 0.25
        backView.layer.shadowRadius = 5.0
        backView.layer.shadowOffset = CGSize(width: 0, height: 0)
    }
        
    @IBAction func viewReadmeBtnWasPressed(_ sender: UITableViewCell) {
        self.window?.rootViewController?.presentSafariWebViewFor(url: repoUrl!)
    }
    
}
