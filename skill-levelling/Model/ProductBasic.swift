//
//  ProductBasic.swift
//  skill-levelling
//
//  Created by Iara Denise Orosco on 18/09/2022.
//

import Foundation

// MARK: - Product
struct ProductBasic: Codable {
    let queryData: QueryData?
    let content: [ProductBasicContent]
    
    enum CodingKeys: String, CodingKey {
        case queryData = "query_data"
        case content
    }
}

// MARK: - Content
struct ProductBasicContent: Codable {
    let id: String
    let position: Int
    let type: ProductTypeEnum
}

enum ProductTypeEnum: String, Codable {
    case product = "PRODUCT"
    case item = "ITEM"
}

// MARK: - QueryData
struct QueryData: Codable {
    let highlightType, criteria, id: String?
    
    enum CodingKeys: String, CodingKey {
        case highlightType = "highlight_type"
        case criteria, id
    }
}
