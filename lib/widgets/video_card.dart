import 'package:flutter/material.dart';

// Renamed VideoCard to VideoInfoCard
class VideoInfoCard extends StatelessWidget {
  final String thumbnailUrl;
  final String title;
  final String channelName;
  final String views;

  const VideoInfoCard({
    Key? key,
    required this.thumbnailUrl,
    required this.title,
    required this.channelName,
    required this.views,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(thumbnailUrl, fit: BoxFit.cover),
          ),
          const SizedBox(height: 5),
          Text(
            title,
            style: const TextStyle(color: Colors.white, fontSize: 16),
          ),
          Text(
            channelName,
            style: const TextStyle(color: Colors.grey),
          ),
          Text(
            views,
            style: const TextStyle(color: Colors.grey),
          ),
        ],
      ),
    );
  }
}

class VideoCard extends StatelessWidget {
  const VideoCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: ListView(
            children:const [
              // Categories Row
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: const [
                    CategoryChip(label: 'All'),
                    CategoryChip(label: 'Music'),
                    CategoryChip(label: 'Gaming'),
                    CategoryChip(label: 'News'),
                    CategoryChip(label: 'Movies'),
                    CategoryChip(label: 'Live'),
                    // Add more categories here if needed
                  ],
                ),
              ),
              const SizedBox(height: 10),

              // Video Info Cards
              VideoInfoCard(
                thumbnailUrl: 'https://example.com/video_thumbnail1.jpg',
                title: 'The Exit',
                channelName: 'Sample Channel',
                views: '1M views',
              ),
              VideoInfoCard(
                thumbnailUrl: 'https://example.com/video_thumbnail2.jpg',
                title: 'Sample Video 2',
                channelName: 'Another Channel',
                views: '500K views',
              ),
              VideoInfoCard(
                thumbnailUrl: 'https://example.com/video_thumbnail3.jpg',
                title: 'Another Sample Video',
                channelName: 'Channel 3',
                views: '2M views',
              ),
              // Add more VideoInfoCard widgets as needed
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_circle_outline),
            label: 'Add',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

// Custom widget for categories
class CategoryChip extends StatelessWidget {
  final String label;
  const CategoryChip({Key? key, required this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Center(
        child: Text(
          label,
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
