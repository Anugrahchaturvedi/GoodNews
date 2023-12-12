//
//  NewCell.swift
//  Good News
//
//  Created by user on 12/12/23.
//

import UIKit

class NewCell: UITableViewCell {

    @IBOutlet var bgView: UIView!
    @IBOutlet var coverAuthor: UILabel!
    @IBOutlet var coverDesc: UILabel!
    @IBOutlet var coverTitle: UILabel!
    @IBOutlet var coverImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        self.bgView.layer.cornerRadius = 14
    }
}
