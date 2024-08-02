import 'package:bmp_music/features/song/models/song_model.dart';

class SongResponse {
  List<SongModel>? data;

  SongResponse({this.data});

  SongResponse.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <SongModel>[];
      json['data'].forEach((v) {
        data!.add(SongModel.fromJson(v));
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
  bool? hasLyrics;
  bool? isAppleDigitalMaster;
  String? name;
  List<Previews>? previews;
  String? artistName;

  Attributes(
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
      this.hasLyrics,
      this.isAppleDigitalMaster,
      this.name,
      this.previews,
      this.artistName});

  Attributes.fromJson(Map<String, dynamic> json) {
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
    hasLyrics = json['hasLyrics'];
    isAppleDigitalMaster = json['isAppleDigitalMaster'];
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
    data['hasLyrics'] = hasLyrics;
    data['isAppleDigitalMaster'] = isAppleDigitalMaster;
    data['name'] = name;
    if (previews != null) {
      data['previews'] = previews!.map((v) => v.toJson()).toList();
    }
    data['artistName'] = artistName;
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

class Relationships {
  Albums? albums;
  Albums? artists;

  Relationships({this.albums, this.artists});

  Relationships.fromJson(Map<String, dynamic> json) {
    albums =
        json['albums'] != null ? Albums.fromJson(json['albums']) : null;
    artists =
        json['artists'] != null ? Albums.fromJson(json['artists']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (albums != null) {
      data['albums'] = albums!.toJson();
    }
    if (artists != null) {
      data['artists'] = artists!.toJson();
    }
    return data;
  }
}

class Albums {
  String? href;
  List<Data>? data;

  Albums({this.href, this.data});

  Albums.fromJson(Map<String, dynamic> json) {
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

// class Data {
//   String? id;
//   String? type;
//   String? href;

//   Data({this.id, this.type, this.href});

//   Data.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     type = json['type'];
//     href = json['href'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['type'] = this.type;
//     data['href'] = this.href;
//     return data;
//   }
// }
