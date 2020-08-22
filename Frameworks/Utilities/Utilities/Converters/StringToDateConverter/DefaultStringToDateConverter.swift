//
//  DefaultStringToDateConverter.swift
//  Utilities
//
//  Created by Daniel Sumara on 22/08/2020.
//  Copyright © 2020 Daniel Sumara. All rights reserved.
//

import Foundation

public final class DefaultStringToDateConverter: StringToDateConverter {
    
    // MARK: - Properties
    
    private let isoFormatter = ISO8601DateFormatter()
    private let isoFormatterWithoutSeconds = ISO8601DateFormatter()
    
    // MARK: - Initializers
    
    public init(timeZone: TimeZone? = nil) {
        isoFormatter.formatOptions = [
            .withFullDate,
            .withFullTime,
            .withDashSeparatorInDate,
            .withFractionalSeconds
        ]
        isoFormatterWithoutSeconds.formatOptions = [
            .withFullDate,
            .withFullTime,
            .withDashSeparatorInDate
        ]
        
        if let timeZone = timeZone {
            isoFormatter.timeZone = timeZone
            isoFormatterWithoutSeconds.timeZone = timeZone
        }
    }
    
    // MARK: - API
    
    public func date(from string: String) -> Date? {
        if let dateWithTime = isoFormatter.date(from: string) {
            return dateWithTime
        }
        if let dateWithTime = isoFormatterWithoutSeconds.date(from: string) {
            return dateWithTime
        }
        return nil
    }
    
}
