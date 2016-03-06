//
//  ViewController.swift
//  Psychologist
//
//  Created by Ryan Warner on 3/6/16.
//  Copyright © 2016 Ryan Warner. All rights reserved.
//

import UIKit

class PsychologistViewController: UIViewController {

	override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
	{
		if let happinessVC = segue.destinationViewController as? HappinessViewController
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

