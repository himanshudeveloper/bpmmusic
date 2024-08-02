class SingleAlbumtLibraryModel {
  List<Data>? data;

  SingleAlbumtLibraryModel({this.data});

  SingleAlbumtLibraryModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
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
        ? new Attributes.fromJson(json['attributes'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['type'] = this.type;
    data['href'] = this.href;
    if (this.attributes != null) {
      data['attributes'] = this.attributes!.toJson();
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
  PlayParams? playParams;
  String? url;
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
      this.playParams,
      this.url,
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
        json['artwork'] != null ? new Artwork.fromJson(json['artwork']) : null;
    playParams = json['playParams'] != null
        ? new PlayParams.fromJson(json['playParams'])
        : null;
    url = json['url'];
    recordLabel = json['recordLabel'];
    isCompilation = json['isCompilation'];
    trackCount = json['trackCount'];
    isSingle = json['isSingle'];
    name = json['name'];
    artistName = json['artistName'];
    isComplete = json['isComplete'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['copyright'] = this.copyright;
    data['genreNames'] = this.genreNames;
    data['releaseDate'] = this.releaseDate;
    data['upc'] = this.upc;
    data['isMasteredForItunes'] = this.isMasteredForItunes;
    if (this.artwork != null) {
      data['artwork'] = this.artwork!.toJson();
    }
    if (this.playParams != null) {
      data['playParams'] = this.playParams!.toJson();
    }
    data['url'] = this.url;
    data['recordLabel'] = this.recordLabel;
    data['isCompilation'] = this.isCompilation;
    data['trackCount'] = this.trackCount;
    data['isSingle'] = this.isSingle;
    data['name'] = this.name;
    data['artistName'] = this.artistName;
    data['isComplete'] = this.isComplete;
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['width'] = this.width;
    data['height'] = this.height;
    data['url'] = this.url;
    data['bgColor'] = this.bgColor;
    data['textColor1'] = this.textColor1;
    data['textColor2'] = this.textColor2;
    data['textColor3'] = this.textColor3;
    data['textColor4'] = this.textColor4;
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['kind'] = this.kind;
    return data;
  }
}
