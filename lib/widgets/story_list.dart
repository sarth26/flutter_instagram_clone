import 'package:flutter/material.dart';
import 'package:instagram_clone_assignment/utils/dummy_data.dart';
import 'package:instagram_clone_assignment/widgets/story_item.dart';

class StoryList extends StatelessWidget {
  const StoryList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 110,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        itemCount: dummyStories.length + 1,
        itemBuilder: (context, index) {
          if (index == 0) {
            return const YourStoryItem();
          }

          if (index == 0) {
            return const YourStoryItem();
          }

          final story = dummyStories[index - 1];

          return StoryItem(username: story.username, imageUrl: story.imageUrl);
        },
      ),
    );
  }
}

//import 'package:flutter/material.dart';

class YourStoryItem extends StatelessWidget {
  const YourStoryItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                padding: const EdgeInsets.all(4),
                height: 70,
                width: 70,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: const Color.fromARGB(255, 84, 82, 82),
                    width: 2,
                  ),
                ),
                child: const CircleAvatar(
                  backgroundImage: AssetImage("assets/images/sarthak.jpg"),
                ),
              ),

              /// ADD BUTTON
              Positioned(
                bottom: 0,
                right: 0,
                child: Container(
                  height: 22,
                  width: 22,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.blue,
                    border: Border.all(color: Colors.white, width: 2),
                  ),
                  child: const Icon(Icons.add, size: 14, color: Colors.white),
                ),
              ),
            ],
          ),

          const SizedBox(height: 4),

          const SizedBox(
            width: 70,
            child: Text(
              "Your Story",
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 12),
            ),
          ),
        ],
      ),
    );
  }
}
