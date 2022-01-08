//
//  TripsViewController.swift
//  TripsPlanner
//
//  Created by ganesh padole on 10/12/21.
//

import UIKit

class TripsViewController: UIViewController {
    
    @IBOutlet var helpView: UIVisualEffectView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var addButton: FloatingActionButton!
    @IBOutlet weak var emptyTripLabel: UILabel!
    var tripIndexToEdit: Int?
    var seenHelpView = "seenHelpView"

    override func viewDidLoad() {
        super.viewDidLoad()
        
       // title = "Trips"
        view.backgroundColor = Theme.backgroundColor
        tableView.backgroundColor = .clear
        
        tableView.dataSource = self
        tableView.delegate = self
        
        TripFunctions.readTrips { [unowned self] in
            self.checkForHelpView()
        }
        //addButton.createFloatingActionButton()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toAddTripSegue" {
            let popup = segue.destination as! AddTripViewController
            popup.tripIndexToEdit = tripIndexToEdit
            popup.doneSaving = { [weak self] in
                self?.checkForHelpView()
            }
            self.tripIndexToEdit = nil
        }
    }
    
    func checkEmptyMessage() {
        if Data.tripModels.isEmpty {
            self.emptyTripLabel.isHidden = false
        } else {
            self.emptyTripLabel.isHidden = true
        }
    }
    
    func checkForHelpView() {
        self.checkEmptyMessage()
        self.tableView.reloadData()
        
        if !Data.tripModels.isEmpty {
            if !(UserDefaults.standard.bool(forKey: seenHelpView)) {
                view.addSubview(helpView)
                helpView.frame = view.frame
            }
        }
    }
    
    @IBAction func closeHelpView(_ sender: AppUIButton) {
        UIView.animate(withDuration: 0.5) {
            self.helpView.alpha = 0
        } completion: { success in
            self.helpView.removeFromSuperview()
            UserDefaults.standard.set(true, forKey: self.seenHelpView)
        }
    }
}

extension TripsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Data.tripModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TripsTableViewCell") as! TripsTableViewCell
        cell.setup(tripModel: Data.tripModels[indexPath.row])
        return cell
    }
}

extension TripsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 160
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let trip = Data.tripModels[indexPath.row]
        let delete = UIContextualAction(style: .destructive, title: "Delete") { (contextualAction, view, actionPerformed: @escaping (Bool) -> ()) in
            
            let alert = UIAlertController(title: "Delete Trip", message: "Are you sure you want to delete this trip: \(trip.title)", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Cancel", style: .cancel) {_ in
                actionPerformed(false)
            })
            alert.addAction(UIAlertAction(title: "Delete", style: .destructive, handler: { action in
                TripFunctions.deleteTrip(index: indexPath.row)
                tableView.deleteRows(at: [indexPath], with: .automatic)
                self.checkEmptyMessage()
            }))
            self.present(alert, animated: true)
        }
        delete.image = UIImage(named: "delete")
        return UISwipeActionsConfiguration(actions: [delete])
    }
    
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let edit = UIContextualAction(style: .normal, title: "Edit") { (contextualAction, view, actionPerformed: @escaping (Bool) -> ()) in
            self.tripIndexToEdit = indexPath.row
            self.performSegue(withIdentifier: "toAddTripSegue", sender: nil)
            actionPerformed(true)
        }
        edit.image = UIImage(named: "edit")
        edit.backgroundColor = Theme.editColor
        return UISwipeActionsConfiguration(actions: [edit])
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let trip = Data.tripModels[indexPath.row]
        let storyboard = UIStoryboard(name: String(describing: ActivitiesViewController.self), bundle: nil)
        let viewController = storyboard.instantiateInitialViewController() as! ActivitiesViewController
        viewController.tripId = trip.id
        navigationController?.pushViewController(viewController, animated: true)
    }
}
