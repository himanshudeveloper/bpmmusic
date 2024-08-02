class ArtistModel {
  List<Data>? data;

  ArtistModel({this.data});

  ArtistModel.fromJson(Map<String, dynamic> json) {
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
  Views? views;
  Meta? meta;

  Data(
      {this.id,
      this.type,
      this.href,
      this.attributes,
      this.relationships,
      this.views,
      this.meta});

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
    views = json['views'] != null ? Views.fromJson(json['views']) : null;
    meta = json['meta'] != null ? Meta.fromJson(json['meta']) : null;
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
    if (views != null) {
      data['views'] = views!.toJson();
    }
    if (meta != null) {
      data['meta'] = meta!.toJson();
    }
    return data;
  }
}

class Attributes {
  List<String>? genreNames;
  String? name;
  Artwork? artwork;
  String? url;

  Attributes({this.genreNames, this.name, this.artwork, this.url});

  Attributes.fromJson(Map<String, dynamic> json) {
    genreNames = json['genreNames'].cast<String>();
    name = json['name'];
    artwork =
        json['artwork'] != null ? Artwork.fromJson(json['artwork']) : null;
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['genreNames'] = genreNames;
    data['name'] = name;
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

class Views {
  TopSongs? topSongs;

  Views({this.topSongs});

  Views.fromJson(Map<String, dynamic> json) {
    topSongs = json['top-songs'] != null
        ? TopSongs.fromJson(json['top-songs'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (topSongs != null) {
      data['top-songs'] = topSongs!.toJson();
    }
    return data;
  }
}

class TopSongs {
  String? href;
  String? next;
  TopSongAttributes? attributes;
  List<TopSongData>? data;

  TopSongs({this.href, this.next, this.attributes, this.data});

  TopSongs.fromJson(Map<String, dynamic> json) {
    href = json['href'];
    next = json['next'];
    attributes = json['attributes'] != null
        ? TopSongAttributes.fromJson(json['attributes'])
        : null;
    if (json['data'] != null) {
      data = <TopSongData>[];
      json['data'].forEach((v) {
        data!.add(TopSongData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['href'] = href;
    data['next'] = next;
    if (attributes != null) {
      data['attributes'] = attributes!.toJson();
    }
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class TopSongAttributes {
  String? title;

  TopSongAttributes({this.title});

  TopSongAttributes.fromJson(Map<String, dynamic> json) {
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    return data;
  }
}

class TopSongData {
  String? id;
  String? type;
  String? href;
  TOpSongAttributes? attributes;

  TopSongData({this.id, this.type, this.href, this.attributes});

  TopSongData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    href = json['href'];
    attributes = json['attributes'] != null
        ? TOpSongAttributes.fromJson(json['attributes'])
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

class TOpSongAttributes {
  String? albumName;
  List<String>? genreNames;
  int? trackNumber;
  String? releaseDate;
  int? durationInMillis;
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

  TOpSongAttributes(
      {this.albumName,
      this.genreNames,
      this.trackNumber,
      this.releaseDate,
      this.durationInMillis,
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

  TOpSongAttributes.fromJson(Map<String, dynamic> json) {
    albumName = json['albumName'];
    genreNames = json['genreNames'].cast<String>();
    trackNumber = json['trackNumber'];
    releaseDate = json['releaseDate'];
    durationInMillis = json['durationInMillis'];
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
    data['releaseDate'] = releaseDate;
    data['durationInMillis'] = durationInMillis;
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

class Meta {
  Views? views;

  Meta({this.views});

  Meta.fromJson(Map<String, dynamic> json) {
    views = json['views'] != null ? Views.fromJson(json['views']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (views != null) {
      data['views'] = views!.toJson();
    }
    return data;
  }
}

// class Views {
//   List<String>? order;

//   Views({this.order});

//   Views.fromJson(Map<String, dynamic> json) {
//     order = json['order'].cast<String>();
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['order'] = this.order;
//     return data;
//   }
// }
