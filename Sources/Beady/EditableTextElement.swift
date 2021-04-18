//
//  File.swift
//  
//
//  Created by Riley Williams on 3/16/21.
//

import Foundation
import XCTest

public protocol EditableTextElement: TextElement, TappableElement {
	static func type(_ text: String) throws
}

public extension EditableTextElement {
	static func type(_ text: String) throws {
		let element = try locate()
		try tap()
		element.typeText(text)
	}
	
	static func done() throws {
		try type("\n")
	}
}

public extension EditableTextElement where Self: IdentifiableElement {
	static var kind: KeyPath<XCUIApplication, XCUIElementQuery> { \.textFields }
}
