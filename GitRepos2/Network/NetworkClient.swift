//
//  NetworkClient.swift
//  GitRepos2
//
//  Created by Douglas Barbosa on 03/01/17.
//  Copyright © 2017 helabs. All rights reserved.
//

import RxSwift
import Moya
import ObjectMapper

struct NetworkClient {
    
    fileprivate let networkProvider: RxMoyaProvider<MultiTarget>
    
    init(provider: RxMoyaProvider<MultiTarget> = RxMoyaProvider<MultiTarget>(plugins: [NetworkLoggerPlugin()])) {
        self.networkProvider = provider
    }
    
}

// MARK: GithubSearchRepositoriesRestApi

extension NetworkClient {
    
    func searchRepositories(nextPageTrigger: Observable<Void>) -> Observable<[Repository]> {
        return searchRespositories([], page: 1, nextPageTrigger: nextPageTrigger)
            .startWith([])
            .shareReplay(1)
    }
    
    fileprivate func searchRespositories(_ loadedSoFar: [Repository], page: Int, nextPageTrigger: Observable<Void>) -> Observable<[Repository]> {
        return loadRepositoriesPage(page).flatMap { repositories -> Observable<[Repository]> in
            var loadedRepositories = loadedSoFar
            loadedRepositories.append(contentsOf: repositories)
            
            return Observable.concat([
                Observable.just(loadedRepositories),
                Observable.never().takeUntil(nextPageTrigger),
                self.searchRespositories(loadedRepositories, page: (page + 1), nextPageTrigger: nextPageTrigger)
                ])
        }
    }
    
    func loadRepositoriesPage(_ page: Int) -> Observable<[Repository]> {
        return networkProvider
            .request(MultiTarget(GithubSearchRepositoriesRestApi.repositories(page)))
            .mapJSON()
            .map { (json) in
                guard let json = json as? [String: Any] else { return [] }
                guard let items = json["items"] else { return [] }
                
                return Mapper<Repository>().mapArray(JSONObject: items) ?? []
        }
    }
    
}

extension NetworkClient {
    
    func loadPullRequest(forRepo repo: String, owner: String) -> Observable<[PullRequest]> {
        return networkProvider
            .request(MultiTarget(GithubReposRestApi.pullRequests(owner: owner, repo: repo)))
            .mapJSON()
            .map { (json) in
                return Mapper<PullRequest>().mapArray(JSONObject: json) ?? []
        }
    }
    
}
extension NetworkClient {
    
    func loadPullRequestDetail(forRepo repo: String, owner: String, number: Int) -> Observable<PullRequestDetail> {
        return networkProvider
            .request(MultiTarget(GithubReposRestApi.pullRequestDetail(owner: owner, repo: repo, number: number)))
            .mapJSON()
            .map { (json) in
                return Mapper<PullRequestDetail>().map(JSONObject: json) ?? PullRequestDetail()
        }
    }
    
}
