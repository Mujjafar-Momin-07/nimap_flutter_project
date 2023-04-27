/// Status : 200
/// Message : "Success"
/// data : {"TotalRecords":10,"Records":[{"Id":1,"title":"Smile Crowdfunding","shortDescription":"This foundation will bring smile on there faces","collectedValue":500,"totalValue":5000,"startDate":"05/05/2018","endDate":"10/06/2018","mainImageURL":"https://testffc.nimapinfotech.com/testdatajson/project1.jpg"},{"Id":2,"title":"Animal Funding","shortDescription":"This foundation will help animals","collectedValue":200,"totalValue":10000,"startDate":"10/05/2018","endDate":"11/06/2018","mainImageURL":"https://testffc.nimapinfotech.com/testdatajson/project2.jpg"},{"Id":3,"title":"Children Funding","shortDescription":"This foundation will bring smile on there faces","collectedValue":440,"totalValue":4000,"startDate":"25/05/2018","endDate":"15/06/2018","mainImageURL":"https://testffc.nimapinfotech.com/testdatajson/project3.jpg"},{"Id":4,"title":"Old Age Home Funding","shortDescription":"This foundation will help old age people","collectedValue":500,"totalValue":10000,"startDate":"23/05/2018","endDate":"13/06/2018","mainImageURL":"https://testffc.nimapinfotech.com/testdatajson/project4.jpg"},{"Id":5,"title":"Smile Crowdfunding","shortDescription":"This foundation will bring smile on there faces","collectedValue":2000,"totalValue":50000,"startDate":"05/05/2018","endDate":"14/06/2018","mainImageURL":"https://testffc.nimapinfotech.com/testdatajson/project5.jpg"},{"Id":6,"title":"Children Funding","shortDescription":"This foundation will help poor children","collectedValue":1200,"totalValue":40000,"startDate":"25/05/2018","endDate":"11/06/2018","mainImageURL":"https://testffc.nimapinfotech.com/testdatajson/project6.jpg"},{"Id":7,"title":"Smile Crowdfunding","shortDescription":"This foundation will bring smile on there faces","collectedValue":1000,"totalValue":100000,"startDate":"22/05/2018","endDate":"22/06/2018","mainImageURL":"https://testffc.nimapinfotech.com/testdatajson/project7.jpg"},{"Id":8,"title":"Animal Funding","shortDescription":"This foundation will help animals","collectedValue":500,"totalValue":50000,"startDate":"29/05/2018","endDate":"10/06/2018","mainImageURL":"https://testffc.nimapinfotech.com/testdatajson/project8.jpg"},{"Id":9,"title":"Rotary Club Funding","shortDescription":"This foundation will go to rotary club","collectedValue":200,"totalValue":30000,"startDate":"23/05/2018","endDate":"10/06/2018","mainImageURL":"https://testffc.nimapinfotech.com/testdatajson/project9.jpg"},{"Id":10,"title":"Animal Funding","shortDescription":"This foundation will help animals","collectedValue":750,"totalValue":20000,"startDate":"05/05/2018","endDate":"08/06/2018","mainImageURL":"https://testffc.nimapinfotech.com/testdatajson/project10.jpg"}]}

class Post {
  Post({
      num? status, 
      String? message, 
      Data? data,}){
    _status = status;
    _message = message;
    _data = data;
}

  Post.fromJson(dynamic json) {
    _status = json['Status'];
    _message = json['Message'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  num? _status;
  String? _message;
  Data? _data;
Post copyWith({  num? status,
  String? message,
  Data? data,
}) => Post(  status: status ?? _status,
  message: message ?? _message,
  data: data ?? _data,
);
  num? get status => _status;
  String? get message => _message;
  Data? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Status'] = _status;
    map['Message'] = _message;
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    return map;
  }

}

/// TotalRecords : 10
/// Records : [{"Id":1,"title":"Smile Crowdfunding","shortDescription":"This foundation will bring smile on there faces","collectedValue":500,"totalValue":5000,"startDate":"05/05/2018","endDate":"10/06/2018","mainImageURL":"https://testffc.nimapinfotech.com/testdatajson/project1.jpg"},{"Id":2,"title":"Animal Funding","shortDescription":"This foundation will help animals","collectedValue":200,"totalValue":10000,"startDate":"10/05/2018","endDate":"11/06/2018","mainImageURL":"https://testffc.nimapinfotech.com/testdatajson/project2.jpg"},{"Id":3,"title":"Children Funding","shortDescription":"This foundation will bring smile on there faces","collectedValue":440,"totalValue":4000,"startDate":"25/05/2018","endDate":"15/06/2018","mainImageURL":"https://testffc.nimapinfotech.com/testdatajson/project3.jpg"},{"Id":4,"title":"Old Age Home Funding","shortDescription":"This foundation will help old age people","collectedValue":500,"totalValue":10000,"startDate":"23/05/2018","endDate":"13/06/2018","mainImageURL":"https://testffc.nimapinfotech.com/testdatajson/project4.jpg"},{"Id":5,"title":"Smile Crowdfunding","shortDescription":"This foundation will bring smile on there faces","collectedValue":2000,"totalValue":50000,"startDate":"05/05/2018","endDate":"14/06/2018","mainImageURL":"https://testffc.nimapinfotech.com/testdatajson/project5.jpg"},{"Id":6,"title":"Children Funding","shortDescription":"This foundation will help poor children","collectedValue":1200,"totalValue":40000,"startDate":"25/05/2018","endDate":"11/06/2018","mainImageURL":"https://testffc.nimapinfotech.com/testdatajson/project6.jpg"},{"Id":7,"title":"Smile Crowdfunding","shortDescription":"This foundation will bring smile on there faces","collectedValue":1000,"totalValue":100000,"startDate":"22/05/2018","endDate":"22/06/2018","mainImageURL":"https://testffc.nimapinfotech.com/testdatajson/project7.jpg"},{"Id":8,"title":"Animal Funding","shortDescription":"This foundation will help animals","collectedValue":500,"totalValue":50000,"startDate":"29/05/2018","endDate":"10/06/2018","mainImageURL":"https://testffc.nimapinfotech.com/testdatajson/project8.jpg"},{"Id":9,"title":"Rotary Club Funding","shortDescription":"This foundation will go to rotary club","collectedValue":200,"totalValue":30000,"startDate":"23/05/2018","endDate":"10/06/2018","mainImageURL":"https://testffc.nimapinfotech.com/testdatajson/project9.jpg"},{"Id":10,"title":"Animal Funding","shortDescription":"This foundation will help animals","collectedValue":750,"totalValue":20000,"startDate":"05/05/2018","endDate":"08/06/2018","mainImageURL":"https://testffc.nimapinfotech.com/testdatajson/project10.jpg"}]

class Data {
  Data({
      num? totalRecords, 
      List<Records>? records,}){
    _totalRecords = totalRecords;
    _records = records;
}

  Data.fromJson(dynamic json) {
    _totalRecords = json['TotalRecords'];
    if (json['Records'] != null) {
      _records = [];
      json['Records'].forEach((v) {
        _records?.add(Records.fromJson(v));
      });
    }
  }
  num? _totalRecords;
  List<Records>? _records;
Data copyWith({  num? totalRecords,
  List<Records>? records,
}) => Data(  totalRecords: totalRecords ?? _totalRecords,
  records: records ?? _records,
);
  num? get totalRecords => _totalRecords;
  List<Records>? get records => _records;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['TotalRecords'] = _totalRecords;
    if (_records != null) {
      map['Records'] = _records?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// Id : 1
/// title : "Smile Crowdfunding"
/// shortDescription : "This foundation will bring smile on there faces"
/// collectedValue : 500
/// totalValue : 5000
/// startDate : "05/05/2018"
/// endDate : "10/06/2018"
/// mainImageURL : "https://testffc.nimapinfotech.com/testdatajson/project1.jpg"

class Records {
  Records({
      num? id, 
      String? title, 
      String? shortDescription, 
      num? collectedValue, 
      num? totalValue, 
      String? startDate, 
      String? endDate, 
      String? mainImageURL,}){
    _id = id;
    _title = title;
    _shortDescription = shortDescription;
    _collectedValue = collectedValue;
    _totalValue = totalValue;
    _startDate = startDate;
    _endDate = endDate;
    _mainImageURL = mainImageURL;
}

  Records.fromJson(dynamic json) {
    _id = json['Id'];
    _title = json['title'];
    _shortDescription = json['shortDescription'];
    _collectedValue = json['collectedValue'];
    _totalValue = json['totalValue'];
    _startDate = json['startDate'];
    _endDate = json['endDate'];
    _mainImageURL = json['mainImageURL'];
  }
  num? _id;
  String? _title;
  String? _shortDescription;
  num? _collectedValue;
  num? _totalValue;
  String? _startDate;
  String? _endDate;
  String? _mainImageURL;
Records copyWith({  num? id,
  String? title,
  String? shortDescription,
  num? collectedValue,
  num? totalValue,
  String? startDate,
  String? endDate,
  String? mainImageURL,
}) => Records(  id: id ?? _id,
  title: title ?? _title,
  shortDescription: shortDescription ?? _shortDescription,
  collectedValue: collectedValue ?? _collectedValue,
  totalValue: totalValue ?? _totalValue,
  startDate: startDate ?? _startDate,
  endDate: endDate ?? _endDate,
  mainImageURL: mainImageURL ?? _mainImageURL,
);
  num? get id => _id;
  String? get title => _title;
  String? get shortDescription => _shortDescription;
  num? get collectedValue => _collectedValue;
  num? get totalValue => _totalValue;
  String? get startDate => _startDate;
  String? get endDate => _endDate;
  String? get mainImageURL => _mainImageURL;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Id'] = _id;
    map['title'] = _title;
    map['shortDescription'] = _shortDescription;
    map['collectedValue'] = _collectedValue;
    map['totalValue'] = _totalValue;
    map['startDate'] = _startDate;
    map['endDate'] = _endDate;
    map['mainImageURL'] = _mainImageURL;
    return map;
  }

}