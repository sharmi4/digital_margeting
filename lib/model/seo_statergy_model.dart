class StrategyModel {
  final String content;
  final int completedtask;
  final int totaltask;
  final int snumber;

  StrategyModel({
    required this.content,
    required this.completedtask,
    required this.totaltask,
    required this.snumber,


  });

  factory StrategyModel.fromJson(Map<String, dynamic> json) {
    return StrategyModel(
      content: json['content'] ?? '',
      completedtask: json['completedtask'] ?? 0,
      totaltask: json['totaltask'] ?? 0, 
      snumber: json["snumber"]??0, 
    
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'content': content,
      'completedtask': completedtask,
      'totaltask': totaltask,
      "snumber":snumber,
    };
  }
}
