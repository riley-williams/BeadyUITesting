//
//  BackNavigating.swift
//  
//
//  Created by Riley Williams on 4/18/21.
//

import Foundation
import XCTest


public protocol BackNavigating {
	/// Navigates back to the previous screen
	static func navigateBack() throws
}
