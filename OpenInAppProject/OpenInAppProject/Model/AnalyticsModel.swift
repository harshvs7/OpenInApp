//
//  AnalyticsModel.swift
//  OpenInAppProject
//
//  Created by Harshwardhan Sharma on 25/05/23.
//

import Foundation

struct Analytics : Decodable {
    var status : Bool?
    var statusCode : Int?
    var message : String?
    var support_whatsapp_number : String?
    var total_links : Int?
    var total_clicks : Int?
    var today_clicks : Int?
    var top_source : String?
    var top_location : String?
    var startTime : String?
    var links_created_today : Int?
    var applied_campaign : Int?
    var data : DataLinks
}

struct DataLinks : Decodable {
    var recent_links: [RecentLinks]
    var top_links: [TopLinks]
}

struct RecentLinks : Decodable {
    var url_id : Int?
    var web_link : String?
    var smart_link : String?
    var title : String?
    var total_clicks : Int?
    var original_image : String?
    var thumbnail : String?
    var times_ago : String?
    var created_at : String?
    var domain_id : String?
    var url_prefix : String?
    var url_suffix : String?
    var app : String?
}

struct TopLinks : Decodable {
    var url_id : Int?
    var web_link : String?
    var smart_link : String?
    var title : String?
    var total_clicks : Int?
    var original_image : String?
    var thumbnail : String?
    var times_ago : String?
    var created_at : String?
    var domain_id : String?
    var url_prefix : String?
    var url_suffix : String?
    var app : String?
}
