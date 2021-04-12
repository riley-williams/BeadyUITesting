//
//  ElementCollection.swift
//  
//
//  Created by Riley Williams on 3/16/21.
//

import Foundation
import XCTest

public protocol ElementCollection {
	associatedtype Element: InterfaceElement, IdentifiableElement
	
	static func forEach(_ timeout: TimeInterval, _ closure: (XCUIElement) throws -> Void) throws
	static var count: Int { get }
}

public extension ElementCollection {
	/// Runs the provided closure on each element in this collection. Waits for the element to exist
	/// Elements are indexed by accessibility identifier, so it should be safe to mutate them
	/// - Parameters:
	///   - timeout: How long to wait for the element to exist
	///   - closure: Closure to run
	static func forEach(_ timeout: TimeInterval = 0.5, _ closure: (XCUIElement) throws -> Void) throws {
		try elements.lazy
			.filter { $0.waitForExistence(timeout: timeout) }
			.forEach(closure)
	}
	
	static var count: Int {
		elements.count
	}
	
	private static var elements: [XCUIElement] {
		XCUIApplication()[keyPath: Element.kind]
			.matching(identifier: Element.identifier)
			.allElementsBoundByAccessibilityElement
	}
}

public enum ElementCollectionError: Error {
	
}
