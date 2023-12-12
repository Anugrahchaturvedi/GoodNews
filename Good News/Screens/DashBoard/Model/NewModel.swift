//
//  NewModel.swift
//  Good News
//
//  Created by user on 12/12/23.
//


import Foundation

struct ArticleList: Decodable {
    let articles : [Articles]
}

struct Articles: Decodable {
    let author: String?
    let title: String?
    let description: String?
    let url: String?
    let urlToImage: String?
    let content: String?
    
}
