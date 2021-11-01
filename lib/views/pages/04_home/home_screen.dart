import 'package:flutter/material.dart';
import '../../../consts/dummy_data.dart';
import 'podcast_tile.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';
import 'package:get/route_manager.dart';

import '../../../consts/app_defaults.dart';
import '../../../consts/app_images.dart';
import '../../../consts/app_sizes.dart';
import '../../themes/text.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: AppSizes.DEFAULT_PADDING * 1.5),
      color: context.theme.scaffoldBackgroundColor,
      width: Get.width,
      child: SingleChildScrollView(
        child: Column(
          children: [
            AppSizes.hGap20,
            // Top Header
            _Header(),
            // Search
            _SearchBar(),
            // Recommended
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Recommended',
                    style: AppText.h6,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        PodcastTile(
                          appAudio: DummyData.allPodcast[0],
                          onTap: () {},
                        ),
                        PodcastTile(
                          appAudio: DummyData.allPodcast[1],
                          onTap: () {},
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Popular',
                    style: AppText.h6,
                  ),
                  AppSizes.hGap15,
                  _PodcastListTile(),
                  _PodcastListTile(),
                  _PodcastListTile(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _PodcastListTile extends StatelessWidget {
  const _PodcastListTile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          /// Image
          ClipRRect(
            borderRadius: AppDefaults.defaulBorderRadius,
            child: Container(
              width: Get.width * 0.3,
              child: AspectRatio(
                aspectRatio: 16 / 10,
                child: Image.network(
                  AppImages.podcastImages[3],
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),

          /// Title and other metadata
          Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      'How to make things work',
                      softWrap: true,
                      overflow: TextOverflow.clip,
                      style: AppText.b1.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Text(
                  'by John Doe',
                  style: AppText.caption,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _SearchBar extends StatelessWidget {
  const _SearchBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20),
      child: TextField(
        decoration: InputDecoration(
          labelText: 'Search Podcast...',
          hintText: 'MKBHD',
          prefixIcon: Icon(Icons.search_rounded),
        ),
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Greetings
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hello,',
              style: AppText.h6,
            ),
            Text(
              'Andrew',
              style: AppText.h6.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        // Profile Picture
        CircleAvatar(
          radius: Get.width * 0.08,
          backgroundImage: NetworkImage(
            AppImages.USER_IMAGE,
          ),
        ),
      ],
    );
  }
}
