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
  int selectedIndex = 0;

  final pages = const [
    HomePage(),
    AboutPage(),
    ProjectsPage(),
  ];

  final titles = const [
    'Home',
    'About Me',
    'My Projects',
  ];

  void goTo(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF4351B2),
        foregroundColor: Colors.white,
        title: const Text(
          'My Portfolio',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          if (MediaQuery.of(context).size.width >= 700)
            ...List.generate(
              titles.length,
              (index) => TextButton(
                onPressed: () => goTo(index),
                style: TextButton.styleFrom(
                  foregroundColor: Colors.white,
                ),
                child: Text(titles[index]),
              ),
            )
          else
            PopupMenuButton<int>(
              icon: const Icon(Icons.menu),
              onSelected: goTo,
              itemBuilder: (context) {
                return List.generate(
                  titles.length,
                  (index) => PopupMenuItem(
                    value: index,
                    child: Text(titles[index]),
                  ),
                );
              },
            ),
          const SizedBox(width: 15),
        ],
      ),
      body: pages[selectedIndex],
    );
  }
}

// ================= HOME PAGE =================

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 50),

            // VV PHOTO
            Container(
              width: 170,
              height: 170,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: const LinearGradient(
                  colors: [
                    Color(0xFF6674D8),
                    Color(0xFF4351B2),
                  ],
                ),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFF4351B2).withValues(alpha: 0.25),
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
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 30),

            const Text(
              'VEDA VAISHNAVI',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 34,
                fontWeight: FontWeight.w800,
                letterSpacing: 1.2,
                color: Color(0xFF2E3D96),
              ),
            ),

            const SizedBox(height: 12),

            const Text(
              'B.Tech 3rd Year CSE',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                color: Color(0xFF555555),
              ),
            ),

            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}

// ================= ABOUT PAGE =================

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1000),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 25),

              const Text(
                'About Me',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w800,
                  color: Color(0xFF2E3D96),
                ),
              ),

              const SizedBox(height: 20),

              Card(
                elevation: 0,
                color: const Color(0xFFEFF1FC),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(30),
                  child: Text(
                    'Hello! I am Veda Vaishnavi, a passionate Computer Science '
                    'Engineering student currently pursuing B.Tech 3rd Year. '
                    'I enjoy learning new technologies, developing creative '
                    'applications, and building projects that solve real-world '
                    'problems. I am interested in software development, web '
                    'development, programming and user-friendly digital solutions.',
                    style: TextStyle(
                      fontSize: 17,
                      height: 1.7,
                      color: Color(0xFF3E4250),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 30),

              const Text(
                'Skills & Areas of Expertise',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w800,
                  color: Color(0xFF2E3D96),
                ),
              ),

              const SizedBox(height: 18),

              const Wrap(
                spacing: 12,
                runSpacing: 12,
                children: [
                  SkillCard(
                    icon: Icons.code,
                    title: 'Python',
                  ),
                  SkillCard(
                    icon: Icons.coffee,
                    title: 'Java',
                  ),
                  SkillCard(
                    icon: Icons.memory,
                    title: 'C Programming',
                  ),
                
                  
                  SkillCard(
                    icon: Icons.storage,
                    title: 'SQL',
                  ),
                 
                  SkillCard(
                    icon: Icons.source,
                    title: 'Git & GitHub',
                  ),
                  SkillCard(
                    icon: Icons.design_services,
                    title: 'UI/UX Design',
                  ),
                ],
              ),

              const SizedBox(height: 35),
            ],
          ),
        ),
      ),
    );
  }
}

// ================= SKILL CARD =================

class SkillCard extends StatelessWidget {
  final IconData icon;
  final String title;

  const SkillCard({
    required this.icon,
    required this.title,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 245,
      child: Card(
        elevation: 1,
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: const Color(0xFFE8EBFF),
            foregroundColor: const Color(0xFF4351B2),
            child: Icon(icon),
          ),
          title: Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
    );
  }
}

// ================= PROJECTS PAGE =================

class ProjectsPage extends StatelessWidget {
  const ProjectsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1000),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 25),

              const Text(
                'My Projects',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w800,
                  color: Color(0xFF2E3D96),
                ),
              ),

              const SizedBox(height: 25),

              ProjectCard(
                icon: Icons.school,
                title: 'Student Management System',
                description:
                    'A software project designed to manage student details, '
                    'records and academic information efficiently.',
                tags: const [
                  'Java',
                  'SQL',
                ],
              ),

              const SizedBox(height: 20),

              ProjectCard(
                icon: Icons.cloud,
                title: 'Weather Forecast App',
                description:
                    'A user-friendly application that displays weather '
                    'information using real-time data from an API.',
                tags: const [
                  'HTML',
                  'CSS',
                  'API',
                ],
              ),

              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}

// ================= PROJECT CARD =================

class ProjectCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;
  final List<String> tags;

  const ProjectCard({
    required this.icon,
    required this.title,
    required this.description,
    required this.tags,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(22),
      ),
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 28,
              backgroundColor: const Color(0xFFE8EBFF),
              foregroundColor: const Color(0xFF4351B2),
              child: Icon(
                icon,
                size: 28,
              ),
            ),

            const SizedBox(height: 18),

            Text(
              title,
              style: const TextStyle(
                fontSize: 21,
                fontWeight: FontWeight.w800,
                color: Color(0xFF30439F),
              ),
            ),

            const SizedBox(height: 10),

            Text(
              description,
              style: const TextStyle(
                fontSize: 16,
                height: 1.55,
                color: Color(0xFF4C4F5A),
              ),
            ),

            const SizedBox(height: 16),

            Wrap(
              spacing: 8,
              children: tags
                  .map(
                    (tag) => Chip(
                      label: Text(tag),
                      backgroundColor: const Color(0xFFF0F1FA),
                      side: BorderSide.none,
                    ),
                  )
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}