//
//  ViewController.swift
//  Psychologist
//
//  Created by Ryan Warner on 3/6/16.
//  Copyright © 2016 Ryan Warner. All rights reserved.
//

import UIKit

class PsychologistViewController: UIViewController {

	@IBAction func noDreams( sender: UIButton ) {
		performSegueWithIdentifier( "noDreams", sender: self )
	}

	override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
	{
		var destination = segue.destinationViewController as? UIViewController
		if let navCon = destination as? UINavigationController {
			destination = navCon.visibleViewController
		}

		if let happinessVC = destination as? HappinessViewController
		{
			if let identifier = segue.identifier
			{
				switch identifier
				{
					case "sad": happinessVC.happiness = 0
					case "happy": happinessVC.happiness = 100
					default: happinessVC.happiness = 50
				}
			}
		}
	}
}

