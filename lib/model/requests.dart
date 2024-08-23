class Requests {
  int? id;
  String? title;
  Null? descriptionOld;
  String? description;
  int? requestedby;
  String? createdAt;
  String? updatedAt;
  String? requestFile;
  Null? attachFile;
  String? make;
  String? model;
  int? yearofmake;
  String? registrationnumber;
  String? faultCode;
  int? isSolved;

  Requests(
      {this.id,
        this.title,
        this.descriptionOld,
        this.description,
        this.requestedby,
        this.createdAt,
        this.updatedAt,
        this.requestFile,
        this.attachFile,
        this.make,
        this.model,
        this.yearofmake,
        this.registrationnumber,
        this.faultCode,
        this.isSolved});

  Requests.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    descriptionOld = json['description_old'];
    description = json['description'];
    requestedby = json['requestedby'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    requestFile = json['requestFile'];
    attachFile = json['attachFile'];
    make = json['make'];
    model = json['model'];
    yearofmake = json['yearofmake'];
    registrationnumber = json['registrationnumber'];
    faultCode = json['faultCode'];
    isSolved = json['isSolved'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['description_old'] = this.descriptionOld;
    data['description'] = this.description;
    data['requestedby'] = this.requestedby;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['requestFile'] = this.requestFile;
    data['attachFile'] = this.attachFile;
    data['make'] = this.make;
    data['model'] = this.model;
    data['yearofmake'] = this.yearofmake;
    data['registrationnumber'] = this.registrationnumber;
    data['faultCode'] = this.faultCode;
    data['isSolved'] = this.isSolved;
    return data;
  }
}