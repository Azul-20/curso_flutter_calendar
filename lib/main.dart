import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Flutter Calendar')),
        body: CalendarWidget(),
      ),
    );
  }
}

class CalendarWidget extends StatelessWidget {
  final List<String> daysOfWeek = ['L', 'M', 'M', 'J', 'V', 'S', 'D'];
  final List<int> daysInMonth = List.generate(30, (index) => index + 1);

  CalendarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Fila para los días de la semana
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: daysOfWeek.map((day) {
            return Expanded(
              flex: 1,
              child: Center(
                child: Text(
                  day,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            );
          }).toList(),
        ),
        const SizedBox(height: 10),
        // Columnas para los días del mes
        Expanded(
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 7, // Número de columnas (días por semana)
              childAspectRatio: 1.0, // Relación de aspecto para cuadrado
            ),
            itemCount: daysInMonth.length,
            itemBuilder: (context, index) {
              return Container(
                margin: const EdgeInsets.all(2),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color.fromARGB(255, 102, 133, 194), Color.fromARGB(255, 161, 104, 231)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Center(
                  child: Text(
                    '${daysInMonth[index]}',
                    style: const TextStyle(fontSize: 16),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

