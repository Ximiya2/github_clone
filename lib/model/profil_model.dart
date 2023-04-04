// To parse this JSON data, do
//
//     final profilModel = profilModelFromJson(jsonString);

import 'package:hive/hive.dart';
import 'dart:convert';

part 'profil_model.g.dart';

ProfilModel profilModelFromJson(String str) => ProfilModel.fromJson(json.decode(str));

String profilModelToJson(ProfilModel data) => json.encode(data.toJson());

@HiveType(typeId: 1)
class ProfilModel {
  ProfilModel({
    this.login,
    this.id,
    this.nodeId,
    this.avatarUrl,
    this.gravatarId,
    this.url,
    this.htmlUrl,
    this.followersUrl,
    this.followingUrl,
    this.gistsUrl,
    this.starredUrl,
    this.subscriptionsUrl,
    this.organizationsUrl,
    this.reposUrl,
    this.eventsUrl,
    this.receivedEventsUrl,
    this.type,
    this.siteAdmin,
    this.name,
    this.company,
    this.blog,
    this.location,
    this.email,
    this.hireable,
    this.bio,
    this.twitterUsername,
    this.publicRepos,
    this.publicGists,
    this.followers,
    this.following,
    this.createdAt,
    this.updatedAt,
  });

  @HiveField(1)
  String? login;
  @HiveField(2)
  int? id;
  @HiveField(3)
  String? nodeId;
  @HiveField(4)
  String? avatarUrl;
  @HiveField(5)
  String? gravatarId;
  @HiveField(6)
  String? url;
  @HiveField(7)
  String? htmlUrl;
  @HiveField(8)
  String? followersUrl;
  @HiveField(9)
  String? followingUrl;
  @HiveField(10)
  String? gistsUrl;
  @HiveField(11)
  String? starredUrl;
  @HiveField(12)
  String? subscriptionsUrl;
  @HiveField(13)
  String? organizationsUrl;
  @HiveField(14)
  String? reposUrl;
  @HiveField(15)
  String? eventsUrl;
  @HiveField(16)
  String? receivedEventsUrl;
  @HiveField(17)
  String? type;
  @HiveField(18)
  bool? siteAdmin;
  @HiveField(19)
  String? name;
  @HiveField(20)
  dynamic company;
  @HiveField(21)
  String? blog;
  @HiveField(22)
  dynamic location;
  @HiveField(23)
  dynamic email;
  @HiveField(24)
  dynamic hireable;
  @HiveField(25)
  String? bio;
  @HiveField(26)
  dynamic twitterUsername;
  @HiveField(27)
  int? publicRepos;
  @HiveField(28)
  int? publicGists;
  @HiveField(29)
  int? followers;
  @HiveField(30)
  int? following;
  @HiveField(31)
  DateTime? createdAt;
  @HiveField(32)
  DateTime? updatedAt;

  factory ProfilModel.fromJson(Map<String, dynamic> json) => ProfilModel(
    login: json["login"],
    id: json["id"],
    nodeId: json["node_id"],
    avatarUrl: json["avatar_url"],
    gravatarId: json["gravatar_id"],
    url: json["url"],
    htmlUrl: json["html_url"],
    followersUrl: json["followers_url"],
    followingUrl: json["following_url"],
    gistsUrl: json["gists_url"],
    starredUrl: json["starred_url"],
    subscriptionsUrl: json["subscriptions_url"],
    organizationsUrl: json["organizations_url"],
    reposUrl: json["repos_url"],
    eventsUrl: json["events_url"],
    receivedEventsUrl: json["received_events_url"],
    type: json["type"],
    siteAdmin: json["site_admin"],
    name: json["name"],
    company: json["company"],
    blog: json["blog"],
    location: json["location"],
    email: json["email"],
    hireable: json["hireable"],
    bio: json["bio"],
    twitterUsername: json["twitter_username"],
    publicRepos: json["public_repos"],
    publicGists: json["public_gists"],
    followers: json["followers"],
    following: json["following"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "login": login,
    "id": id,
    "node_id": nodeId,
    "avatar_url": avatarUrl,
    "gravatar_id": gravatarId,
    "url": url,
    "html_url": htmlUrl,
    "followers_url": followersUrl,
    "following_url": followingUrl,
    "gists_url": gistsUrl,
    "starred_url": starredUrl,
    "subscriptions_url": subscriptionsUrl,
    "organizations_url": organizationsUrl,
    "repos_url": reposUrl,
    "events_url": eventsUrl,
    "received_events_url": receivedEventsUrl,
    "type": type,
    "site_admin": siteAdmin,
    "name": name,
    "company": company,
    "blog": blog,
    "location": location,
    "email": email,
    "hireable": hireable,
    "bio": bio,
    "twitter_username": twitterUsername,
    "public_repos": publicRepos,
    "public_gists": publicGists,
    "followers": followers,
    "following": following,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
  };
}
