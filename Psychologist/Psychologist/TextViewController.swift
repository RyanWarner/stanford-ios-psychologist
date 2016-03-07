//
//  TextViewController.swift
//  Psychologist
//
//  Created by Ryan Warner on 3/7/16.
//  Copyright © 2016 Ryan Warner. All rights reserved.
//

import UIKit

class TextViewController: UIViewController {

	@IBOutlet weak var textView: UITextView! {
		didSet {
			textView.text = text
		}
	}

	var text: String = "" {
		didSet {
			textView?.text = text
		}
	}

}
