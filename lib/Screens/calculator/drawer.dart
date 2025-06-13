import 'package:calculator_project/Screens/calculator/calculator.dart';
import 'package:calculator_project/Screens/calculator/constants.dart';
import 'package:calculator_project/Screens/calculator/feedback.dart';
import 'package:calculator_project/Screens/calculator/scientific_calculator.dart';
import 'package:calculator_project/Screens/calculator/settings.dart';
import 'package:calculator_project/Screens/calculator/theme_toggle.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> drawerItems = [
      {
        "title": 'Scientifc Mode',
        'icon': Icons.science_outlined,
        'route': () {
          Navigator.pop(context);
          return Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ScientificCalculator()),
          );
        },
      },
      {
        "title": 'Constants',
        'icon': Icons.functions_outlined,
        'route': () {
          Navigator.pop(context);
          return Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Constants()),
          );
        },
      },
      {
        "title": 'Theme',
        'icon': Icons.color_lens_outlined,
        'route': () {
          Navigator.pop(context);
          return Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ThemePage()),
          );
        },
      },
      {
        "title": 'Settings',
        'icon': Icons.build_outlined,
        'route': () {
          Navigator.pop(context);
          return Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SettingsPage()),
          );
        },
      },
      {
        "title": 'Feedback',
        'icon': Icons.feedback_outlined,
        'route': () {
          Navigator.pop(context);
          return Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => FeedBack()),
          );
        },
      },
      {
        "title": 'Exit',
        'icon': Icons.logout_outlined,
        'route': () async {
          // Navigator.pop(context, false);
          bool shouldExit =
              await showDialog(
                context: context,
                builder:
                    (_) => AlertDialog(
                      // contentPadding: EdgeInsets.all(5),
                      backgroundColor:
                          Theme.of(context).colorScheme.inversePrimary,
                      title: Text(
                        "Exit App",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: Theme.of(context).colorScheme.inverseSurface,
                        ),
                      ),

                      content: Text(
                        "Are you sure you want to quit app?",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Theme.of(context).colorScheme.inverseSurface,
                        ),
                      ),
                      actions: [
                        TextButton(
                          style: ButtonStyle(
                            backgroundColor: WidgetStatePropertyAll(
                              Theme.of(context).colorScheme.secondary,
                            ),
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(builder: (context) => Calculator()),
                            // );
                          },
                          child: Text("Cancel"),
                        ),
                        TextButton(
                          style: ButtonStyle(
                            backgroundColor: WidgetStatePropertyAll(
                              Theme.of(context).colorScheme.secondary,
                            ),
                          ),
                          onPressed: () => Navigator.pop(context, true),
                          child: Text("Exit"),
                        ),
                      ],
                    ),
              ) ??
              false;

          if (shouldExit) {
            SystemNavigator.pop();
          }
        },
      },
    ];
    return Drawer(
      width: 250,
      backgroundColor: Theme.of(context).colorScheme.primary,
      child: Column(
        children: [
          Gap(80),
          ...drawerItems
              .sublist(0, drawerItems.length - 1)
              .map(
                (item) => Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 5.0,
                    vertical: 5,
                  ),
                  child: ListTile(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    contentPadding: EdgeInsets.all(5).copyWith(left: 20),
                    minTileHeight: 40,
                    tileColor: Theme.of(context).colorScheme.secondary,
                    splashColor: Colors.transparent,
                    title: Text(
                      item['title'],
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                        color: Theme.of(context).colorScheme.inverseSurface,
                      ),
                    ),
                    leading: Icon(
                      item['icon'],
                      size: 20,
                      color: Theme.of(context).colorScheme.inverseSurface,
                    ),
                    onTap: item['route'],
                  ),
                ),
              ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 5.0,
              vertical: 5,
            ).copyWith(bottom: 20),
            child: ListTile(
              onTap: drawerItems.last['route'],
              contentPadding: EdgeInsets.all(5).copyWith(left: 20),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              minTileHeight: 40,
              tileColor: Theme.of(context).colorScheme.secondary,
              splashColor: Colors.transparent,
              leading: Icon(
                drawerItems.last['icon'],
                size: 20,
                color: Theme.of(context).colorScheme.inverseSurface,
              ),
              title: Text(
                drawerItems.last['title'],
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w500,
                  color: Theme.of(context).colorScheme.inverseSurface,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
