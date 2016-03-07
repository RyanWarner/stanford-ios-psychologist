//
//  DiagnosedHappinessViewController.swift
//  Psychologist
//
//  Created by Ryan Warner on 3/7/16.
//  Copyright © 2016 Ryan Warner. All rights reserved.
//

import UIKit

class DiagnosedHappinessViewController: HappinessViewController {
	
	override var happiness: Int {
		didSet {
			diagnosticHistory += [happiness]
		}
	}
	
	private let defaults = NSUserDefaults.standardUserDefaults()

	var diagnosticHistory: [Int] {
		get {
			return defaults.objectForKey(History.DefaultsKey) as? [Int] ?? []
		}

		set {
			defaults.setObject(newValue, forKey: History.DefaultsKey)
		}
	}
	
	private struct History
	{
		static let SegueIdentifier = "Show History"
		static let DefaultsKey = "DiagnosedHappinessViewController.History"
	}
	
	override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
	{
		if let identifier = segue.identifier
		{
			switch identifier
			{
				case History.SegueIdentifier:
					if let tvc = segue.destinationViewController as? TextViewController {
						tvc.text = "\(diagnosticHistory)"
					}

				default: break
			}
		}
	}
}
