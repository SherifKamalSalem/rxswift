//
//  SearchVC.swift
//  versi-teacher-build
//
//  Created by Caleb Stultz on 8/2/17.
//  Copyright © 2017 Caleb Stultz. All rights reserved.
//

import UIKit
import RxSwift
import Alamofire
import AlamofireImage
import SafariServices

class SearchVC: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var searchBar: RoundedBorderTextField!
    @IBOutlet weak var tableView: UITableView!
    
    var disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let repoSearchResult = self.searchBar
            .rx
            .text
            .orEmpty
            .debounce(0.3, scheduler: MainScheduler.instance)
            .map { $0.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed) ?? "" }
            .flatMap { (query) -> Observable<[Repo]> in
            if query == "" {
                return Observable<[Repo]>.just([])
            } else {
                let url = URL(string: searchUrl + query)
                var searchRepos = [Repo]()

                return URLSession.shared.rx.json(url: url!).map {
                    let results = $0 as AnyObject
                    let items = results.object(forKey: "items")! as? [Dictionary<String, AnyObject>] ?? []
                    
                    for item in items {
                        guard let name = item["name"] as? String,
                            let description = item["description"] as? String,
                            let language = item["language"] as? String,
                            let forksCount = item["forks_count"] as? Int,
                            let repoUrl = item["html_url"] as? String else { break }
                        
                        let repo = Repo(image: UIImage(named: "gitHubLogo")!, name: name, description: description, language: language, numberOfDownloads: forksCount, numberOfContributors: 0, url: repoUrl)
                        
                        searchRepos.append(repo)
                    }
                    return searchRepos
                }
                .observeOn(MainScheduler.instance)
            }
        }
        
        repoSearchResult.bind(to: tableView.rx.items(cellIdentifier: "searchCell")) { (row, repo: Repo, cell: SearchCell) in
            cell.configureCell(repo: repo)
        }.addDisposableTo(disposeBag)
        
        tableView.rx.setDelegate(self).addDisposableTo(disposeBag)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
        return true
    }
}

extension SearchVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: indexPath) as? SearchCell else { return }
        self.presentSafariWebViewFor(url: cell.repoUrl!)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        view.endEditing(true)
    }
}
