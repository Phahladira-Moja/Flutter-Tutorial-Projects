import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:spotify_responsive_ui_clone/models/current_track_model.dart';

class CurrentTrack extends StatelessWidget {
  const CurrentTrack({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 84,
      width: double.infinity,
      color: Colors.black87,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            const _TrackInfo(),
            const Spacer(),
            const _PlayControls(),
            const Spacer(),
            if (MediaQuery.of(context).size.width > 800) _MoreControls(),
          ],
        ),
      ),
    );
  }
}

class _TrackInfo extends StatelessWidget {
  const _TrackInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final selected = context.watch<CurrentTrackModel>().selected;

    if (selected == null) return const SizedBox.shrink();

    return Row(
      children: [
        Image.asset(
          'assets/lofigirl.jpg',
          height: 60,
          width: 60,
          fit: BoxFit.cover,
        ),
        const SizedBox(width: 12),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(selected.title, style: Theme.of(context).textTheme.bodyText1),
            const SizedBox(height: 4),
            Text(
              selected.artist,
              style: Theme.of(context).textTheme.subtitle1!.copyWith(
                    color: Colors.grey[300],
                    fontSize: 12,
                  ),
            )
          ],
        ),
        const SizedBox(width: 12),
        IconButton(
          icon: const Icon(Icons.favorite_border),
          onPressed: () {},
        )
      ],
    );
  }
}

class _PlayControls extends StatelessWidget {
  const _PlayControls({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final selected = context.watch<CurrentTrackModel>().selected;
    return Column(
      children: [
        Row(
          children: [
            IconButton(
              padding: const EdgeInsets.only(),
              icon: const Icon(Icons.shuffle),
              iconSize: 20,
              onPressed: () {},
            ),
            IconButton(
              padding: const EdgeInsets.only(),
              icon: const Icon(Icons.skip_previous_outlined),
              iconSize: 20,
              onPressed: () {},
            ),
            IconButton(
              padding: const EdgeInsets.only(),
              icon: const Icon(Icons.play_circle_outline),
              iconSize: 20,
              onPressed: () {},
            ),
            IconButton(
              padding: const EdgeInsets.only(),
              icon: const Icon(Icons.skip_next),
              iconSize: 20,
              onPressed: () {},
            ),
            IconButton(
              padding: const EdgeInsets.only(),
              icon: const Icon(Icons.repeat),
              iconSize: 20,
              onPressed: () {},
            ),
          ],
        ),
        const SizedBox(height: 4),
        Row(children: [
          Text('0:00', style: Theme.of(context).textTheme.caption),
          const SizedBox(width: 8),
          Container(
            height: 5,
            width: MediaQuery.of(context).size.width * 0.3,
            decoration: BoxDecoration(
                color: Colors.grey[800],
                borderRadius: BorderRadius.circular(2.5)),
          ),
          const SizedBox(width: 8),
          Text(
            selected?.duration ?? '0:00',
            style: Theme.of(context).textTheme.caption,
          )
        ])
      ],
    );
  }
}

class _MoreControls extends StatelessWidget {
  const _MoreControls({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          icon: const Icon(Icons.devices_outlined),
          onPressed: () {},
        ),
        Row(children: [
          IconButton(
            icon: const Icon(Icons.volume_up_outlined),
            // iconSize: 20.0,
            onPressed: () {},
          ),
          Container(
            height: 5,
            width: 70.0,
            decoration: BoxDecoration(
              color: Colors.grey[800],
              borderRadius: BorderRadius.circular(2.5),
            ),
          ),
        ]),
        IconButton(
          icon: const Icon(Icons.fullscreen_outlined),
          onPressed: () {},
        ),
      ],
    );
  }
}
