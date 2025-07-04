class StrategyInputModel {
  final String businessName;
  final String? websiteUrl;
  final String aboutBrand;
  final String businessCategory;
  final String audienceType;
  final String targetLocation;
  final String linkedinUrl;
  final String facebookUrl;
  final String gmbUrl;
  final String instagramUrl;




  StrategyInputModel({
    required this.businessName,
    required this.websiteUrl,
    required this.aboutBrand,
    required this.businessCategory,
    required this.audienceType,
    required this.targetLocation,
    required this.linkedinUrl,
    required this.facebookUrl,
    required this.gmbUrl,
    required this.instagramUrl,
    


  });

  factory StrategyInputModel.fromJson(Map<String, dynamic> json) {
    return StrategyInputModel(
      businessName: json['businessName'] ?? '',
      websiteUrl: json['websiteUrl'],
      aboutBrand: json['aboutBrand'] ?? '',
      businessCategory: json['businessCategory'] ?? '',
      audienceType: json['audienceType'] ?? '',
      targetLocation: json['targetLocation'] ?? '',
      linkedinUrl: json['linkedinUrl'] ?? '',
      facebookUrl: json['facebookUrl'] ?? '',
      gmbUrl: json['gmbUrl'] ?? '',
      instagramUrl: json['instagramUrl'] ?? '', 

      
      
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "businessName": businessName,
      "websiteUrl": websiteUrl,
      "aboutBrand": aboutBrand,
      "businessCategory": businessCategory,
      "audienceType": audienceType,
      "targetLocation": targetLocation,
      "linkedinUrl": linkedinUrl,
      "facebookUrl": facebookUrl,
      "gmbUrl": gmbUrl,
      "instagramUrl": instagramUrl,
      

    };
  }
}
