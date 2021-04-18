//
//  InterfaceElement.swift
//  
//
//  Created by Riley Williams on 3/16/21.
//

import Foundation
import XCTest

/// An interface element that can be located onscreen
public protocol InterfaceElement {
	/// How long to wait when trying to locate this element
	/// Default: 0.5 seconds
	static var timeout: Double { get }
	
	/// Throws if the element cannot be located onscreen
	@discardableResult
	static func locate() throws -> XCUIElement
}

public extension InterfaceElement {
	static func isVisible(_ shouldExist: Bool = true) throws {
		let exists = (try? locate()) != nil
		if shouldExist && !exists { throw InterfaceElementError.expectedToLocate }
		if !shouldExist && exists { throw InterfaceElementError.expectedNotToLocate }
	}
}

/// Set the default timeout to 0.5 seconds
public extension InterfaceElement {
	static var timeout: Double { 0.5 }
}

public enum InterfaceElementError: Error {
	case expectedToLocate
	case expectedNotToLocate
}

public extension InterfaceElement where Self: IdentifiableElement {
	static func locate() throws -> XCUIElement {
		let element = XCUIApplication()[keyPath: kind][identifier].firstMatch
		guard element.waitForExistence(timeout: timeout) else {
			throw InterfaceElementError.expectedToLocate
		}
		return element
	}
}
