//
//  File.swift
//  
//
//  Created by Riley Williams on 3/16/21.
//

import Foundation
import XCTest

public protocol ElementCollection {
	associatedtype Element: InterfaceElement, IdentifiableElement
	
	static func forEach(_ closure: (XCUIElement) throws -> Void) throws
	static func count(equals: Int) throws
}

public extension ElementCollection {
	static func forEach(_ closure: (XCUIElement) throws -> Void) throws {
		try elements.lazy.filter(\.exists).forEach(closure)
	}
	
	static func count(equals count: Int) throws {
		guard count == elements.count else {
			throw ElementCollectionError.expectedCountEquals(count, elements.count)
		}
	}
	
	private static var elements: [XCUIElement] {
		XCUIApplication()[keyPath: Element.kind].matching(identifier: Element.identifier).allElementsBoundByIndex
	}
}

public enum ElementCollectionError: Error {
	case expectedCountEquals(Int, Int)
}
