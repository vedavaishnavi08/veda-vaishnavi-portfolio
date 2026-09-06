import 'package:flutter/material.dart';

void main() {
  runApp(const PortfolioApp());
}

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    const primary = Color(0xFF4351B2);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Veda Vaishnavi | Portfolio',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: primary,
          brightness: Brightness.light,
        ),
        scaffoldBackgroundColor: const Color(0xFFFAFAFA),
        fontFamily: 'Roboto',
      ),
      home: const PortfolioShell(),
    );
  }
}

class PortfolioShell extends StatefulWidget {
  const PortfolioShell({super.key});

  @override
  State<PortfolioShell> createState() => _PortfolioShellState();
}

class _PortfolioShellState extends State<PortfolioShell> {
  int currentPage = 0;

  void goToPage(int page) {
    setState(() {
      currentPage = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF4351B2),
        foregroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'My Portfolio',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          if (MediaQuery.of(context).size.width >= 650) ...[
            _navButton('Home', 0),
            _navButton('About Me', 1),
            _navButton('My Projects', 2),
            const SizedBox(width: 18),
          ] else
            PopupMenuButton<int>(
              icon: const Icon(Icons.menu),
              onSelected: goToPage,
              itemBuilder: (context) => const [
                PopupMenuItem(
                  value: 0,
                  child: Text('Home'),
                ),
                PopupMenuItem(
                  value: 1,
                  child: Text('About Me'),
                ),
                PopupMenuItem(
                  value: 2,
                  child: Text('My Projects'),
                ),
              ],
            ),
        ],
      ),
      body: IndexedStack(
        index: currentPage,
        children: [
          HomePage(
            onAboutPressed: () => goToPage(1),
            onProjectsPressed: () => goToPage(2),
          ),
          AboutPage(
            onBackPressed: () => goToPage(0),
          ),
          ProjectsPage(
            onBackPressed: () => goToPage(0),
          ),
        ],
      ),
    );
  }

  Widget _navButton(String title, int page) {
    final selected = currentPage == page;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: TextButton(
        onPressed: () => goToPage(page),
        style: TextButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor:
              selected ? Colors.white.withOpacity(0.18) : Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
        ),
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}

// ============================================================
// HOME PAGE
// ============================================================

class HomePage extends StatelessWidget {
  final VoidCallback onAboutPressed;
  final VoidCallback onProjectsPressed;

  const HomePage({
    super.key,
    required this.onAboutPressed,
    required this.onProjectsPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 45),

            // Profile picture / avatar
            Container(
              width: 170,
              height: 170,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: const Color(0xFF5968D0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.15),
                    blurRadius: 25,
                    offset: const Offset(0, 10),
                  ),
                ],
              ),
              child: const Center(
                child: Text(
                  'VV',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 55,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 35),

            const Text(
              'VEDA VAISHNAVI',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFF35459F),
                fontSize: 40,
                fontWeight: FontWeight.bold,
                letterSpacing: 1,
              ),
            ),

            const SizedBox(height: 18),

            const Text(
              'B.Tech CSE 3rd Year',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black54,
                fontSize: 23,
              ),
            ),

            
            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}

// ============================================================
// ABOUT PAGE
// ============================================================

class AboutPage extends StatelessWidget {
  final VoidCallback onBackPressed;

  const AboutPage({
    super.key,
    required this.onBackPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(30),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 900),
          child: Column(
            children: [
              const SizedBox(height: 25),

              Row(
                children: [
                  IconButton(
                    onPressed: onBackPressed,
                    icon: const Icon(Icons.arrow_back),
                    iconSize: 30,
                  ),
                  const Expanded(
                    child: Text(
                      'About Me',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFF35459F),
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(width: 48),
                ],
              ),

              const SizedBox(height: 30),

              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(35),
                decoration: BoxDecoration(
                  color: const Color(0xFFECEBFA),
                  borderRadius: BorderRadius.circular(25),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.08),
                      blurRadius: 20,
                      offset: const Offset(0, 8),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    const CircleAvatar(
                      radius: 30,
                      backgroundColor: Color(0xFF4351B2),
                      child: Icon(
                        Icons.person,
                        color: Colors.white,
                        size: 35,
                      ),
                    ),

                    const SizedBox(height: 25),

                    const Text(
                      "Hello! I'm Veda Vaishnavi, a passionate Computer "
                      "Science Engineering student. I enjoy exploring "
                      "modern technologies and building creative digital "
                      "projects that solve real-world problems.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18,
                        height: 1.6,
                        color: Colors.black87,
                      ),
                    ),

                    const SizedBox(height: 35),

                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Skills & Areas of Expertise',
                        style: TextStyle(
                          color: Color(0xFF4351B2),
                          fontSize: 23,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),

                    const SizedBox(height: 18),

                    Wrap(
                      spacing: 10,
                      runSpacing: 10,
                      children: const [
                        SkillChip(label: 'Python'),
                        SkillChip(label: 'Java'),
                        SkillChip(label: 'C Programming'),
                        SkillChip(label: 'Data Structures & Algorithms'),
                        SkillChip(label: 'HTML & CSS'),
                        SkillChip(label: 'SQL'),
                        SkillChip(label: 'Flutter & Dart'),
                        SkillChip(label: 'Git & GitHub'),
                        SkillChip(label: 'UI/UX Design'),
                        SkillChip(label: 'Problem Solving'),
                      ],
                    ),

                    const SizedBox(height: 35),

                    ElevatedButton(
                      onPressed: onBackPressed,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF4351B2),
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 35,
                          vertical: 15,
                        ),
                      ),
                      child: const Text(
                        'Back to Home',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}

// ============================================================
// PROJECTS PAGE
// ============================================================

class ProjectsPage extends StatelessWidget {
  final VoidCallback onBackPressed;

  const ProjectsPage({
    super.key,
    required this.onBackPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(30),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1000),
          child: Column(
            children: [
              const SizedBox(height: 25),

              Row(
                children: [
                  IconButton(
                    onPressed: onBackPressed,
                    icon: const Icon(Icons.arrow_back),
                    iconSize: 30,
                  ),
                  const Expanded(
                    child: Text(
                      'My Projects',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFF35459F),
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(width: 48),
                ],
              ),

              const SizedBox(height: 30),

              // PROJECT 1
              const ProjectCard(
                icon: Icons.security,
                title: 'Content Moderation System',
                description:
                    'A Python-based intelligent tool for video content '
                    'filtering and analysis.',
                tags: [
                  'Python',
                  'Content Analysis',
                  'Video Processing',
                ],
              ),

              const SizedBox(height: 22),

              // PROJECT 2
              const ProjectCard(
                icon: Icons.image,
                title: 'Text and Binary Image Steganography',
                description:
                    'A Python-based project for hiding and analyzing '
                    'text and binary data inside images using '
                    'steganography techniques.',
                tags: [
                  'Python',
                  'Image Processing',
                  'Steganography',
                ],
              ),

              const SizedBox(height: 35),

              ElevatedButton(
                onPressed: onBackPressed,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF4351B2),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 35,
                    vertical: 15,
                  ),
                ),
                child: const Text(
                  'Back to Home',
                  style: TextStyle(fontSize: 16),
                ),
              ),

              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}

// ============================================================
// SKILL CHIP
// ============================================================

class SkillChip extends StatelessWidget {
  final String label;

  const SkillChip({
    super.key,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 17,
        vertical: 10,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Colors.black12,
        ),
      ),
      child: Text(
        label,
        style: const TextStyle(
          fontSize: 15,
          color: Colors.black87,
        ),
      ),
    );
  }
}

// ============================================================
// PROJECT CARD
// ============================================================

class ProjectCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;
  final List<String> tags;

  const ProjectCard({
    super.key,
    required this.icon,
    required this.title,
    required this.description,
    required this.tags,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(25),
      decoration: BoxDecoration(
        color: const Color(0xFFECEBFA),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 15,
            offset: const Offset(0, 7),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: const Color(0xFF4351B2),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Icon(
              icon,
              color: Colors.white,
              size: 30,
            ),
          ),

          const SizedBox(width: 20),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Color(0xFF35459F),
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 10),

                Text(
                  description,
                  style: const TextStyle(
                    fontSize: 16,
                    height: 1.5,
                    color: Colors.black87,
                  ),
                ),

                const SizedBox(height: 15),

                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: tags
                      .map(
                        (tag) => Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 7,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              color: Colors.black12,
                            ),
                          ),
                          child: Text(
                            tag,
                            style: const TextStyle(
                              fontSize: 13,
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}