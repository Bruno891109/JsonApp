//
//  UITestHelper.swift
//  JsonApp
//
//  Created by MacDev1 on 3/23/23.
//
#if DEBUG

import Foundation

struct UITestHelper {
    static var isUITesting: Bool {
        ProcessInfo.processInfo.arguments.contains("-ui-testing")
    }
}

#endif
