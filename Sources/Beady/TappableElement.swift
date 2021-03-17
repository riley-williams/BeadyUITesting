//
//  File.swift
//  
//
//  Created by Riley Williams on 3/16/21.
//

import Foundation
import XCTest

public protocol TappableElement: InterfaceElement {
	static func tap(withNumberOfTaps: Int, numberOfTouches: Int) throws
}

public extension TappableElement {
	static func tap(withNumberOfTaps taps: Int = 1, numberOfTouches touches: Int = 1) throws {
		let element = try locate()
		guard element.isHittable, element.isEnabled else {
			throw TappableElementError.expectedEnabled
		}
		element.tap(withNumberOfTaps: taps, numberOfTouches: touches)
	}
}

public enum TappableElementError: Error {
	case expectedEnabled
	case expectedDisabled
//	case expectedTextToMatch(String)
}

public extension TappableElement where Self: IdentifiableElement {
	static var kind: KeyPath<XCUIApplication, XCUIElementQuery> { \.buttons }
}
