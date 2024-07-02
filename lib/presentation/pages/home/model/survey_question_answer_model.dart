class SurveyQuestionAnswerModel {
  int? totalPoints;
  List<Questions>? questions;

  SurveyQuestionAnswerModel({this.totalPoints, this.questions});

  SurveyQuestionAnswerModel.fromJson(Map<String, dynamic> json) {
    totalPoints = json['total_points'];
    if (json['questions'] != null) {
      questions = <Questions>[];
      json['questions'].forEach((v) {
        questions!.add(new Questions.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total_points'] = this.totalPoints;
    if (this.questions != null) {
      data['questions'] = this.questions!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Questions {
  int? questionId;
  String? questionText;
  String? createdAt;
  String? updatedAt;
  List<Answers>? answers;

  Questions(
      {this.questionId,
      this.questionText,
      this.createdAt,
      this.updatedAt,
      this.answers});

  Questions.fromJson(Map<String, dynamic> json) {
    questionId = json['question_id'];
    questionText = json['question_text'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['answers'] != null) {
      answers = <Answers>[];
      json['answers'].forEach((v) {
        answers!.add(new Answers.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['question_id'] = this.questionId;
    data['question_text'] = this.questionText;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.answers != null) {
      data['answers'] = this.answers!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Answers {
  int? answerId;
  String? answerText;
  String? points;
  String? createdAt;
  String? updatedAt;

  Answers(
      {this.answerId,
      this.answerText,
      this.points,
      this.createdAt,
      this.updatedAt});

  Answers.fromJson(Map<String, dynamic> json) {
    answerId = json['answer_id'];
    answerText = json['answer_text'];
    points = json['points'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['answer_id'] = this.answerId;
    data['answer_text'] = this.answerText;
    data['points'] = this.points;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
