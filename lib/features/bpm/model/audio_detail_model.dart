class AudioDetail {
  // double? danceability;
  // double? energy;
  // int? key;
  // double? loudness;
  // int? mode;
  // double? speechiness;
  // double? acousticness;
  // double? instrumentalness;
  // double? liveness;
  // double? valence;
  double? tempo;
  String? type;
  String? id;
  // String? uri;
  // String? trackHref;
  // String? analysisUrl;
  // int? durationMs;
  // int? timeSignature;

  AudioDetail({
    //   this.danceability,
    // this.energy,
    // this.key,
    // this.loudness,
    // this.mode,
    // this.speechiness,
    // this.acousticness,
    // this.instrumentalness,
    // this.liveness,
    // this.valence,
    this.tempo,
    this.type,
    this.id,
    // this.uri,
    // this.trackHref,
    // this.analysisUrl,
    // this.durationMs,
    // this.timeSignature
  });

  AudioDetail.fromJson(Map<String, dynamic> json) {
    // danceability = json['danceability'];
    // energy = json['energy'];
    // key = json['key'];
    // loudness = json['loudness'];
    // mode = json['mode'];
    // speechiness = json['speechiness'];
    // acousticness = json['acousticness'];
    // instrumentalness = json['instrumentalness'];
    // liveness = json['liveness'];
    // valence = json['valence'];
    tempo = json['tempo'];
    type = json['type'];
    id = json['id'];
    // uri = json['uri'];
    // trackHref = json['track_href'];
    // analysisUrl = json['analysis_url'];
    // durationMs = json['duration_ms'];
    // timeSignature = json['time_signature'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    // data['danceability'] = this.danceability;
    // data['energy'] = this.energy;
    // data['key'] = this.key;
    // data['loudness'] = this.loudness;
    // data['mode'] = this.mode;
    // data['speechiness'] = this.speechiness;
    // data['acousticness'] = this.acousticness;
    // data['instrumentalness'] = this.instrumentalness;
    // data['liveness'] = this.liveness;
    // data['valence'] = this.valence;
    data['tempo'] = this.tempo;
    data['type'] = this.type;
    data['id'] = this.id;
    // data['uri'] = this.uri;
    // data['track_href'] = this.trackHref;
    // data['analysis_url'] = this.analysisUrl;
    // data['duration_ms'] = this.durationMs;
    // data['time_signature'] = this.timeSignature;
    return data;
  }
}
