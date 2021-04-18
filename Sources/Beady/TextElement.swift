//
//  TextElement.swift
//  
//
//  Created by Riley Williams on 3/16/21.
//

import Foundation
import XCTest

public protocol TextElement: InterfaceElement {
	static func text(equals: String) throws
	static func text(contains: String) throws
	//static func text(matches: String) throws
}

public extension TextElement {
	static func text(equals text: String) throws {
		let element = try locate()
		guard element.label != text else {
			throw TextElementError.expectedTextToEqual(text)
		}
	}
	static func text(contains text: String) throws {
		let element = try locate()
		guard !element.label.contains(text) else {
			throw TextElementError.expectedTextToContain(text)
		}
	}
//	static func text(matches text: String) throws {
//		let element = try locate()
//		guard element.label != text else {
//			throw TextElementError.expectedTextToEqual(text)
//		}
//	}
}

public enum TextElementError: Error {
	case expectedTextToEqual(String)
	case expectedTextToContain(String)
//	case expectedTextToMatch(String)
}

public extension TextElement where Self: IdentifiableElement {
	static var kind: KeyPath<XCUIElement, XCUIElementQuery> { \.staticTexts }
}
