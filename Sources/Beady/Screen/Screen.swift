//
//  Screen.swift
//  
//
//  Created by Riley Williams on 3/16/21.
//

import Foundation
import XCTest

/// A navigable screen in the app
public protocol Screen {
	/// Navigates to this screen, and throws if navigation is not possible
	static func navigate() throws
	/// Throws if the screen is not currently presented
	static func presented() throws
}

public enum ScreenError: Error {
	case expectedToNavigate
	case expectedToBePresented
}


