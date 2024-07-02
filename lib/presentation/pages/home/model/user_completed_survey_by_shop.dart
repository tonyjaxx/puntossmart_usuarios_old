class UserCompletedSurveysByShopModel {
  int? count;
  List<Surveys>? surveys;

  UserCompletedSurveysByShopModel({this.count, this.surveys});

  UserCompletedSurveysByShopModel.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    if (json['surveys'] != null) {
      surveys = <Surveys>[];
      json['surveys'].forEach((v) {
        surveys!.add(new Surveys.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['count'] = this.count;
    if (this.surveys != null) {
      data['surveys'] = this.surveys!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Surveys {
  int? surveyId;
  String? surveyTitle;
  String? surveyCreatedAt;
  String? surveyUpdatedAt;
  int? surveyIsDeleted;
  int? totalPoints;

  Surveys(
      {this.surveyId,
      this.surveyTitle,
      this.surveyCreatedAt,
      this.surveyUpdatedAt,
      this.surveyIsDeleted,
      this.totalPoints});

  Surveys.fromJson(Map<String, dynamic> json) {
    surveyId = json['survey_id'];
    surveyTitle = json['survey_title'];
    surveyCreatedAt = json['survey_created_at'];
    surveyUpdatedAt = json['survey_updated_at'];
    surveyIsDeleted = json['survey_is_deleted'];
    totalPoints = json['total_points'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['survey_id'] = this.surveyId;
    data['survey_title'] = this.surveyTitle;
    data['survey_created_at'] = this.surveyCreatedAt;
    data['survey_updated_at'] = this.surveyUpdatedAt;
    data['survey_is_deleted'] = this.surveyIsDeleted;
    data['total_points'] = this.totalPoints;
    return data;
  }
}
