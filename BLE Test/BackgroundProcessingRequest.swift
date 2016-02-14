//
//  BackgroundProcessingRequest.swift
//  Adafruit Bluefruit LE Connect
//
//  Created by Dave Weston on 2/13/16.
//  Copyright © 2016 Adafruit Industries. All rights reserved.
//

import Foundation

extension UIApplication {
    func requestAdditionalTime(seconds: UInt64) {
        NSLog("Requesting \(seconds) of background time")
        var task: UIBackgroundTaskIdentifier = 0
        task = self.beginBackgroundTaskWithExpirationHandler { () -> Void in
            self.endBackgroundTask(task)
        }
        let delayTime = dispatch_time(DISPATCH_TIME_NOW, Int64(seconds * NSEC_PER_SEC))
        dispatch_after(delayTime, dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), { () -> Void in
            self.endBackgroundTask(task)
        })
    }
}