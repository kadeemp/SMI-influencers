//
//  Person.swift
//  SMI-Influencers
//
//  Created by Julia Geist on 4/27/17.
//  Copyright © 2017 Kadeem Palacios. All rights reserved.
//

import Foundation


struct Person {
    
    var name: String
    var postImpressions: [String: Any]
    var peopleTalkingAboutPage: [String: Any]
    var influxTime: String
    var pageViews: [String: Any]
    var totalPageLikes: String
    var engagedUsers: [String: Any]
    
}

/* 
 
 {
 "postImpressions" : {
 "pastWeek" : {
 "impressions" : 1845,
 "dateCollected" : "2017-04-25T07:00:00+0000",
 "description" : "Weekly: The number of impressions that came from all of your posts. (Total Count)"
 },
 "pastDay" : {
 "impressions" : 412,
 "dateCollected" : "2017-04-25T07:00:00+0000",
 "description" : "Daily: The number of impressions that came from all of your posts. (Total Count)"
 },
 "pastMonth" : {
 "impressions" : 5752,
 "dateCollected" : "2017-04-25T07:00:00+0000",
 "description" : "28 Days: The number of impressions that came from all of your posts. (Total Count)"
 }
 },
 "peopleTalkingAboutPage" : {
 "pastWeek" : {
 "peopleTalkingAboutPage" : 23,
 "dateCollected" : "2017-04-25T07:00:00+0000",
 "description" : "Weekly: The number of stories created about your Page. (Total Count)"
 },
 "pastDay" : {
 "peopleTalkingAboutPage" : 3,
 "dateCollected" : "2017-04-25T07:00:00+0000",
 "description" : "Daily: The number of stories created about your Page. (Total Count)"
 },
 "pastMonth" : {
 "peopleTalkingAboutPage" : 141,
 "dateCollected" : "2017-04-25T07:00:00+0000",
 "description" : "28 Days: The number of stories created about your Page. (Total Count)"
 }
 },
 "name" : "Julia GeiSt",
 "influxTime" : 0,
 "pageViews" : {
 "pastWeek" : {
 "pageViews" : 8,
 "dateCollected" : "2017-04-25T07:00:00+0000",
 "description" : "Weekly: Total views count per Page"
 },
 "pastDay" : {
 "pageViews" : 1,
 "dateCollected" : "2017-04-25T07:00:00+0000",
 "description" : "Daily: Total views count per Page"
 },
 "pastMonth" : {
 "pageViews" : 40,
 "dateCollected" : "2017-04-25T07:00:00+0000",
 "description" : "28 Days: Total views count per Page"
 }
 },
 "totalPageLikes" : {
 "totalPageLikes" : 466,
 "dateCollected" : "2017-04-25T07:00:00+0000",
 "description" : "Lifetime: The total number of people who have liked your Page. (Unique Users)"
 },
 "engagedUsers" : {
 "pastWeek" : {
 "dateCollected" : "2017-04-25T07:00:00+0000",
 "engagedUsers" : 19,
 "description" : "Weekly: The number of people who engaged with your Page. Engagement includes any click or story created. (Unique Users)"
 },
 "pastDay" : {
 "dateCollected" : "2017-04-25T07:00:00+0000",
 "engagedUsers" : 5,
 "description" : "Daily: The number of people who engaged with your Page. Engagement includes any click or story created. (Unique Users)"
 },
 "pastMonth" : {
 "dateCollected" : "2017-04-25T07:00:00+0000",
 "engagedUsers" : 88,
 "description" : "28 Days: The number of people who engaged with your Page. Engagement includes any click or story created. (Unique Users)"
 }
 }
 }
 
 
 */
