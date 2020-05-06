//
//  WebServiceEnum.swift
//  SwiftUI-Combine
//
//  Created by Aline Ordoñez on 05/05/20.
//  Copyright © 2020 Aline Ordoñez. All rights reserved.
//

import Foundation

enum SecretKey: String {
    case publicApiKey = "5d6eeb58aab1b013e83e7ae8fe7daa41"
    case privateApiKey = "95ebede75a5c2028c4ee30d8435213ea6269302a"
}

enum EndpointUrl: String {
    case characters = "v1/public/characters"
    case characterDetail = "v1/public/characters/"
    case comics = "v1/public/comics"
    case creators = "v1/public/creators"
    case events = "v1/public/events"
    case series = "v1/public/series"
}

enum Result<D> {
    case success(D)
    case failure(ServiceError)
}

enum ServiceError {
    case domainError(description: String, errorCode: Int)
    case invalidResponse
    case invalidJSON
    
    case serverTimeOut
    
    case invalidOrUnrecognizedParameter
    case characteNoFound
}

extension ServiceError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .serverTimeOut:
            return "Comunications error."
        case .invalidJSON:
            return "Error parsing result."
        case .invalidResponse:
            return "Unknown error."
        case .domainError(description: let description, errorCode: let errorCode):
            print("Error code \(errorCode)")
            return description
        case .invalidOrUnrecognizedParameter:
            return " Invalid or unrecognized parameter."
        case .characteNoFound:
            return "Character not found."
        }
    }
}

extension ServiceError: Equatable {
    
}

func ==(lhs: ServiceError, rhs: ServiceError) -> Bool {
    switch (lhs, rhs) {
    case (let .domainError(descriptionA, errorCodeA), let .domainError(descriptionB, errorCodeB)):
        return descriptionA == descriptionB && errorCodeA == errorCodeB
        
    case (.characteNoFound, .characteNoFound):
        return true

    default:
        return false
    }
}
