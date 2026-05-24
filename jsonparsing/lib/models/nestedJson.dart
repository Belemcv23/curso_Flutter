/*{
"shape:name":"rectangulo",
"property":{
  "width":5.0,
  "height":10.0
}
}
}*/

class Property{
  double? width;
  double? height;

  Property({this.width, this.height});

  factory Property.fromJson(Map<String, dynamic> json){
    return Property(
      width: json['width'],
      height: json['height'],
    );
  }
}

class Shape{
  String shapeName;
  Property property;

  Shape({required this.shapeName, required this.property});

  factory Shape.fromJson(Map<String, dynamic> json){
    return Shape(
      shapeName: json['shape:name'],
      property: Property.fromJson(json['property']),
    );
  }
}