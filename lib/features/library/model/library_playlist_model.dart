class LibraryPlaylistModel {
  List<Data>? data;
  Meta? meta;

  LibraryPlaylistModel({this.data, this.meta});

  LibraryPlaylistModel.fromJson(Map<String, dynamic> json) {
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
  String? lastModifiedDate;
  bool? canEdit;
  String? name;
  bool? isPublic;
  Description? description;
  bool? hasCatalog;
  PlayParams? playParams;
  String? dateAdded;
  Artwork? artwork;

  Attributes(
      {this.lastModifiedDate,
      this.canEdit,
      this.name,
      this.isPublic,
      this.description,
      this.hasCatalog,
      this.playParams,
      this.dateAdded,
      this.artwork});

  Attributes.fromJson(Map<String, dynamic> json) {
    lastModifiedDate = json['lastModifiedDate'];
    canEdit = json['canEdit'];
    name = json['name'];
    isPublic = json['isPublic'];
    description = json['description'] != null
        ? new Description.fromJson(json['description'])
        : null;
    hasCatalog = json['hasCatalog'];
    playParams = json['playParams'] != null
        ? new PlayParams.fromJson(json['playParams'])
        : null;
    dateAdded = json['dateAdded'];
    artwork =
        json['artwork'] != null ? new Artwork.fromJson(json['artwork']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['lastModifiedDate'] = this.lastModifiedDate;
    data['canEdit'] = this.canEdit;
    data['name'] = this.name;
    data['isPublic'] = this.isPublic;
    if (this.description != null) {
      data['description'] = this.description!.toJson();
    }
    data['hasCatalog'] = this.hasCatalog;
    if (this.playParams != null) {
      data['playParams'] = this.playParams!.toJson();
    }
    data['dateAdded'] = this.dateAdded;
    if (this.artwork != null) {
      data['artwork'] = this.artwork!.toJson();
    }
    return data;
  }
}

class Description {
  String? standard;

  Description({this.standard});

  Description.fromJson(Map<String, dynamic> json) {
    standard = json['standard'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['standard'] = this.standard;
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
