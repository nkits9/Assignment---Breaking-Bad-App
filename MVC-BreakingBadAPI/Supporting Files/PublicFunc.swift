//
//  NetworkCharactersManager.swift
//  MVC-BreakingBadAPI
//
//  Created by MOHIT SHARMA on 04/12/20.
//

import Foundation

public func update<A>(_ a: A, _ fs: ((inout A) -> Void)...) -> A {
    var a = a
    fs.forEach { f in f(&a) }
    return a
}
