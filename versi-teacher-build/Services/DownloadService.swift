//
//  DownloadService.swift
//  versi-teacher-build
//
//  Created by Caleb Stultz on 8/2/17.
//  Copyright © 2017 Caleb Stultz. All rights reserved.
//

import Foundation
import RxSwift
import Alamofire
import AlamofireImage

class DownloadService {
    static let instance = DownloadService()
    
    func downloadTrendingReposDictArray(completion: @escaping (_ reposDictArray: [Dictionary<String, Any>]) -> ()) {
        var trendingReposDictArray = [Dictionary<String, Any>]()
        
        Alamofire.request(trendingRepoUrl).responseJSON { response in
            guard let json = response.result.value as? Dictionary<String, Any> else { return }
            
            guard let repoDictionaryArray = json["items"] as? [Dictionary<String, AnyObject>] else { return }
            
            for repoDict in repoDictionaryArray {
                if trendingReposDictArray.count <= 9 {
                    guard let name = repoDict["name"] as? String,
                        let description = repoDict["description"] as? String,
                        let language = repoDict["language"] as? String,
                        let forksCount = repoDict["forks_count"] as? Int,
                        let repoUrl = repoDict["html_url"] as? String,
                        let contributorsUrl = repoDict["contributors_url"] as? String,
                        let owner = repoDict["owner"] as? Dictionary<String, AnyObject>,
                        let avatarUrl = owner["avatar_url"] as? String else { break }
                    
                    let repoDictionary: Dictionary<String, Any> = ["name": name.uppercased(), "description": description, "language": language, "forksCount": forksCount, "repoUrl": repoUrl, "avatarUrl": avatarUrl, "contributorsUrl": contributorsUrl]
                    
                    trendingReposDictArray.append(repoDictionary)
                } else {
                    break
                }
            }
            completion(trendingReposDictArray)
        }
    }
    
    func downloadImageFor(avatarUrl: String, completion: @escaping (_ image: UIImage) -> ()) {
        Alamofire.request(avatarUrl).responseImage { (imageResponse) in
            completion(imageResponse.result.value!)
        }
        
    }
    
    func downloadContributorsDataFor(contributorsUrl url: String, completion: @escaping (_ contributions: Int) -> Void) {
        Alamofire.request(url).responseJSON { response in
            guard let json = response.result.value as? [Dictionary<String, Any>] else { return }
            if !json.isEmpty {
                let contributions = json[0]["contributions"] as! Int
                completion(contributions)
            }
        }
    }
    
    func downloadTrendingRepo(fromDictionary dictionary: Dictionary<String, Any>, completion: @escaping (_ repo: Repo) -> Void) {
        
        let avatarUrl = dictionary["avatarUrl"] as! String
        let contributorsUrl = dictionary["contributorsUrl"] as! String
        let name = dictionary["name"] as! String
        let description = dictionary["description"] as! String
        let language = dictionary["language"] as! String
        let forksCount = dictionary["forksCount"] as! Int
        let repoUrl = dictionary["repoUrl"] as! String
        
        downloadImageFor(avatarUrl: avatarUrl) { (imageForRepo) in
            self.downloadContributorsDataFor(contributorsUrl: contributorsUrl, completion: { contributions in
                let repo = Repo(image: imageForRepo, name: name, description: description, language: language, numberOfDownloads: forksCount, numberOfContributors: contributions, url: repoUrl)
                completion(repo)
            })
        }
    }
    
    func downloadTrendingRepos(completion: @escaping (_ reposArray: [Repo]) -> ()) {
        self.downloadTrendingReposDictArray { (trendingReposDictArray) in
            var trendingReposArray = [Repo]()
            for dict in trendingReposDictArray {
                self.downloadTrendingRepo(fromDictionary: dict, completion: { (returnedRepo) in
                    if trendingReposArray.count < 9 {
                        trendingReposArray.append(returnedRepo)
                    } else {
                        let sortedRepoArray = trendingReposArray.sorted(by: { (repoA, repoB) -> Bool in
                            if repoA.numberOfDownloads > repoB.numberOfDownloads {
                                return true
                            } else {
                                return false
                            }
                        })
                        completion(sortedRepoArray)
                    }
                })
            }
        }
    }
}

