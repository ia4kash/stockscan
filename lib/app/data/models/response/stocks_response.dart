List<Stocks> parseStocksResponse(List data) {
  List<Stocks> stocksList = [];

  data.forEach((v) {
    stocksList.add(Stocks.fromJson(v));
  });
  return stocksList;
}

class Stocks {
  Stocks({
    this.id,
    this.name,
    this.tag,
    this.color,
    this.criteria,
  });

  Stocks.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    tag = json['tag'];
    color = json['color'];
    if (json['criteria'] != null) {
      criteria = [];
      json['criteria'].forEach((v) {
        criteria?.add(Criteria.fromJson(v));
      });
    }
  }

  int? id;
  String? name;
  String? tag;
  String? color;
  List<Criteria>? criteria;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['tag'] = tag;
    map['color'] = color;
    if (criteria != null) {
      map['criteria'] = criteria?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class Criteria {
  Criteria({
    this.type,
    this.text,
    this.variables,
  });

  Criteria.fromJson(dynamic json) {
    type = json['type'];
    text = json['text'];
    if (json['variable'] != null) variables = parseMap(json['variable']);
  }

  Map<String, Variable> parseMap(Map data) {
    final output = <String, Variable>{};
    data.entries.forEach((MapEntry e) {
      output[e.key] = Variable.fromJson(e.value);
    });
    return output;
  }

  String? type;
  String? text;
  Map<String, Variable>? variables;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['type'] = type;
    map['text'] = text;
    return map;
  }
}

class Variable {
  Variable({
    this.type,
    this.studyType,
    this.parameterName,
    this.minValue,
    this.maxValue,
    this.defaultValue,
    this.values,
  });

  Variable.fromJson(dynamic json) {
    type = json['type'];
    studyType = json['study_type'];
    parameterName = json['parameter_name'];
    minValue = json['min_value'];
    maxValue = json['max_value'];
    defaultValue = json['default_value'];
    if (json['values'] != null) {
      values = [];
      json['values'].forEach((v) {
        values?.add(v);
      });
    }
  }

  String? type;
  String? studyType;
  String? parameterName;
  int? minValue;
  int? maxValue;
  int? defaultValue;
  List<num>? values;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['type'] = type;
    map['study_type'] = studyType;
    map['parameter_name'] = parameterName;
    map['min_value'] = minValue;
    map['max_value'] = maxValue;
    map['default_value'] = defaultValue;
    map['values'] = defaultValue;
    return map;
  }
}
