import 'package:flutter/material.dart';
import 'package:my_project/widgets/app_bar.dart'; // Import your custom AppBar

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  // List of video data
  final List<Map<String, String>> videos = [
    {
      'thumbnailUrl': 'https://mir-s3-cdn-cf.behance.net/project_modules/max_1200/c618cd88432989.5dd5e72e505d1.jpg',
      'title': 'S E V E N',
      'channelName': 'mines.wwww.org',
      'views': '579.8k views',
    },
    {
      'thumbnailUrl': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTekHhxsnNKrYr8jxMVtPSNu9ROm8OU3Za1Kw&s',
      'title': 'The Magic of Coding',
      'channelName': 'Code Wizards',
      'views': '1.2M views',
    },
    {
      'thumbnailUrl': 'https://mir-s3-cdn-cf.behance.net/project_modules/max_1200/c618cd88432989.5dd5e72e505d1.jpg',
      'title': 'Exploring Nature',
      'channelName': 'Nature Lovers',
      'views': '800k views',
    },
    {
      'thumbnailUrl': 'https://mir-s3-cdn-cf.behance.net/project_modules/max_1200/c618cd88432989.5dd5e72e505d1.jpg',
      'title': 'Gastronomy Delights',
      'channelName': 'Foodies Unite',
      'views': '450k views',
    },
    {
      'thumbnailUrl': 'https://mir-s3-cdn-cf.behance.net/project_modules/max_1200/c618cd88432989.5dd5e72e505d1.jpg',
      'title': 'Travel Diaries',
      'channelName': 'Wanderlust',
      'views': '300k views',
    },
    {
      'thumbnailUrl': 'https://mir-s3-cdn-cf.behance.net/project_modules/max_1200/c618cd88432989.5dd5e72e505d1.jpg',
      'title': 'Tech Innovations',
      'channelName': 'Tech Talk',
      'views': '2M views',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 16, 2, 22), // Dark theme background
      appBar: const MyAppBar(), // Use your updated custom app bar
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Categories Section
            Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              height: 60, // Height to display the categories fully
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: const [
                  CategoryChip(label: 'All'),
                  CategoryChip(label: 'Music'),
                  CategoryChip(label: 'Gaming'),
                  CategoryChip(label: 'News'),
                  CategoryChip(label: 'Movies'),
                  CategoryChip(label: 'Live'),
                  // Add more categories as needed
                ],
              ),
            ),

            // Add space between Categories and Video Grid
            const SizedBox(height: 20), // Space of 20 pixels

            // Video Grid Section
            GridView.builder(
              physics: const NeverScrollableScrollPhysics(), // Disable scrolling inside grid
              shrinkWrap: true, // Make grid fit content
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // Number of columns
                crossAxisSpacing: 20,
                mainAxisSpacing: 5,
                childAspectRatio: 9 / 16, // Adjusted aspect ratio for larger images
              ),
              itemCount: videos.length, // Use length of videos list
              itemBuilder: (context, index) {
                final video = videos[index]; // Get video data
                return Padding(
                  padding: const EdgeInsets.all(8.0), // Padding around each VideoCard
                  child: VideoCard(
                    thumbnailUrl: video['thumbnailUrl']!, // Accessing thumbnail URL
                    title: video['title']!, // Accessing title
                    channelName: video['channelName']!, // Accessing channel name
                    views: video['views']!, // Accessing views
                  ),
                );
              },
            ),

            // Shorts Section (Optional)
            const Padding(
              padding: EdgeInsets.all(10),
              child: Text(
                'Shorts',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
            SizedBox(
              height: 200,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 5, // Number of shorts
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.all(8),
                    width: 150,
                    color: const Color.fromARGB(255, 88, 88, 88), // Placeholder for short video
                    child: const Center(
                      child: Text('Short Video', style: TextStyle(color: Colors.white)),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),

      // Bottom Navigation Bar
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color.fromARGB(255, 3, 3, 31),
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.play_arrow), label: 'Shorts'),
          BottomNavigationBarItem(icon: Icon(Icons.add_circle_outline), label: 'Upload'),
          BottomNavigationBarItem(icon: Icon(Icons.subscriptions), label: 'Subscriptions'),
          BottomNavigationBarItem(icon: Icon(Icons.account_circle), label: 'You'),
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
        color: Colors.white, // Background color set to white
        borderRadius: BorderRadius.circular(20),
      ),
      child: Center(
        child: Text(
          label,
          style: const TextStyle(
            color: Colors.black, // Text color set to black
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

// VideoCard widget
class VideoCard extends StatelessWidget {
  final String thumbnailUrl;
  final String title;
  final String channelName;
  final String views;

  const VideoCard({
    Key? key,
    required this.thumbnailUrl,
    required this.title,
    required this.channelName,
    required this.views,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 300, // Increased height for larger image
          width: double.infinity, // Set width to fill available space
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10), // Rounded corners for the thumbnail
            child: Image.network(thumbnailUrl, fit: BoxFit.cover), // Displaying the video thumbnail
          ),
        ),
        const SizedBox(height: 5), // Space between thumbnail and text
        Text(title, style: const TextStyle(color: Colors.white)),
        Text(channelName, style: const TextStyle(color: Colors.grey)),
        Text(views, style: const TextStyle(color: Colors.grey)),
      ],
    );
  }
}
