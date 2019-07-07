//
//  Benchmark.swift
//  BenchmarkChart
//
//  Created by huangjianwu on 2019/7/7.
//  Copyright © 2019 huangjianwu. All rights reserved.
//

import Foundation

public struct Benchmark {
    
    private let startTimeInterval: CFAbsoluteTime
    private let key: String
    private static var sharedInstance: Benchmark?
    
    public init(key: String) {
        startTimeInterval = CFAbsoluteTimeGetCurrent()
        self.key = key
    }
    
    public func finish() {
        let elapsed = CFAbsoluteTimeGetCurrent() - startTimeInterval
        let formatedElapsed = String(format: "%.5f", elapsed)
        print("\(key): \(formatedElapsed) sec.")
    }
    
    public static func start(_ key: String = "Benchmark") {
        sharedInstance = Benchmark(key: key)
    }
    
    public static func finish() {
        sharedInstance?.finish()
        sharedInstance = nil
    }
    
    public static func measure(_ key: String = "Benchmark", block: () -> ()) {
        let benchmark = Benchmark(key: key)
        block()
        benchmark.finish()
    }
}

prefix operator ⏲
public prefix func ⏲(handler: () -> ()) {
    Benchmark.measure(block: handler)
}
