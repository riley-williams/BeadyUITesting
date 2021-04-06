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
	static func isEnabled() throws
}

public extension TappableElement {
	static func tap(withNumberOfTaps taps: Int = 1, numberOfTouches touches: Int = 1) throws {
		try isEnabled()
		
		let element = try locate()
		#if os(macOS)
		element.tap()
		#else
		element.tap(withNumberOfTaps: taps, numberOfTouches: touches)
		#endif
	}
	/// Throws if the element is not enabled
	static func isEnabled() throws {
		let element = try locate()
		guard element.isHittable, element.isEnabled else {
			throw TappableElementError.expectedEnabled
		}
	}
}

public extension TappableElement {
	/// Throws if the element is enabled
	static func isNotEnabled() throws {
		guard (try? isEnabled()) == nil else {
			throw TappableElementError.expectedDisabled
		}
	}
}

public enum TappableElementError: Error {
	case expectedEnabled
	case expectedDisabled
}

public extension TappableElement where Self: IdentifiableElement {
	static var kind: KeyPath<XCUIApplication, XCUIElementQuery> { \.buttons }
}
