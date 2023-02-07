//
//  CityController.swift
//  Meterologize
//
//  Created by Maxwell Poffenbarger on 2/6/23.
//

import Foundation

class CityController {

	// MARK: - Properties
	// Shared Instance
	static let sharedInstance = CityController()
	// Source of Truth
	var cities: [City] = []

	// MARK: - Functions
	func createCity(name: String, temp: Double, high: Int, low: Int, status: String) {
		let newCity = City(name: name, currentTemp: temp, dailyHigh: high, dailyLow: low, currentStatus: status)
		cities.append(newCity)
	}
}
