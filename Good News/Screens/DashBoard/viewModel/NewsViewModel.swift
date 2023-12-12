//
//  NewsViewModel.swift
//  Good News
//
//  Created by user on 12/12/23.
//

import Foundation


// this is an array of Articles
struct ParentNewsViewModel {
    var articles: [Articles]
}
  
extension ParentNewsViewModel {
    func numberofSection() -> Int {
        return 1
    }
    func numberofRowInSection(_ section: Int) -> Int{
        return articles.count
    }
    
    func articleAtIndex(_ index: Int) -> NewsViewModel {
        let article = articles[index]
        return NewsViewModel(article)
    }
}


// this is single Article
struct NewsViewModel{
    private var article: Articles
}
extension NewsViewModel {
    init(_ article: Articles){
        self.article = article
    }
}

extension NewsViewModel {
    var title: String {
        return article.title ?? ""
    }
    var desc: String {
        return article.description ?? ""
    }
    var url : String {
        return article.urlToImage ?? ""
    }
    var author: String {
        return article.author ?? ""
    }
}
