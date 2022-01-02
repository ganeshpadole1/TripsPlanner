//
//  AddTripViewController.swift
//  TripsPlanner
//
//  Created by ganesh padole on 11/12/21.
//

import Photos
import UIKit

class AddTripViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var tripTextField: UITextField!
    @IBOutlet weak var addPhotoButton: UIButton!
    @IBOutlet weak var imageView: UIImageView!
    
    var doneSaving: (() -> ())?
    var tripIndexToEdit: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleLabel.font = UIFont(name: Theme.mainFontName, size: 24)
        addPhotoButton.tintColor = Theme.tintColor
        imageView.layer.cornerRadius = 10
        
        titleLabel.applyShadow()
        
        if let index = tripIndexToEdit {
            titleLabel.text = "Edit trip"
            let trip = Data.tripModels[index]
            tripTextField.text = trip.title
            imageView.image = trip.image
        }
    }
    
    @IBAction func cancel(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
    @IBAction func save(_ sender: UIButton) {
        
        guard tripTextField.text != "", let newTripName = tripTextField.text else {
            tripTextField.layer.cornerRadius = 5
            tripTextField.layer.borderColor = UIColor.red.cgColor
            tripTextField.layer.borderWidth = 1
            tripTextField.placeholder = "Trip name required"
            return
        }
        
        if let index = tripIndexToEdit {
            TripFunctions.updateTrip(at: index, title: newTripName, image: imageView.image)
        } else {
            TripFunctions.createTrip(tripModel: TripModel(title: newTripName, image: imageView.image))
        }
        
        if let doneSaving = doneSaving {
            doneSaving()
        }
        dismiss(animated: true)
    }
    
    @IBAction func addPhoto(_ sender: UIButton) {
        PHPhotoLibrary.requestAuthorization { status in
            switch status {
            case .notDetermined:
                if status == PHAuthorizationStatus.authorized {
                    DispatchQueue.main.async {
                        self.presentPhotoPickerController()
                    }                }
            case .restricted:
                let alertController = UIAlertController(title: "Photo Library Access Restricted", message: "Photo Library access is restricted and cannot be accessed.", preferredStyle: .alert)
                
                let okAction = UIAlertAction(title: "Ok", style: .default)
                alertController.addAction(okAction)
                
                self.present(alertController, animated: true)
            case .denied:
                let alertController = UIAlertController(title: "Photo Library Access Denied", message: "Photo Library access was previously denied. Please update your Settings if you wish to change this.", preferredStyle: .alert)
                
                let okAction = UIAlertAction(title: "Ok", style: .default) { action in
                    DispatchQueue.main.async {
                        let url = URL(string: UIApplication.openSettingsURLString)!
                        UIApplication.shared.open(url, options: [:])
                    }
                }
                let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)

                alertController.addAction(okAction)
                alertController.addAction(cancelAction)
                
                DispatchQueue.main.async {
                    self.present(alertController, animated: true)
                }
                
            case .authorized:
                DispatchQueue.main.async {
                    self.presentPhotoPickerController()
                }
            case .limited:
                break
            @unknown default:
                break
            }
        }
    }
    
    func presentPhotoPickerController() {
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .photoLibrary
        imagePicker.delegate = self
        self.present(imagePicker, animated: true)
    }
}

extension AddTripViewController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if ((textField.text?.isEmpty) != nil) {
            textField.layer.borderColor = .none
            textField.layer.borderWidth = .zero
        }
    }
}

extension AddTripViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[.originalImage] as? UIImage {
            self.imageView.image = image
        }
        dismiss(animated: true)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true)
    }
}
