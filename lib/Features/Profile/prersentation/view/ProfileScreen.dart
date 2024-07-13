

import 'package:flutterstarter/Core/index.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        title: Text('Profil',
        style: Theme.of(context).textTheme.titleLarge,),
     
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            
            CircleAvatar(
              radius: 50,
              backgroundColor: Theme.of(context).colorScheme.primary,
            ),
            verticalBox(12),
            Text(
              'Karim Younes',
              style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            verticalBox(20),
            ListTile(
              leading: Image.asset(Assets.user,
              height: 24,
              color: Theme.of(context).colorScheme.secondary,),
              title: Text('Informations personnelles',
              style: Theme.of(context).textTheme.titleLarge,),
              onTap: () {},
            ),
            ListTile(
              leading: Image.asset('assets/support.png',
              height: 24,
              color: Theme.of(context).colorScheme.secondary,),
              title: Text('Informations personnelles',
              style: Theme.of(context).textTheme.titleLarge,),
              onTap: () {},
            ),
            verticalBox(20),
            ContributionCard(),
            verticalBox(20),
            PostsSection(),
          ],
        ),
      ),
    );
  }
}

class ContributionCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Contribution',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            ContributionItem(
              icon: Icons.delete,
              label: 'Ordures ménagères',
              percentage: 45,
            ),
            ContributionItem(
              icon: Icons.recycling,
              label: 'Recyclage',
              percentage: 45,
            ),
            ContributionItem(
              icon: Icons.local_florist,
              label: 'Plantation d\'arbres',
              percentage: 45,
            ),
          ],
        ),
      ),
    );
  }
}

class ContributionItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final double percentage;

  ContributionItem({required this.icon, required this.label, required this.percentage});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Icon(icon, color: Colors.green),
            SizedBox(width: 10),
            Text(label),
          ],
        ),
        Text('$percentage%'),
      ],
    );
  }
}

class PostsSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Mes posts',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          // Add posts here
          // Example:
          // PostItem(title: 'Post Title', content: 'Post content...'),
        ],
      ),
    );
  }
}

class PostItem extends StatelessWidget {
  final String title;
  final String content;

  PostItem({required this.title, required this.content});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(title),
        subtitle: Text(content),
      ),
    );
  }
}
