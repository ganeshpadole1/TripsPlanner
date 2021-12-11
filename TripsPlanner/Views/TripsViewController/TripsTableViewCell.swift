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
    
    override func awakeFromNib() {
        super.awakeFromNib()

        cardView.addShadowAndRoundedCorners()
    }

    func setup(tripModel: TripModel) {
        titleLabel.text = tripModel.title
    }
}
