// To parse this JSON data, do
//
//     final usermodel = usermodelFromJson(jsonString);

import 'dart:convert';
import 'package:flutter/material.dart';

Usermodel usermodelFromJson(String str) => Usermodel.fromJson(json.decode(str));

String usermodelToJson(Usermodel data) => json.encode(data.toJson());

class Usermodel {
  Usermodel({
    this.topStatus,
    this.topBanner,
    this.bottomStatus,
    this.bottomBanner,
    this.popupStatus,
    this.popupBanner,
    this.liveStatus,
    this.liveData,
    this.astrologersStatus,
    this.astrologers,
    this.blogStatus,
    this.blogs,
    this.walletBal,
  });

  bool? topStatus;
  List<Banner>? topBanner;
  bool? bottomStatus;
  List<Banner>? bottomBanner;
  bool? popupStatus;
  List<Banner>? popupBanner;
  bool? liveStatus;
  List<LiveDatum>? liveData;
  bool? astrologersStatus;
  List<Astrologer>? astrologers;
  bool? blogStatus;
  List<Blog>? blogs;
  String? walletBal;

  factory Usermodel.fromJson(Map<String, dynamic> json) => Usermodel(
        topStatus: json["Top_Status"],
        topBanner: List<Banner>.from(
            json["Top_Banner"].map((x) => Banner.fromJson(x))),
        bottomStatus: json["Bottom_Status"],
        bottomBanner: List<Banner>.from(
            json["Bottom_Banner"].map((x) => Banner.fromJson(x))),
        popupStatus: json["Popup_Status"],
        popupBanner: List<Banner>.from(
            json["Popup_Banner"].map((x) => Banner.fromJson(x))),
        liveStatus: json["live_Status"],
        liveData: List<LiveDatum>.from(
            json["live_data"].map((x) => LiveDatum.fromJson(x))),
        astrologersStatus: json["astrologers_Status"],
        astrologers: List<Astrologer>.from(
            json["Astrologers"].map((x) => Astrologer.fromJson(x))),
        blogStatus: json["blog_Status"],
        blogs: List<Blog>.from(json["Blogs"].map((x) => Blog.fromJson(x))),
        walletBal: json["Wallet_Bal"],
      );

  Map<String, dynamic> toJson() => {
        "Top_Status": topStatus,
        "Top_Banner": List<dynamic>.from(topBanner!.map((x) => x.toJson())),
        "Bottom_Status": bottomStatus,
        "Bottom_Banner":
            List<dynamic>.from(bottomBanner!.map((x) => x.toJson())),
        "Popup_Status": popupStatus,
        "Popup_Banner": List<dynamic>.from(popupBanner!.map((x) => x.toJson())),
        "live_Status": liveStatus,
        "live_data": List<dynamic>.from(liveData!.map((x) => x.toJson())),
        "astrologers_Status": astrologersStatus,
        "Astrologers": List<dynamic>.from(astrologers!.map((x) => x.toJson())),
        "blog_Status": blogStatus,
        "Blogs": List<dynamic>.from(blogs!.map((x) => x.toJson())),
        "Wallet_Bal": walletBal,
      };
}

class Astrologer {
  Astrologer({
    this.astrologerId,
    this.firstName,
    this.lastName,
    this.dob,
    this.astroCat,
    this.gender,
    this.mobile,
    this.email,
    this.address,
    this.state,
    this.pincode,
    this.country,
    this.profilePic,
    this.about,
    this.coreSkills,
    this.language,
    this.expertise,
    this.experience,
    this.chatPrice,
    this.maxChatPrice,
    this.audioCallPrice,
    this.maxAudioCallPrice,
    this.videoCallPrice,
    this.maxVideoCallPrice,
    this.bankName,
    this.bankBranch,
    this.bankAccountNo,
    this.ifscCode,
    this.accountHolderName,
    this.fcmToken,
    this.chatAvailStatus,
    this.callAvailStatus,
    this.videoAvailStatus,
  });

  String? astrologerId;
  String? firstName;
  String? lastName;
  DateTime? dob;
  String? astroCat;
  String? gender;
  String? mobile;
  String? email;
  String? address;
  String? state;
  String? pincode;
  String? country;
  String? profilePic;
  String? about;
  String? coreSkills;
  String? language;
  String? expertise;
  String? experience;
  String? chatPrice;
  String? maxChatPrice;
  String? audioCallPrice;
  String? maxAudioCallPrice;
  String? videoCallPrice;
  String? maxVideoCallPrice;
  String? bankName;
  String? bankBranch;
  String? bankAccountNo;
  String? ifscCode;
  String? accountHolderName;
  String? fcmToken;
  String? chatAvailStatus;
  String? callAvailStatus;
  String? videoAvailStatus;

  factory Astrologer.fromJson(Map<String, dynamic> json) => Astrologer(
        astrologerId: json["Astrologer_id"],
        firstName: json["First_name"],
        lastName: json["Last_name"],
        dob: DateTime.parse(json["Dob"]),
        astroCat: json["AstroCat"],
        gender: json["Gender"],
        mobile: json["Mobile"],
        email: json["Email"],
        address: json["Address"],
        state: json["State"],
        pincode: json["Pincode"],
        country: json["Country"],
        profilePic: json["ProfilePic"],
        about: json["About"],
        coreSkills: json["Core_skills"],
        language: json["Language"],
        expertise: json["Expertise"],
        experience: json["Experience"],
        chatPrice: json["Chat_price"],
        maxChatPrice: json["Max_chat_price"],
        audioCallPrice: json["Audio_call_price"],
        maxAudioCallPrice: json["Max_audio_call_price"],
        videoCallPrice: json["Video_call_price"],
        maxVideoCallPrice: json["Max_video_call_price"],
        bankName: json["Bank_name"],
        bankBranch: json["Bank_branch"],
        bankAccountNo: json["Bank_account_no"],
        ifscCode: json["IFSC_code"],
        accountHolderName: json["Account_holder_name"],
        fcmToken: json["FCM_Token"],
        chatAvailStatus: json["Chat_Avail_status"],
        callAvailStatus: json["Call_Avail_Status"],
        videoAvailStatus: json["Video_Avail_Status"],
      );

  Map<String, dynamic> toJson() => {
        "Astrologer_id": astrologerId,
        "First_name": firstName,
        "Last_name": lastName,
        "Dob":
            "${dob!.year.toString().padLeft(4, '0')}-${dob!.month.toString().padLeft(2, '0')}-${dob!.day.toString().padLeft(2, '0')}",
        "AstroCat": astroCat,
        "Gender": gender,
        "Mobile": mobile,
        "Email": email,
        "Address": address,
        "State": state,
        "Pincode": pincode,
        "Country": country,
        "ProfilePic": profilePic,
        "About": about,
        "Core_skills": coreSkills,
        "Language": language,
        "Expertise": expertise,
        "Experience": experience,
        "Chat_price": chatPrice,
        "Max_chat_price": maxChatPrice,
        "Audio_call_price": audioCallPrice,
        "Max_audio_call_price": maxAudioCallPrice,
        "Video_call_price": videoCallPrice,
        "Max_video_call_price": maxVideoCallPrice,
        "Bank_name": bankName,
        "Bank_branch": bankBranch,
        "Bank_account_no": bankAccountNo,
        "IFSC_code": ifscCode,
        "Account_holder_name": accountHolderName,
        "FCM_Token": fcmToken,
        "Chat_Avail_status": chatAvailStatus,
        "Call_Avail_Status": callAvailStatus,
        "Video_Avail_Status": videoAvailStatus,
      };
}

class Blog {
  Blog({
    this.blogId,
    this.blogTitle,
    this.publishDate,
    this.viewCount,
    this.viewCount7Days,
    this.image,
    this.featured,
    this.publisher,
    this.catName,
    this.slug,
  });

  String? blogId;
  String? blogTitle;
  DateTime? publishDate;
  String? viewCount;
  String? viewCount7Days;
  String? image;
  String? featured;
  Publisher? publisher;
  CatName? catName;
  String? slug;

  factory Blog.fromJson(Map<String, dynamic> json) => Blog(
        blogId: json["Blog_ID"],
        blogTitle: json["Blog_Title"],
        publishDate: DateTime.parse(json["Publish_Date"]),
        viewCount: json["View_Count"],
        viewCount7Days: json["View_Count_7Days"],
        image: json["Image"],
        featured: json["featured?"],
        publisher: publisherValues.map[json["Publisher"]],
        catName: catNameValues.map[json["Cat_Name"]],
        slug: json["Slug"],
      );

  Map<String, dynamic> toJson() => {
        "Blog_ID": blogId,
        "Blog_Title": blogTitle,
        "Publish_Date": publishDate!.toIso8601String(),
        "View_Count": viewCount,
        "View_Count_7Days": viewCount7Days,
        "Image": image,
        "featured?": featured,
        "Publisher": publisherValues.reverse![publisher],
        "Cat_Name": catNameValues.reverse![catName],
        "Slug": slug,
      };
}

enum CatName { PLANETS, ASTROLOGY, FESTIVALS }

final catNameValues = EnumValues({
  "Astrology": CatName.ASTROLOGY,
  "Festivals": CatName.FESTIVALS,
  "Planets": CatName.PLANETS
});

enum Publisher { INDRA }

final publisherValues = EnumValues({"Indra": Publisher.INDRA});

class Banner {
  Banner({
    this.promId,
    this.title,
    this.file,
    this.place,
    this.link,
    this.creation,
    this.expiry,
    this.status,
  });

  String? promId;
  String? title;
  String? file;
  String? place;
  String? link;
  DateTime? creation;
  DateTime? expiry;
  String? status;

  factory Banner.fromJson(Map<String, dynamic> json) => Banner(
        promId: json["Prom_id"],
        title: json["Title"],
        file: json["File"],
        place: json["Place"],
        link: json["Link"],
        creation: DateTime.parse(json["Creation"]),
        expiry: DateTime.parse(json["Expiry"]),
        status: json["Status"],
      );

  Map<String, dynamic> toJson() => {
        "Prom_id": promId,
        "Title": title,
        "File": file,
        "Place": place,
        "Link": link,
        "Creation": creation!.toIso8601String(),
        "Expiry":
            "${expiry!.year.toString().padLeft(4, '0')}-${expiry!.month.toString().padLeft(2, '0')}-${expiry!.day.toString().padLeft(2, '0')}",
        "Status": status,
      };
}

class LiveDatum {
  LiveDatum({
    this.sessionId,
    this.astrologerId,
    this.status,
    this.firstName,
    this.lastName,
    this.profilePic,
    this.expertise,
    this.noofusers,
  });

  String? sessionId;
  String? astrologerId;
  String? status;
  String? firstName;
  String? lastName;
  String? profilePic;
  String? expertise;
  String? noofusers;

  factory LiveDatum.fromJson(Map<String, dynamic> json) => LiveDatum(
        sessionId: json["Session_ID"],
        astrologerId: json["Astrologer_ID"],
        status: json["Status"],
        firstName: json["First_name"],
        lastName: json["Last_name"],
        profilePic: json["ProfilePic"],
        expertise: json["Expertise"],
        noofusers: json["noofusers"],
      );

  Map<String, dynamic> toJson() => {
        "Session_ID": sessionId,
        "Astrologer_ID": astrologerId,
        "Status": status,
        "First_name": firstName,
        "Last_name": lastName,
        "ProfilePic": profilePic,
        "Expertise": expertise,
        "noofusers": noofusers,
      };
}

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String>? get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
