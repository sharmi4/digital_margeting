class SeoTaskModel {
  final String taskname;
  final String ?id;

  final String? insturctions;
  final dynamic? iscompleted;
  final int? snumber;
  final String? date;
  final String type;
  final String businessId;



  SeoTaskModel({
    required this.taskname,
     this.insturctions,
     this.id,
     this.iscompleted,
     this.snumber,
     this.date,
     required this.type,
     required this.businessId
  });

  factory SeoTaskModel.fromJson(Map<String, dynamic> json) {
    return SeoTaskModel(
      taskname: json['taskname'] ?? '',
      id: json['id']?.toString() ?? '',
      insturctions: json['insturctions'] ?? "",
      iscompleted: json['iscompleted'] ?? "", 
      snumber: json["snumber"]??0, 
      date: json["date"]??"", 
      type: json['type']??'', 
       businessId: json['businessId']?.toString() ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'taskname': taskname,
      'id': id,
      'insturctions': insturctions,
      'iscompleted': iscompleted,
      "snumber":snumber,
      "date":date,
      "type":type,
      "businessId":businessId

    };
  }
}
