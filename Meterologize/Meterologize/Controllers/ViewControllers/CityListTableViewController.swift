//
//  CityListTableViewController.swift
//  Meterologize
//
//  Created by Maxwell Poffenbarger on 2/7/23.
//

import UIKit

class CityListTableViewController: UITableViewController {

	// MARK: - Outlets
	@IBOutlet weak var cityNameTextField: UITextField!
	@IBOutlet weak var cityTempTextField: UITextField!

	// MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }

	// MARK: - Actions
	@IBAction func addCityButtonTapped(_ sender: Any) {
		guard let cityName = cityNameTextField.text, !cityName.isEmpty,
			  let cityTemp = cityTempTextField.text, !cityTemp.isEmpty else { return }

		CityController.sharedInstance.createCity(name: cityName, temp: Double(cityTemp) ?? 0)
		updateTableView()
	}

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return CityController.sharedInstance.cities.count
	}

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cityCell", for: indexPath)
		cell.selectionStyle = .none

		let cityForIndex = CityController.sharedInstance.cities[indexPath.row]

		// Will be deprecated at a future date
//		cell.textLabel?.text = cityForIndex.name
//		cell.detailTextLabel?.text = "\(cityForIndex.currentTemp)"

		var config = cell.defaultContentConfiguration()
		config.text = cityForIndex.name
		config.secondaryText = "\(cityForIndex.currentTemp)"
		cell.contentConfiguration = config

        return cell
    }

	// MARK: - Helper
	func updateTableView() {
		self.tableView.reloadData()
	}
} // end of class
