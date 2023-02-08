//
//  CityDetailViewController.swift
//  Meterologize
//
//  Created by Maxwell Poffenbarger on 2/6/23.
//

import UIKit

class CityDetailViewController: UIViewController {

	// MARK: - Outlets

    @IBOutlet weak var cityNameTextField: UITextField!
    @IBOutlet weak var currentStatusLabel: UILabel!

    @IBOutlet weak var cityTempTextField: UITextField!
    @IBOutlet weak var projectedHighLabel: UILabel!
	@IBOutlet weak var projectedLowLabel: UILabel!
    
    
    // MARK: - Properties
    var objectToRecieveTheDataFromOurPrepareForSegue: City? //make it optional

	// MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

		updateViews()
    }

    @IBAction func saveButtonTapped(_ sender: Any) {
    }
    // MARK: - Methods
	func updateViews() {
        guard let city = objectToRecieveTheDataFromOurPrepareForSegue else {return}

		cityNameTextField.text = city.name
		currentStatusLabel.text = city.currentStatus
		cityTempTextField.text = "\(city.currentTemp)"
		projectedHighLabel.text = "\(city.dailyHigh)"
		projectedLowLabel.text = "\(city.dailyLow)"

		self.view.backgroundColor = city.currentTemp <= 80.0 ? .cyan : .red
	}
}// end of class
