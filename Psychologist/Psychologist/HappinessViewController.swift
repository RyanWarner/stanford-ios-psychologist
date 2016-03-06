//
//  HappinessViewController.swift
//  Happiness
//
//  Created by Ryan Warner on 2/21/16.
//  Copyright © 2016 Ryan Warner. All rights reserved.
//

import UIKit

class HappinessViewController: UIViewController, FaceViewDataSource
{
	@IBOutlet weak var faceView: FaceView!
	{
		didSet {
			faceView.dataSource = self
			faceView.addGestureRecognizer( UIPinchGestureRecognizer( target: faceView, action: "scale:" ) )
		}
	}
	
	private struct Constants {
		static let HappinessGestureScale: CGFloat = 4
	}

	@IBAction func changeHappiness(gesture: UIPanGestureRecognizer)
	{
		switch gesture.state {
		case .Ended: fallthrough
		case .Changed:
			let translation = gesture.translationInView(faceView)
			let happinessChange = Int( translation.y / Constants.HappinessGestureScale )
			
			if happinessChange != 0 {
				happiness += happinessChange
				gesture.setTranslation( CGPointZero, inView: faceView )
			}
		default: break
		}
	}
	
	var happiness: Int = 50 // 0 - Sad, 100 - happy
	{
		didSet
		{
			happiness = min( max( happiness, 0 ), 100 )
			updateUI(  )
		}
	}
	
	private func updateUI(  )
	{
		faceView?.setNeedsDisplay()
	}
	
	func smilinessForFaceView( sender: FaceView ) -> Double?
	{
		return Double( happiness - 50 ) / 50
	}

}
