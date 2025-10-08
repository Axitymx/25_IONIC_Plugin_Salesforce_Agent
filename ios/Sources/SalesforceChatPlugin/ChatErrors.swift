//
//  ChatErrors.swift
//  CapacitorSalesforceChat
//
//  Created by Yonatan Ortiz Carrillo on 07/08/25.
//

enum ChatError: LocalizedError {
    case missingPresenter
    case invalidURL
    case invalidUUID
    case unsupportedVersion
    case missingParameters

    var errorDescription: String? {
        switch self {
        case .missingPresenter:
            return "No se pudo obtener el view controller principal"
        case .invalidURL:
            return "Invalid URL"
        case .invalidUUID:
            return "Invalid invalidUUID"
        case .unsupportedVersion:
            return "Versión incompatible: requiere iOS 14.1 o superior"
        case .missingParameters:
            return "Missing parameters: serviceUrl, organizationId, or developerName"
        }
    }
}
