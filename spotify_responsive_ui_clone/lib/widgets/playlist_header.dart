import 'package:flutter/material.dart';
import 'package:spotify_responsive_ui_clone/data/data.dart';

class PlayListHeader extends StatelessWidget {
  final Playlist playlist;
  const PlayListHeader({Key? key, required this.playlist}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Image.asset(
              playlist.imageURL,
              height: 200,
              width: 200,
              fit: BoxFit.cover,
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'PLAYLIST',
                    style: Theme.of(context)
                        .textTheme
                        .overline!
                        .copyWith(fontSize: 12),
                  ),
                  const SizedBox(height: 12),
                  Text(playlist.name,
                      style: Theme.of(context).textTheme.headline2),
                  const SizedBox(height: 16),
                  Text(playlist.description,
                      style: Theme.of(context).textTheme.subtitle1),
                  const SizedBox(height: 16),
                  Text(
                      'Created by ${playlist.creator} - ${playlist.songs.length} songs, ${playlist.duration}',
                      style: Theme.of(context).textTheme.subtitle1),
                ],
              ),
            )
          ],
        ),
        const SizedBox(height: 20),
        _PlaylistButtons(followers: playlist.followers),
      ],
    );
  }
}

class _PlaylistButtons extends StatelessWidget {
  final String followers;
  const _PlaylistButtons({Key? key, required this.followers}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TextButton(
          style: TextButton.styleFrom(
            padding: const EdgeInsets.symmetric(
              vertical: 20,
              horizontal: 48,
            ),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            backgroundColor: Theme.of(context).accentColor,
            foregroundColor: Theme.of(context).iconTheme.color,
            textStyle: Theme.of(context)
                .textTheme
                .caption!
                .copyWith(fontSize: 12, letterSpacing: 2.0),
          ),
          onPressed: () {},
          child: const Text('PLAY'),
        ),
        const SizedBox(width: 8),
        IconButton(
          onPressed: () {},
          iconSize: 30,
          icon: const Icon(Icons.favorite_border),
        ),
        IconButton(
          onPressed: () {},
          iconSize: 30,
          icon: const Icon(Icons.more_horiz),
        ),
        const Spacer(),
        Text(
          'FOLLOWERS\n$followers',
          style: Theme.of(context).textTheme.overline!.copyWith(fontSize: 12),
          textAlign: TextAlign.right,
        ),
      ],
    );
  }
}
