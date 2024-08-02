class AlbumResponse {
  String? href;
  String? next;
  List<Data>? data;

  AlbumResponse({this.href, this.next, this.data});

  AlbumResponse.fromJson(Map<String, dynamic> json) {
    href = json['href'];
    next = json['next'];
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
    data['next'] = next;
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

  Data({this.id, this.type, this.href, this.attributes});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    href = json['href'];
    attributes = json['attributes'] != null
        ? Attributes.fromJson(json['attributes'])
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
    return data;
  }
}

class Attributes {
  String? copyright;
  List<String>? genreNames;
  String? releaseDate;
  String? upc;
  bool? isMasteredForItunes;
  Artwork? artwork;
  String? url;
  PlayParams? playParams;
  String? recordLabel;
  bool? isCompilation;
  int? trackCount;
  bool? isSingle;
  String? name;
  String? artistName;
  bool? isComplete;

  Attributes(
      {this.copyright,
      this.genreNames,
      this.releaseDate,
      this.upc,
      this.isMasteredForItunes,
      this.artwork,
      this.url,
      this.playParams,
      this.recordLabel,
      this.isCompilation,
      this.trackCount,
      this.isSingle,
      this.name,
      this.artistName,
      this.isComplete});

  Attributes.fromJson(Map<String, dynamic> json) {
    copyright = json['copyright'];
    genreNames = json['genreNames'].cast<String>();
    releaseDate = json['releaseDate'];
    upc = json['upc'];
    isMasteredForItunes = json['isMasteredForItunes'];
    artwork =
        json['artwork'] != null ? Artwork.fromJson(json['artwork']) : null;
    url = json['url'];
    playParams = json['playParams'] != null
        ? PlayParams.fromJson(json['playParams'])
        : null;
    recordLabel = json['recordLabel'];
    isCompilation = json['isCompilation'];
    trackCount = json['trackCount'];
    isSingle = json['isSingle'];
    name = json['name'];
    artistName = json['artistName'];
    isComplete = json['isComplete'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['copyright'] = copyright;
    data['genreNames'] = genreNames;
    data['releaseDate'] = releaseDate;
    data['upc'] = upc;
    data['isMasteredForItunes'] = isMasteredForItunes;
    if (artwork != null) {
      data['artwork'] = artwork!.toJson();
    }
    data['url'] = url;
    if (playParams != null) {
      data['playParams'] = playParams!.toJson();
    }
    data['recordLabel'] = recordLabel;
    data['isCompilation'] = isCompilation;
    data['trackCount'] = trackCount;
    data['isSingle'] = isSingle;
    data['name'] = name;
    data['artistName'] = artistName;
    data['isComplete'] = isComplete;
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

class PlayParams {
  String? id;
  String? kind;

  PlayParams({this.id, this.kind});

  PlayParams.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    kind = json['kind'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['kind'] = kind;
    return data;
  }
}
