//
//  ViewController.swift
//  versi-teacher-build
//
//  Created by Caleb Stultz on 8/2/17.
//  Copyright © 2017 Caleb Stultz. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class TrendingFeedVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    private let refreshControl = UIRefreshControl()
    let dataSource = PublishSubject<[Repo]>()
    var disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.refreshControl = refreshControl
        refreshControl.tintColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        refreshControl.attributedTitle = NSAttributedString(string: "Fetching Hot Github Repos 🔥", attributes: [NSAttributedStringKey.foregroundColor: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), NSAttributedStringKey.font: UIFont(name: "AvenirNext-DemiBold", size: 16.0)!])
        refreshControl.addTarget(self, action: #selector(refreshData(_:)), for: .valueChanged)
        NotificationCenter.default.addObserver(self, selector: #selector(manualRefresh), name: kNotificationReloadAllData, object: nil)
        
        dataSource.bind(to: tableView.rx.items(cellIdentifier: "trendingFeedCell")) { (row, repo: Repo, cell: TrendingFeedCell) in
            cell.configureCell(repo: repo)
        }.addDisposableTo(disposeBag)
    }
        
    @objc func refreshData(_ sender: Any) {
        DownloadService.instance.downloadTrendingRepos { (trendingReposArray) in
            self.dataSource.onNext(trendingReposArray)
            self.refreshControl.endRefreshing()
        }
    }
    
    @objc func manualRefresh() {
        if let refreshControl = self.tableView.refreshControl {
            self.tableView.setContentOffset(CGPoint(x: 0, y: -refreshControl.frame.height), animated: true)
            self.tableView.refreshControl?.beginRefreshing()
            self.tableView.refreshControl?.sendActions(for: .valueChanged)
        }
    }
}
