//
//  IdentifiableElement.swift
//  
//
//  Created by Riley Williams on 3/16/21.
//

import Foundation
import XCTest

/// An element that can be identified by an accessibility identifier
public protocol IdentifiableElement {
	static var kind: KeyPath<XCUIElement, XCUIElementQuery> { get }
	static var identifier: String { get }
}
