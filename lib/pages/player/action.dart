import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_netease_cloud_music/model/song.dart';

//TODO replace with your own action
enum PlayerAction {
  initState,
  playSong,
  playSongs,
  onProgress,
  addSongs,
  togglePlay,
  seekPlay,
  nextPlay,
  prePlay,
  dispose,
  update
}

class PlayerActionCreator {
  static Action onInitStateAction() {
    return Action(PlayerAction.initState);
  }
  static Action onPlaySongAction(Song song) {
    return Action(PlayerAction.playSong, payload: song);
  }

  static Action onPlaySongsAction(List<Song> songs, {int index}) {
    return Action(PlayerAction.playSongs,
        payload: {"songs": songs, "index": index});
  }

  static Action onProgressAction(String m) {
    return Action(PlayerAction.onProgress, payload: m);
  }

  static Action onAddSongsAction(List<Song> songs) {
    return Action(PlayerAction.addSongs, payload: songs);
  }

  static Action onTogglePlayAction() {
    return Action(PlayerAction.togglePlay);
  }

  static Action onSeekPlayAction(int milliseconds) {
    return Action(PlayerAction.seekPlay, payload: milliseconds);
  }

  static Action onNextPlayAction() {
    return Action(PlayerAction.nextPlay);
  }

  static Action onPrePlayAction() {
    return Action(PlayerAction.prePlay);
  }

  static Action onDisposeAction() {
    return Action(PlayerAction.dispose);
  }
}
