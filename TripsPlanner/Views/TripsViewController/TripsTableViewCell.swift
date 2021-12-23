//
//  TripsTableViewCell.swift
//  TripsPlanner
//
//  Created by ganesh padole on 11/12/21.
//

import UIKit

class TripsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var tripImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()

        cardView.addShadowAndRoundedCorners()
        titleLabel.font = UIFont(name: Theme.mainFontName, size: 32)
        backgroundColor = .clear
        tripImageView.layer.cornerRadius = 10
    }

    func setup(tripModel: TripModel) {
        titleLabel.text = tripModel.title
        tripImageView.image = tripModel.image
    }
}
