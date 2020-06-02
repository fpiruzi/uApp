//
//  Alamofire+CRUD.swift
//  uApp
//
//  Created by Fabrizio Piruzi on 6/2/20.
//  Copyright © 2020 Fabrizio Piruzi. All rights reserved.
//

import Foundation
import Alamofire

extension Alamofire.Session {
    func GET(_ url: URLConvertible, query: [String: String] = [:]) -> DataRequest {
        return sendQueryParameters(
            url,
            method: .get,
            queryItems: query)
    }

    func POST<T: Encodable>(_ url: URLConvertible, payload: T) -> DataRequest {
        return sendPayload(url, method: .post, payload: payload)
    }

    func PUT<T: Encodable>(_ url: URLConvertible, payload: T) -> DataRequest {
        return sendPayload(url, method: .put, payload: payload)
    }

    func PATCH<T: Encodable>(_ url: URLConvertible, payload: T) -> DataRequest {
        return sendPayload(url, method: .patch, payload: payload)
    }

    func DELETE(_ url: URLConvertible, query: [String: String] = [:]) -> DataRequest {
        return sendQueryParameters(
            url,
            method: .delete,
            queryItems: query)
    }
}

// MARK: - Helpers
private extension Alamofire.Session {
    private func sendPayload<T: Encodable>(_ url: URLConvertible, method: HTTPMethod, payload: T) -> DataRequest {
        return request(
            url,
            method: method,
            parameters: payload,
            encoder: JSONParameterEncoder.default)
    }

    private func sendQueryParameters(_ url: URLConvertible, method: HTTPMethod, queryItems: [String: String]) -> DataRequest {
        return request(
            url,
            method: method,
            parameters: queryItems,
            encoder: URLEncodedFormParameterEncoder.default)
    }
}
