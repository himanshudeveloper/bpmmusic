class ArtistsResponse {
  String? href;
  List<Data>? data;

  ArtistsResponse({this.href, this.data});

  ArtistsResponse.fromJson(Map<String, dynamic> json) {
    href = json['href'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['href'] = href;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? id;
  String? type;
  String? href;
  Attributes? attributes;
  Relationships? relationships;

  Data({this.id, this.type, this.href, this.attributes, this.relationships});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    href = json['href'];
    attributes = json['attributes'] != null
        ? Attributes.fromJson(json['attributes'])
        : null;
    relationships = json['relationships'] != null
        ? Relationships.fromJson(json['relationships'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['type'] = type;
    data['href'] = href;
    if (attributes != null) {
      data['attributes'] = attributes!.toJson();
    }
    if (relationships != null) {
      data['relationships'] = relationships!.toJson();
    }
    return data;
  }
}

class Attributes {
  String? name;
  List<String>? genreNames;
  Artwork? artwork;
  String? url;

  Attributes({this.name, this.genreNames, this.artwork, this.url});

  Attributes.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    genreNames = json['genreNames'].cast<String>();
    artwork =
        json['artwork'] != null ? Artwork.fromJson(json['artwork']) : null;
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['genreNames'] = genreNames;
    if (artwork != null) {
      data['artwork'] = artwork!.toJson();
    }
    data['url'] = url;
    return data;
  }
}

class Artwork {
  int? width;
  int? height;
  String? url;
  String? bgColor;
  String? textColor1;
  String? textColor2;
  String? textColor3;
  String? textColor4;

  Artwork(
      {this.width,
      this.height,
      this.url,
      this.bgColor,
      this.textColor1,
      this.textColor2,
      this.textColor3,
      this.textColor4});

  Artwork.fromJson(Map<String, dynamic> json) {
    width = json['width'];
    height = json['height'];
    url = json['url'];
    bgColor = json['bgColor'];
    textColor1 = json['textColor1'];
    textColor2 = json['textColor2'];
    textColor3 = json['textColor3'];
    textColor4 = json['textColor4'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['width'] = width;
    data['height'] = height;
    data['url'] = url;
    data['bgColor'] = bgColor;
    data['textColor1'] = textColor1;
    data['textColor2'] = textColor2;
    data['textColor3'] = textColor3;
    data['textColor4'] = textColor4;
    return data;
  }
}

class Relationships {
  Albums? albums;

  Relationships({this.albums});

  Relationships.fromJson(Map<String, dynamic> json) {
    albums =
        json['albums'] != null ? Albums.fromJson(json['albums']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (albums != null) {
      data['albums'] = albums!.toJson();
    }
    return data;
  }
}

class Albums {
  String? href;
  String? next;
  List<AlbumData>? data;

  Albums({this.href, this.next, this.data});

  Albums.fromJson(Map<String, dynamic> json) {
    href = json['href'];
    next = json['next'];
    if (json['data'] != null) {
      data = <AlbumData>[];
      json['data'].forEach((v) {
        data!.add(AlbumData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['href'] = href;
    data['next'] = next;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class AlbumData {
  String? id;
  String? type;
  String? href;

  AlbumData({this.id, this.type, this.href});

  AlbumData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    href = json['href'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['type'] = type;
    data['href'] = href;
    return data;
  }
}
