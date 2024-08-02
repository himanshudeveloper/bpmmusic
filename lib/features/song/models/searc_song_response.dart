import 'package:bmp_music/features/song/models/album_model.dart';
import 'package:bmp_music/features/song/models/artists_model.dart';
import 'package:bmp_music/features/song/models/song_response.dart';
import 'package:bmp_music/features/song/models/top_result_model.dart';

class SearchSongResponse {
  Results? results;
  Meta? meta;

  SearchSongResponse({this.results, this.meta});

  SearchSongResponse.fromJson(Map<String, dynamic> json) {
    results =
        json['results'] != null ? Results.fromJson(json['results']) : null;
    meta = json['meta'] != null ? Meta.fromJson(json['meta']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (results != null) {
      data['results'] = results!.toJson();
    }
    if (meta != null) {
      data['meta'] = meta!.toJson();
    }
    return data;
  }
}

class Results {
  TopResultResponse? topResults;
  AlbumResponse? albums;
  SongResponse? songs;
  ArtistsResponse? artists;

  Results({this.topResults, this.albums, this.songs, this.artists});

  Results.fromJson(Map<String, dynamic> json) {
    topResults = json['topResults'] != null
        ? TopResultResponse.fromJson(json['topResults'])
        : null;
    albums = json['albums'] != null
        ? AlbumResponse.fromJson(json['albums'])
        : null;
    songs =
        json['songs'] != null ? SongResponse.fromJson(json['songs']) : null;
    artists = json['artists'] != null
        ? ArtistsResponse.fromJson(json['artists'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (topResults != null) {
      data['topResults'] = topResults!.toJson();
    }
    if (albums != null) {
      data['albums'] = albums!.toJson();
    }
    if (songs != null) {
      data['songs'] = songs!.toJson();
    }
    if (artists != null) {
      data['artists'] = artists!.toJson();
    }
    return data;
  }
}

class Meta {
  Results? results;

  Meta({this.results});

  Meta.fromJson(Map<String, dynamic> json) {
    results =
        json['results'] != null ? Results.fromJson(json['results']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (results != null) {
      data['results'] = results!.toJson();
    }
    return data;
  }
}
