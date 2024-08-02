class AlbumModel {
  List<Data>? data;

  AlbumModel({this.data});

  AlbumModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
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
  String? copyright;
  List<String>? genreNames;
  String? releaseDate;
  String? upc;
  bool? isMasteredForItunes;
  Artwork? artwork;
  PlayParams? playParams;
  String? url;
  String? recordLabel;
  int? trackCount;
  bool? isCompilation;
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
      this.trackCount,
      this.isCompilation,
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
    playParams = json['playParams'] != null
        ? PlayParams.fromJson(json['playParams'])
        : null;
    url = json['url'];
    recordLabel = json['recordLabel'];
    trackCount = json['trackCount'];
    isCompilation = json['isCompilation'];
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
    if (playParams != null) {
      data['playParams'] = playParams!.toJson();
    }
    data['url'] = url;
    data['recordLabel'] = recordLabel;
    data['trackCount'] = trackCount;
    data['isCompilation'] = isCompilation;
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

class Relationships {
  Artists? artists;
  Artists? tracks;

  Relationships({this.artists, this.tracks});

  Relationships.fromJson(Map<String, dynamic> json) {
    artists =
        json['artists'] != null ? Artists.fromJson(json['artists']) : null;
    tracks =
        json['tracks'] != null ? Artists.fromJson(json['tracks']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (artists != null) {
      data['artists'] = artists!.toJson();
    }
    if (tracks != null) {
      data['tracks'] = tracks!.toJson();
    }
    return data;
  }
}

class Artists {
  String? href;
  List<Data>? data;

  Artists({this.href, this.data});

  Artists.fromJson(Map<String, dynamic> json) {
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

class ArtinstData {
  String? id;
  String? type;
  String? href;

  ArtinstData({this.id, this.type, this.href});

  ArtinstData.fromJson(Map<String, dynamic> json) {
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

class TrackData {
  String? id;
  String? type;
  String? href;
  TrackAttributes? attributes;

  TrackData({this.id, this.type, this.href, this.attributes});

  TrackData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    href = json['href'];
    attributes = json['attributes'] != null
        ? TrackAttributes.fromJson(json['attributes'])
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

class TrackAttributes {
  String? albumName;
  List<String>? genreNames;
  int? trackNumber;
  int? durationInMillis;
  String? releaseDate;
  String? isrc;
  Artwork? artwork;
  String? composerName;
  String? url;
  PlayParams? playParams;
  int? discNumber;
  bool? hasCredits;
  bool? isAppleDigitalMaster;
  bool? hasLyrics;
  String? name;
  List<Previews>? previews;
  String? artistName;

  TrackAttributes(
      {this.albumName,
      this.genreNames,
      this.trackNumber,
      this.durationInMillis,
      this.releaseDate,
      this.isrc,
      this.artwork,
      this.composerName,
      this.url,
      this.playParams,
      this.discNumber,
      this.hasCredits,
      this.isAppleDigitalMaster,
      this.hasLyrics,
      this.name,
      this.previews,
      this.artistName});

  TrackAttributes.fromJson(Map<String, dynamic> json) {
    albumName = json['albumName'];
    genreNames = json['genreNames'].cast<String>();
    trackNumber = json['trackNumber'];
    durationInMillis = json['durationInMillis'];
    releaseDate = json['releaseDate'];
    isrc = json['isrc'];
    artwork =
        json['artwork'] != null ? Artwork.fromJson(json['artwork']) : null;
    composerName = json['composerName'];
    url = json['url'];
    playParams = json['playParams'] != null
        ? PlayParams.fromJson(json['playParams'])
        : null;
    discNumber = json['discNumber'];
    hasCredits = json['hasCredits'];
    isAppleDigitalMaster = json['isAppleDigitalMaster'];
    hasLyrics = json['hasLyrics'];
    name = json['name'];
    if (json['previews'] != null) {
      previews = <Previews>[];
      json['previews'].forEach((v) {
        previews!.add(Previews.fromJson(v));
      });
    }
    artistName = json['artistName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['albumName'] = albumName;
    data['genreNames'] = genreNames;
    data['trackNumber'] = trackNumber;
    data['durationInMillis'] = durationInMillis;
    data['releaseDate'] = releaseDate;
    data['isrc'] = isrc;
    if (artwork != null) {
      data['artwork'] = artwork!.toJson();
    }
    data['composerName'] = composerName;
    data['url'] = url;
    if (playParams != null) {
      data['playParams'] = playParams!.toJson();
    }
    data['discNumber'] = discNumber;
    data['hasCredits'] = hasCredits;
    data['isAppleDigitalMaster'] = isAppleDigitalMaster;
    data['hasLyrics'] = hasLyrics;
    data['name'] = name;
    if (previews != null) {
      data['previews'] = previews!.map((v) => v.toJson()).toList();
    }
    data['artistName'] = artistName;
    return data;
  }
}

class Previews {
  String? url;

  Previews({this.url});

  Previews.fromJson(Map<String, dynamic> json) {
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['url'] = url;
    return data;
  }
}
