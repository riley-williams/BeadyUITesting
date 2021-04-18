//
//  NavigationBarTitleIdentifiable.swift
//  
//
//  Created by Riley Williams on 3/16/21.
//

import Foundation
import XCTest

public protocol NavigationBarTitleIdentifiable: Screen {
	static var title: String { get }
}

public extension NavigationBarTitleIdentifiable {
	static func presented() throws {
		guard XCUIApplication()
				.navigationBars
				.staticTexts[title]
				.waitForExistence(timeout: 0.5)
		else {
			throw ScreenError.expectedToBePresented
		}
	}
}
