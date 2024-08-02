import Flutter
import UIKit
import MusicKit

public class SwiftMyMusicKitPlugin: NSObject, FlutterPlugin {
    public static func register(with registrar: FlutterPluginRegistrar) {
        let channel = FlutterMethodChannel(name: "my_music_kit_plugin", binaryMessenger: registrar.messenger())
        let instance = SwiftMyMusicKitPlugin()
        registrar.addMethodCallDelegate(instance, channel: channel)
    }

    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        if call.method == "searchMusic" {
            if let args = call.arguments as? [String: Any], let query = args["query"] as? String {
                searchMusic(query: query, result: result)
            } else {
                result(FlutterError(code: "INVALID_ARGUMENT", message: "Query not provided", details: nil))
            }
        } else {
            result(FlutterMethodNotImplemented)
        }
    }

    private func searchMusic(query: String, result: @escaping FlutterResult) {
        var musicRequest = MusicCatalogSearchRequest(term: query, types: [Song.self, Album.self, Artist.self])
        Task {
            do {
                let response = try await musicRequest.response()
                let songs = response.songs.map { ["title": $0.title, "artist": $0.artistName] }
                result(songs)
            } catch {
                result(FlutterError(code: "API_ERROR", message: "Failed to search music", details: error.localizedDescription))
            }
        }
    }
}
