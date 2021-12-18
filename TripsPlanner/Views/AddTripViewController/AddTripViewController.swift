//
//  AddTripViewController.swift
//  TripsPlanner
//
//  Created by ganesh padole on 11/12/21.
//

import UIKit

class AddTripViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var tripTextField: UITextField!
    
    var doneSaving: (() -> ())?
  
    override func viewDidLoad() {
        super.viewDidLoad()

        titleLabel.font = UIFont(name: Theme.mainFontName, size: 24)
    }
       
    @IBAction func cancel(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
    @IBAction func save(_ sender: UIButton) {
        TripFunctions.createTrip(tripModel: TripModel(title: tripTextField.text!))
        if let doneSaving = doneSaving {
            doneSaving()
        }
        dismiss(animated: true)
    }
}
