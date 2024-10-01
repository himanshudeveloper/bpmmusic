class LibrarySongModel {
  List<LibData>? data;
  Meta? meta;

  LibrarySongModel({this.data, this.meta});

  LibrarySongModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <LibData>[];
      json['data'].forEach((v) {
        data!.add(LibData.fromJson(v));
      });
    }
    meta = json['meta'] != null ? new Meta.fromJson(json['meta']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    if (this.meta != null) {
      data['meta'] = this.meta!.toJson();
    }
    return data;
  }
}

class LibData {
  String? id;
  String? type;
  String? href;
  Attributes? attributes;

  LibData({this.id, this.type, this.href, this.attributes});

  LibData.fromJson(Map<String, dynamic> json) {
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
  String? albumName;
  int? discNumber;
  bool? hasCredits;
  List<String>? genreNames;
  int? trackNumber;
  bool? hasLyrics;
  String? releaseDate;
  int? durationInMillis;
  String? name;
  String? artistName;
  Artwork? artwork;
  PlayParams? playParams;

  Attributes(
      {this.albumName,
      this.discNumber,
      this.hasCredits,
      this.genreNames,
      this.trackNumber,
      this.hasLyrics,
      this.releaseDate,
      this.durationInMillis,
      this.name,
      this.artistName,
      this.artwork,
      this.playParams});

  Attributes.fromJson(Map<String, dynamic> json) {
    albumName = json['albumName'];
    discNumber = json['discNumber'];
    hasCredits = json['hasCredits'];
    genreNames = json['genreNames'].cast<String>();
    trackNumber = json['trackNumber'];
    hasLyrics = json['hasLyrics'];
    releaseDate = json['releaseDate'];
    durationInMillis = json['durationInMillis'];
    name = json['name'];
    artistName = json['artistName'];
    artwork =
        json['artwork'] != null ? new Artwork.fromJson(json['artwork']) : null;
    playParams = json['playParams'] != null
        ? new PlayParams.fromJson(json['playParams'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['albumName'] = this.albumName;
    data['discNumber'] = this.discNumber;
    data['hasCredits'] = this.hasCredits;
    data['genreNames'] = this.genreNames;
    data['trackNumber'] = this.trackNumber;
    data['hasLyrics'] = this.hasLyrics;
    data['releaseDate'] = this.releaseDate;
    data['durationInMillis'] = this.durationInMillis;
    data['name'] = this.name;
    data['artistName'] = this.artistName;
    if (this.artwork != null) {
      data['artwork'] = this.artwork!.toJson();
    }
    if (this.playParams != null) {
      data['playParams'] = this.playParams!.toJson();
    }
    return data;
  }
}

class Artwork {
  int? width;
  int? height;
  String? url;

  Artwork({this.width, this.height, this.url});

  Artwork.fromJson(Map<String, dynamic> json) {
    width = json['width'];
    height = json['height'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['width'] = this.width;
    data['height'] = this.height;
    data['url'] = this.url;
    return data;
  }
}

class PlayParams {
  String? id;
  String? kind;
  bool? isLibrary;
  bool? reporting;
  String? catalogId;
  String? reportingId;

  PlayParams(
      {this.id,
      this.kind,
      this.isLibrary,
      this.reporting,
      this.catalogId,
      this.reportingId});

  PlayParams.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    kind = json['kind'];
    isLibrary = json['isLibrary'];
    reporting = json['reporting'];
    catalogId = json['catalogId'];
    reportingId = json['reportingId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['kind'] = this.kind;
    data['isLibrary'] = this.isLibrary;
    data['reporting'] = this.reporting;
    data['catalogId'] = this.catalogId;
    data['reportingId'] = this.reportingId;
    return data;
  }
}

class Meta {
  int? total;

  Meta({this.total});

  Meta.fromJson(Map<String, dynamic> json) {
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total'] = this.total;
    return data;
  }
}
