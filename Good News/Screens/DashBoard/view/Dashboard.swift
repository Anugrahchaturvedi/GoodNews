//
//  Dashboard.swift
//  Good News
//
//  Created by user on 12/12/23.
//

import UIKit

class Dashboard: UIViewController{
    
    @IBOutlet var dashboardTable: UITableView!
    private var article: ParentNewsViewModel!
    override func viewDidLoad() {
        super.viewDidLoad()
        dashboardTable.register(UINib(nibName: "NewCell", bundle: nil), forCellReuseIdentifier: "NewCell")
        setup()
        
    }
    private func setup(){
        self.navigationController?.navigationBar.prefersLargeTitles = true
        APICaller.shared.fetchNews(url: Constant.API.newsURL) { response in
            switch response {
            case .success(let art):
                self.article = ParentNewsViewModel(articles: art)
                DispatchQueue.main.async {
                    self.dashboardTable.reloadData()
                }
            case .failure(let error):
                print(error)
            }
        }
    }

}
extension Dashboard: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.article == nil ? 0 : article.numberofSection()
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.article.numberofRowInSection(section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "NewCell", for: indexPath) as? NewCell else {return UITableViewCell()}
        let article = article.articleAtIndex(indexPath.row)
        cell.coverImage.setImage(with: article.url)
        cell.coverTitle.text = article.title
        cell.coverDesc.text =  article.desc
        cell.coverAuthor.text  = article.author
        return cell;
    }
}
