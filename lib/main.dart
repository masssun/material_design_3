import 'package:flutter/material.dart';

// Flutter の Material Design 3 への対応状況について
// refs: https://github.com/flutter/flutter/issues/91605

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        // colorScheme: const ColorScheme(
        //   brightness: Brightness.light,
        //   primary: Colors.teal,
        //   onPrimary: Colors.white,
        //   secondary: Colors.orange,
        //   onSecondary: Colors.white,
        //   error: Colors.red,
        //   onError: Colors.white,
        //   background: Colors.white,
        //   onBackground: Colors.black87,
        //   surface: Colors.white,
        //   onSurface: Colors.black87,
        // ),
        textTheme: const TextTheme(
          displayLarge: TextStyle(fontSize: 57),
          displayMedium: TextStyle(fontSize: 45),
          displaySmall: TextStyle(fontSize: 36),
          headlineLarge: TextStyle(fontSize: 32),
          headlineMedium: TextStyle(fontSize: 28),
          headlineSmall: TextStyle(fontSize: 24),
          titleLarge: TextStyle(fontSize: 22),
          titleMedium: TextStyle(fontSize: 16),
          titleSmall: TextStyle(fontSize: 14),
          bodyLarge: TextStyle(fontSize: 16),
          bodyMedium: TextStyle(fontSize: 14),
          bodySmall: TextStyle(fontSize: 12),
          labelLarge: TextStyle(fontSize: 14),
          labelMedium: TextStyle(fontSize: 12),
          labelSmall: TextStyle(fontSize: 11),
        ),
      ),
      home: const MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {},
        ),
        title: const Text('Material Design 3'),
        actions: [
          Builder(builder: (context) {
            return IconButton(
              icon: const Icon(Icons.more_vert),
              onPressed: () {},
            );
          }),
        ],
      ),
      body: Scrollbar(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Header(title: 'Buttons'),
                Content(
                  children: [
                    const FilledButton(),
                    const FilledTonalButton(),
                    ElevatedButton(
                      onPressed: () {},
                      child: const Text('Elevated Button'),
                    ),
                    OutlinedButton(
                      onPressed: () {},
                      child: const Text('Outlined Button'),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text('Text Button'),
                    ),
                  ],
                ),
                const Divider(),
                const Header(title: 'Icon buttons'),
                Content(
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.favorite_outline)),
                    IconButton(
                        onPressed: () {}, icon: const Icon(Icons.favorite)),
                    const SizedBox(width: 36),
                    IconButton(
                      onPressed: () {},
                      style: IconButton.styleFrom(
                        foregroundColor:
                            Theme.of(context).colorScheme.onPrimary,
                        backgroundColor: Theme.of(context).colorScheme.primary,
                      ),
                      icon: const Icon(Icons.favorite),
                    ),
                    IconButton(
                      onPressed: () {},
                      style: IconButton.styleFrom(
                        foregroundColor:
                            Theme.of(context).colorScheme.onSecondary,
                        backgroundColor:
                            Theme.of(context).colorScheme.secondary,
                      ),
                      icon: const Icon(Icons.favorite),
                    ),
                    IconButton(
                      onPressed: () {},
                      style: IconButton.styleFrom(side: const BorderSide()),
                      icon: const Icon(Icons.favorite),
                    ),
                  ],
                ),
                const Divider(),
                const Header(title: 'Cards'),
                const Content(
                  children: [
                    Card(child: CardContent(text: 'Elevated Card')),
                    FilledCard(),
                    OutlinedCard(),
                  ],
                ),
                const Divider(),
                const Header(title: 'Chips'),
                Content(
                  children: [
                    InputChip(
                      label: const Text('Input'),
                      deleteIcon: const Icon(Icons.close, size: 20),
                      onDeleted: () {},
                    ),
                    FilterChip(
                      label: const Text('Filter'),
                      selected: true,
                      onSelected: (value) => print(value),
                    ),
                    const ChoiceChip(
                      label: Text('Choice'),
                      selected: true,
                    ),
                    ActionChip(
                      avatar: const Icon(Icons.calendar_today),
                      label: const Text('Assist'),
                      onPressed: () {},
                    ),
                    ActionChip(
                      label: const Text('Suggestion'),
                      onPressed: () {},
                    ),
                  ],
                ),
                const SizedBox(height: 72),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showAlertDialog(context),
        tooltip: 'Show Dialog',
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: NavigationBar(
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
          NavigationDestination(icon: Icon(Icons.person), label: 'Account'),
        ],
      ),
    );
  }

  Future<void> _showAlertDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Lorem ipsum'),
          content: const Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.'),
          actions: [
            TextButton(
              child: const Text('OK'),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ],
        );
      },
    );
  }
}

class Header extends StatelessWidget {
  final String title;

  const Header({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8, bottom: 12),
      child: Text(title, style: Theme.of(context).textTheme.titleLarge),
    );
  }
}

class Content extends StatelessWidget {
  final List<Widget> children;

  const Content({Key? key, required this.children}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(spacing: 8, runSpacing: 8, children: children);
  }
}

class FilledButton extends StatelessWidget {
  const FilledButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
        backgroundColor: Theme.of(context).colorScheme.primary,
        elevation: 0,
      ),
      child: const Text('Filled Button'),
    );
  }
}

class FilledTonalButton extends StatelessWidget {
  const FilledTonalButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        foregroundColor: Theme.of(context).colorScheme.onSecondaryContainer,
        backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
        elevation: 0,
      ),
      child: const Text('Filled Tonal Button'),
    );
  }
}

class FilledCard extends StatelessWidget {
  const FilledCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: Theme.of(context).colorScheme.surfaceVariant,
      child: const CardContent(text: 'Filled Card'),
    );
  }
}

class OutlinedCard extends StatelessWidget {
  const OutlinedCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: Theme.of(context).colorScheme.outline,
        ),
        borderRadius: const BorderRadius.all(Radius.circular(12)),
      ),
      child: const CardContent(text: 'Outlined Card'),
    );
  }
}

class CardContent extends StatelessWidget {
  final String text;

  const CardContent({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, top: 64, right: 64, bottom: 16),
      child: Text(text),
    );
  }
}
