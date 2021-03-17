//
//  File.swift
//  
//
//  Created by Riley Williams on 3/16/21.
//

import Foundation

func not(_ fn: @autoclosure () throws -> Void) throws {
	guard (try? fn()) == nil else {
		throw InvertibleError.expectedFailure
	}
}

public enum InvertibleError: Error, CustomStringConvertible {
	case expectedFailure
	
	public var description: String {
		return "Expected test to fail"
	}
}
