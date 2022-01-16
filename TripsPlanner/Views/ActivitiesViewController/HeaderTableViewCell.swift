//
//  HeaderTableViewCell.swift
//  TripsPlanner
//
//  Created by Ganesh Padole on 16/01/22.
//

import UIKit

class HeaderTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()

        titleLabel.font = UIFont(name: Theme.bodyFontNameBold, size: 17)
        subtitleLabel.font = UIFont(name: Theme.bodyFontName, size: 15)
    }

    func setup(model: DayModel) {
        titleLabel.text = model.title
        subtitleLabel.text = model.subtitle
    }

}
