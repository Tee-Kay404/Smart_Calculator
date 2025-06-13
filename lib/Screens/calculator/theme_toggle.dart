import 'package:calculator_project/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

class ThemePage extends StatelessWidget {
  const ThemePage({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(
            Icons.arrow_back_ios_new_outlined,
            color: Theme.of(context).colorScheme.inverseSurface,
            size: 18,
          ),
        ),
        title: Text(
          'Theme Appearance',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: Theme.of(context).colorScheme.inverseSurface,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          const Gap(20),
          _buildRadioOption(
            context,
            title: 'Light Mode',
            value: ThemeMode.light,
          ),
          _buildRadioOption(context, title: 'Dark Mode', value: ThemeMode.dark),
          _buildRadioOption(
            context,
            title: 'System Default',
            value: ThemeMode.system,
          ),
        ],
      ),
    );
  }

  Widget _buildRadioOption(
    BuildContext context, {
    required String title,
    required ThemeMode value,
  }) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final currentMode = themeProvider.themeMode;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 6),
      child: RadioListTile<ThemeMode>(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        tileColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(
          title,
          style: TextStyle(
            fontSize: 16,
            color: Theme.of(context).colorScheme.inverseSurface,
          ),
        ),
        value: value,
        groupValue: currentMode,
        onChanged: (val) {
          if (val != null) {
            Provider.of<ThemeProvider>(
              context,
              listen: false,
            ).setThemeMode(val);
          }
        },
        activeColor: Colors.blue.shade900,
      ),
    );
  }
}
