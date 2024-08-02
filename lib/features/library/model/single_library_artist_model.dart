// class SingleArtistLibraryModel {
//   List<Data>? data;
//   Meta? meta;

//   SingleArtistLibraryModel({this.data, this.meta});

//   SingleArtistLibraryModel.fromJson(Map<String, dynamic> json) {
//     if (json['data'] != null) {
//       data = <Data>[];
//       json['data'].forEach((v) {
//         data!.add(new Data.fromJson(v));
//       });
//     }
//     meta = json['meta'] != null ? new Meta.fromJson(json['meta']) : null;
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (this.data != null) {
//       data['data'] = this.data!.map((v) => v.toJson()).toList();
//     }
//     if (this.meta != null) {
//       data['meta'] = this.meta!.toJson();
//     }
//     return data;
//   }
// }

// class Data {
//   String? id;
//   String? type;
//   String? href;
//   Attributes? attributes;

//   Data({this.id, this.type, this.href, this.attributes});

//   Data.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     type = json['type'];
//     href = json['href'];
//     attributes = json['attributes'] != null
//         ? new Attributes.fromJson(json['attributes'])
//         : null;
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['type'] = this.type;
//     data['href'] = this.href;
//     if (this.attributes != null) {
//       data['attributes'] = this.attributes!.toJson();
//     }
//     return data;
//   }
// }

// class Attributes {
//   int? trackCount;
//   List<String>? genreNames;
//   String? releaseDate;
//   String? name;
//   String? artistName;
//   Artwork? artwork;
//   PlayParams? playParams;
//   String? dateAdded;

//   Attributes(
//       {this.trackCount,
//       this.genreNames,
//       this.releaseDate,
//       this.name,
//       this.artistName,
//       this.artwork,
//       this.playParams,
//       this.dateAdded});

//   Attributes.fromJson(Map<String, dynamic> json) {
//     trackCount = json['trackCount'];
//     genreNames = json['genreNames'].cast<String>();
//     releaseDate = json['releaseDate'];
//     name = json['name'];
//     artistName = json['artistName'];
//     artwork =
//         json['artwork'] != null ? new Artwork.fromJson(json['artwork']) : null;
//     playParams = json['playParams'] != null
//         ? new PlayParams.fromJson(json['playParams'])
//         : null;
//     dateAdded = json['dateAdded'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['trackCount'] = this.trackCount;
//     data['genreNames'] = this.genreNames;
//     data['releaseDate'] = this.releaseDate;
//     data['name'] = this.name;
//     data['artistName'] = this.artistName;
//     if (this.artwork != null) {
//       data['artwork'] = this.artwork!.toJson();
//     }
//     if (this.playParams != null) {
//       data['playParams'] = this.playParams!.toJson();
//     }
//     data['dateAdded'] = this.dateAdded;
//     return data;
//   }
// }

// class Artwork {
//   int? width;
//   int? height;
//   String? url;

//   Artwork({this.width, this.height, this.url});

//   Artwork.fromJson(Map<String, dynamic> json) {
//     width = json['width'];
//     height = json['height'];
//     url = json['url'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['width'] = this.width;
//     data['height'] = this.height;
//     data['url'] = this.url;
//     return data;
//   }
// }

// class PlayParams {
//   String? id;
//   String? kind;
//   bool? isLibrary;

//   PlayParams({this.id, this.kind, this.isLibrary});

//   PlayParams.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     kind = json['kind'];
//     isLibrary = json['isLibrary'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['kind'] = this.kind;
//     data['isLibrary'] = this.isLibrary;
//     return data;
//   }
// }

// class Meta {
//   int? total;

//   Meta({this.total});

//   Meta.fromJson(Map<String, dynamic> json) {
//     total = json['total'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['total'] = this.total;
//     return data;
//   }
// }
class SingleArtistLibraryModel {
  List<Data>? data;
  Meta? meta;

  SingleArtistLibraryModel({this.data, this.meta});

  SingleArtistLibraryModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
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
        ? new Attributes.fromJson(json['attributes'])
        : null;
    relationships = json['relationships'] != null
        ? new Relationships.fromJson(json['relationships'])
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
    if (this.relationships != null) {
      data['relationships'] = this.relationships!.toJson();
    }
    return data;
  }
}

class Attributes {
  int? trackCount;
  List<String>? genreNames;
  String? releaseDate;
  String? name;
  String? artistName;
  Artwork? artwork;
  String? dateAdded;
  PlayParams? playParams;

  Attributes(
      {this.trackCount,
      this.genreNames,
      this.releaseDate,
      this.name,
      this.artistName,
      this.artwork,
      this.dateAdded,
      this.playParams});

  Attributes.fromJson(Map<String, dynamic> json) {
    trackCount = json['trackCount'];
    genreNames = json['genreNames'].cast<String>();
    releaseDate = json['releaseDate'];
    name = json['name'];
    artistName = json['artistName'];
    artwork =
        json['artwork'] != null ? new Artwork.fromJson(json['artwork']) : null;
    dateAdded = json['dateAdded'];
    playParams = json['playParams'] != null
        ? new PlayParams.fromJson(json['playParams'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['trackCount'] = this.trackCount;
    data['genreNames'] = this.genreNames;
    data['releaseDate'] = this.releaseDate;
    data['name'] = this.name;
    data['artistName'] = this.artistName;
    if (this.artwork != null) {
      data['artwork'] = this.artwork!.toJson();
    }
    data['dateAdded'] = this.dateAdded;
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

  PlayParams({this.id, this.kind, this.isLibrary});

  PlayParams.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    kind = json['kind'];
    isLibrary = json['isLibrary'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['kind'] = this.kind;
    data['isLibrary'] = this.isLibrary;
    return data;
  }
}

class Relationships {
  Tracks? tracks;

  Relationships({this.tracks});

  Relationships.fromJson(Map<String, dynamic> json) {
    tracks =
        json['tracks'] != null ? new Tracks.fromJson(json['tracks']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.tracks != null) {
      data['tracks'] = this.tracks!.toJson();
    }
    return data;
  }
}

class Tracks {
  String? href;
  List<TrackData>? data;
  Meta? meta;

  Tracks({this.href, this.data, this.meta});

  Tracks.fromJson(Map<String, dynamic> json) {
    href = json['href'];
    if (json['data'] != null) {
      data = <TrackData>[];
      json['data'].forEach((v) {
        data!.add(new TrackData.fromJson(v));
      });
    }
    meta = json['meta'] != null ? new Meta.fromJson(json['meta']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['href'] = this.href;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    if (this.meta != null) {
      data['meta'] = this.meta!.toJson();
    }
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
        ? new TrackAttributes.fromJson(json['attributes'])
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

class TrackAttributes {
  int? discNumber;
  String? albumName;
  List<String>? genreNames;
  bool? hasCredits;
  int? trackNumber;
  bool? hasLyrics;
  String? releaseDate;
  int? durationInMillis;
  String? name;
  String? artistName;
  Artwork? artwork;
  TrackPlayParams? playParams;

  TrackAttributes(
      {this.discNumber,
      this.albumName,
      this.genreNames,
      this.hasCredits,
      this.trackNumber,
      this.hasLyrics,
      this.releaseDate,
      this.durationInMillis,
      this.name,
      this.artistName,
      this.artwork,
      this.playParams});

  TrackAttributes.fromJson(Map<String, dynamic> json) {
    discNumber = json['discNumber'];
    albumName = json['albumName'];
    genreNames = json['genreNames'].cast<String>();
    hasCredits = json['hasCredits'];
    trackNumber = json['trackNumber'];
    hasLyrics = json['hasLyrics'];
    releaseDate = json['releaseDate'];
    durationInMillis = json['durationInMillis'];
    name = json['name'];
    artistName = json['artistName'];
    artwork =
        json['artwork'] != null ? new Artwork.fromJson(json['artwork']) : null;
    playParams = json['playParams'] != null
        ? new TrackPlayParams.fromJson(json['playParams'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['discNumber'] = this.discNumber;
    data['albumName'] = this.albumName;
    data['genreNames'] = this.genreNames;
    data['hasCredits'] = this.hasCredits;
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

class TrackPlayParams {
  String? id;
  String? kind;
  bool? isLibrary;
  bool? reporting;
  String? catalogId;
  String? reportingId;

  TrackPlayParams(
      {this.id,
      this.kind,
      this.isLibrary,
      this.reporting,
      this.catalogId,
      this.reportingId});

  TrackPlayParams.fromJson(Map<String, dynamic> json) {
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
