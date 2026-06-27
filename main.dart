import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const DMSConverterApp());
}

class DMSConverterApp extends StatelessWidget {
  const DMSConverterApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DMS Converter',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
          brightness: Brightness.dark,
        ),
      ),
      home: const DMSConverterPage(),
    );
  }
}

class DMSConverterPage extends StatefulWidget {
  const DMSConverterPage({Key? key}) : super(key: key);

  @override
  State<DMSConverterPage> createState() => _DMSConverterPageState();
}

class _DMSConverterPageState extends State<DMSConverterPage> {
  late TextEditingController northDegController;
  late TextEditingController northMinController;
  late TextEditingController northSecController;

  late TextEditingController eastDegController;
  late TextEditingController eastMinController;
  late TextEditingController eastSecController;

  String northDecimal = '—';
  String eastDecimal = '—';
  String combined = '—';

  @override
  void initState() {
    super.initState();
    northDegController = TextEditingController();
    northMinController = TextEditingController();
    northSecController = TextEditingController();
    eastDegController = TextEditingController();
    eastMinController = TextEditingController();
    eastSecController = TextEditingController();

    northDegController.addListener(convert);
    northMinController.addListener(convert);
    northSecController.addListener(convert);
    eastDegController.addListener(convert);
    eastMinController.addListener(convert);
    eastSecController.addListener(convert);
  }

  @override
  void dispose() {
    northDegController.dispose();
    northMinController.dispose();
    northSecController.dispose();
    eastDegController.dispose();
    eastMinController.dispose();
    eastSecController.dispose();
    super.dispose();
  }

  void convert() {
    double northVal = 0;
    double eastVal = 0;

    try {
      double deg = double.tryParse(northDegController.text) ?? 0;
      double min = double.tryParse(northMinController.text) ?? 0;
      double sec = double.tryParse(northSecController.text) ?? 0;
      northVal = deg + (min / 60) + (sec / 3600);
    } catch (_) {}

    try {
      double deg = double.tryParse(eastDegController.text) ?? 0;
      double min = double.tryParse(eastMinController.text) ?? 0;
      double sec = double.tryParse(eastSecController.text) ?? 0;
      eastVal = deg + (min / 60) + (sec / 3600);
    } catch (_) {}

    setState(() {
      northDecimal = northVal.toStringAsFixed(7);
      eastDecimal = eastVal.toStringAsFixed(7);
      combined = '$northDecimal, $eastDecimal';
    });
  }

  void copyToClipboard(String text) {
    Clipboard.setData(ClipboardData(text: text));
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('Copied to clipboard'),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  void clearNorth() {
    northDegController.clear();
    northMinController.clear();
    northSecController.clear();
  }

  void clearEast() {
    eastDegController.clear();
    eastMinController.clear();
    eastSecController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DMS to Decimal Converter'),
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // North Coordinate Section
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            '🔵 North (Latitude)',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          TextButton(
                            onPressed: clearNorth,
                            child: const Text('Clear'),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          Expanded(
                            child: DMSInput(
                              label: 'Degrees',
                              controller: northDegController,
                              hint: 'e.g., 40',
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: DMSInput(
                              label: 'Minutes',
                              controller: northMinController,
                              hint: 'e.g., 26',
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: DMSInput(
                              label: 'Seconds',
                              controller: northSecController,
                              hint: 'e.g., 46.78',
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      const Divider(),
                      const SizedBox(height: 12),
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Decimal',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  northDecimal,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: 'monospace',
                                  ),
                                ),
                              ],
                            ),
                          ),
                          ElevatedButton.icon(
                            onPressed: () => copyToClipboard(northDecimal),
                            icon: const Icon(Icons.copy, size: 18),
                            label: const Text('Copy'),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // East Coordinate Section
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            '🔴 East (Longitude)',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          TextButton(
                            onPressed: clearEast,
                            child: const Text('Clear'),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          Expanded(
                            child: DMSInput(
                              label: 'Degrees',
                              controller: eastDegController,
                              hint: 'e.g., 74',
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: DMSInput(
                              label: 'Minutes',
                              controller: eastMinController,
                              hint: 'e.g., 0',
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: DMSInput(
                              label: 'Seconds',
                              controller: eastSecController,
                              hint: 'e.g., 21.56',
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      const Divider(),
                      const SizedBox(height: 12),
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Decimal',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  eastDecimal,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: 'monospace',
                                  ),
                                ),
                              ],
                            ),
                          ),
                          ElevatedButton.icon(
                            onPressed: () => copyToClipboard(eastDecimal),
                            icon: const Icon(Icons.copy, size: 18),
                            label: const Text('Copy'),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Combined Coordinates Section
              Card(
                color: Colors.blue.shade50,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        '📍 Combined Coordinates',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              combined,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                fontFamily: 'monospace',
                              ),
                            ),
                          ),
                          ElevatedButton.icon(
                            onPressed: () => copyToClipboard(combined),
                            icon: const Icon(Icons.copy, size: 18),
                            label: const Text('Copy'),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DMSInput extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final String hint;

  const DMSInput({
    Key? key,
    required this.label,
    required this.controller,
    required this.hint,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: Colors.grey,
          ),
        ),
        const SizedBox(height: 8),
        TextField(
          controller: controller,
          keyboardType: const TextInputType.numberWithOptions(
            decimal: true,
            signed: true,
          ),
          decoration: InputDecoration(
            hintText: hint,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 12,
            ),
          ),
        ),
      ],
    );
  }
}
