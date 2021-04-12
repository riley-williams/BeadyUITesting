//
//  OtherElement.swift
//  
//
//  Created by Riley Williams on 4/5/21.
//

import Foundation
import XCTest

public protocol OtherElement: InterfaceElement {
	
}

public extension OtherElement where Self: IdentifiableElement {
	static var kind: KeyPath<XCUIApplication, XCUIElementQuery> { \.otherElements }
}
