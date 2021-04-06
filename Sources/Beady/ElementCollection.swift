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
	static var count: Int { get }
}

public extension ElementCollection {
	static func forEach(_ closure: (XCUIElement) throws -> Void) throws {
		try elements.lazy.filter(\.exists).forEach(closure)
	}
	
	static var count: Int {
		elements.count
	}
	
	private static var elements: [XCUIElement] {
		XCUIApplication()[keyPath: Element.kind].matching(identifier: Element.identifier).allElementsBoundByAccessibilityElement
	}
}

public enum ElementCollectionError: Error {
	
}
