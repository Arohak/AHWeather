//
//  Events.swift
//  AHWeather
//
//  Created by AroHak on 07/03/2016.
//  Copyright © 2016 AroHak LLC. All rights reserved.
//

public class EventCenter {
    static public let defaultCenter = EventCenter()

    public init() {
    }

    public func register<T>(observer: AnyObject, handler: @escaping (T) -> Void) {
        register(observer: observer, queue: nil, handler: handler)
    }

    public func registerOnMainThread<T>(observer: AnyObject, handler: @escaping (T) -> Void) {
        register(observer: observer, queue: DispatchQueue.main, handler: handler)
    }

    public func register<T>(observer: AnyObject, queue: DispatchQueue?, handler: @escaping (T) -> Void) {
        EventCenter.operationQueue.sync {
            let info = ObserverInfo(observer: observer, handler: handler, queue: queue)
            self.observers.append(info)
        }
    }

    public func unregister(observer: AnyObject) {
        EventCenter.operationQueue.sync {
            self.observers = self.observers.filter { $0.observer !== observer }
        }
    }

    public func post<T>(obj: T) {
        for info in observers {
            if let h = info.handler as? ((T) -> Void) {
                if let queue = info.queue {
                    queue.async { h(obj) }
                } else {
                    h(obj)
                }
            }
        }
    }


    static private let operationQueue = DispatchQueue(label: "mokemokechicken.EventCenter")
    private var observers = [ObserverInfo]()

    private struct ObserverInfo {
        let observer: AnyObject
        let handler: Any
        let queue: DispatchQueue?
    }
}

struct AHWLocation {
    
    var result: CLLocation!
    
    init(result: CLLocation) {
        self.result = result
    }
}
