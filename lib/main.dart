// ignore_for_file: unreachable_from_main, public_member_api_docs
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_mangement_101/screens/home/home_screen.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.dark,
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
    );
  }
}




/* 
void main() {
  runApp(
    const ProviderScope(
      child: App(),
    ),
  );
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.dark,
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}


 */







/* 
class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home Page')),
    );
  }
}

class DataModel extends Notifier<List<Person>> {
  @override
  List<Person> build() => [];

  void addPerson(Person person) {
    state = [...state, person];
  }

  void removePerson(Person person) {
    state = state.where((p) => p.uuid != person.uuid).toList();
  }

  void updatePerson(Person updatedPerson) {
    state = state.map((p) {
      if (p.uuid == updatedPerson.uuid) {
        return p.copyWith(
          name: updatedPerson.name,
          age: updatedPerson.age,
        );
      }
      return p;
    }).toList();
  }
}

final peopleProvider = NotifierProvider<DataModel, List<Person>>(() {
  return DataModel();
});

@immutable
class Person {
  Person({
    required this.age,
    required this.name,
    String? uuid,
  }) : uuid = uuid ?? const Uuid().v4();

  final String uuid;
  final int age;
  final String name;

  Person copyWith({
    int? age,
    String? name,
  }) {
    return Person(
      uuid: uuid,
      age: age ?? this.age,
      name: name ?? this.name,
    );
  }

  String get displayName => 'Person(name: $name, age: $age)';

  @override
  String toString() => 'Person(uuid: $uuid, name: $name, age: $age)';

  @override
  bool operator ==(covariant Person other) => uuid == other.uuid;

  @override
  int get hashCode => uuid.hashCode;
}
 */


/* 
class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentWeather = ref.watch(
      weatherProvider,
    );
    return Scaffold(
      appBar: AppBar(title: const Text('Weather')),
      body: Column(
        children: [
          currentWeather.when(
            data: (data) => Text(data, style: const TextStyle(fontSize: 40)),
            loading: () => const Padding(
              padding: EdgeInsets.all(8),
              child: CircularProgressIndicator(),
            ),
            error: (error, stack) => const Text('Error loading weather'),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: City.values.length,
              itemBuilder: (context, index) {
                final city = City.values[index];
                final isSelected = city == ref.watch(currentCityProvider);
                return ListTile(
                  title: Text(
                    city.toString(),
                  ),
                  trailing: isSelected ? const Icon(Icons.check) : null,
                  onTap: () =>
                      ref.read(currentCityProvider.notifier).state = city,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}




extension OptionalInfixAddition<T extends num> on T? {
  T? operator +(T? other) {
    final shadow = this;
    if (shadow != null) {
      return shadow + (other ?? 0) as T;
    } else {
      return null;
    }
  }
}

enum City {
  stockholm,
  paris,
  tokyo,
  newyork,
}

typedef WeatherEmoji = String;

Future<WeatherEmoji> getWeather(City city) async {
  return Future.delayed(
    const Duration(seconds: 1),
    () => {
      City.stockholm: '☁️',
      City.paris: '🌧️',
      City.tokyo: '🌞',
    }[city]!,
  );
}

const String unknownWeatherEmoji = '❓';

/// UI writes to this and reads from this
final currentCityProvider = StateProvider<City?>(
  (ref) => null,
);

/// UI reads from this
final weatherProvider = FutureProvider<WeatherEmoji>((ref) async {
  final city = ref.watch(currentCityProvider);
  if (city != null) {
    return getWeather(city);
  } else {
    return unknownWeatherEmoji;
  }
});
 */