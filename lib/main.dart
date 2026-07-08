import 'package:flutter/material.dart';

void main() {
  runApp(const FeedBreedApp());
}

class FeedBreedApp extends StatelessWidget {
  const FeedBreedApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FeedBreed',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.green,
          foregroundColor: Colors.white,
        ),
      ),
      home: const LoginScreen(),
    );
  }
}

// ==========================================
// 1. MODELOS DE DATOS
// ==========================================

class Animal {
  int? id;
  String nombre;
  String raza;
  String alimentacion;
  String habitat;
  String comportamiento;
  bool enPeligroExtincion;

  Animal({
    this.id,
    required this.nombre,
    required this.raza,
    required this.alimentacion,
    required this.habitat,
    required this.comportamiento,
    required this.enPeligroExtincion,
  });
}

// ==========================================
// 2. MOCK DATA SERVICE (Simulación de Base de Datos)
// ==========================================

class MockDatabase {
  static final MockDatabase _instancia = MockDatabase._interno();
  factory MockDatabase() => _instancia;
  MockDatabase._interno();

  int _currentId = 3;

  List<Animal> animales = [
    Animal(
      id: 1,
      nombre: 'León',
      raza: 'Panthera leo',
      alimentacion: 'Carnívoro',
      habitat: 'Sabana africana',
      comportamiento: 'Social, vive en manadas. Caza cooperativa.',
      enPeligroExtincion: true,
    ),
    Animal(
      id: 2,
      nombre: 'Lobo',
      raza: 'Canis lupus',
      alimentacion: 'Carnívoro',
      habitat: 'Bosques y tundras',
      comportamiento: 'Altamente territorial y social. Formación de jerarquías.',
      enPeligroExtincion: false,
    ),
  ];

  void addAnimal(Animal animal) {
    animal.id = _currentId++;
    animales.add(animal);
  }

  void updateAnimal(Animal animal) {
    int index = animales.indexWhere((a) => a.id == animal.id);
    if (index != -1) {
      animales[index] = animal;
    }
  }

  void deleteAnimal(int id) {
    animales.removeWhere((a) => a.id == id);
  }
}

// ==========================================
// 3. PANTALLAS (UI)
// ==========================================

// --- PANTALLA DE LOGIN (Epic 1) ---
class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _login() {
    if (_formKey.currentState!.validate()) {
      // Mock Login: Cualquier formato válido pasa.
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('¡Inicio de sesión exitoso!')),
      );
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const AnimalListScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.pets, size: 100, color: Colors.green),
                const SizedBox(height: 16),
                const Text(
                  'FeedBreed',
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 40),
                TextFormField(
                  controller: _emailController,
                  decoration: const InputDecoration(
                    labelText: 'Correo electrónico',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.email),
                  ),
                  validator: (value) =>
                      value!.isEmpty || !value.contains('@') ? 'Ingrese un correo válido' : null,
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: 'Contraseña',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.lock),
                  ),
                  validator: (value) =>
                      value!.length < 6 ? 'La contraseña debe tener al menos 6 caracteres' : null,
                ),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: _login,
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size.infinity,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    backgroundColor: Colors.green,
                    foregroundColor: Colors.white,
                  ),
                  child: const Text('INGRESAR', style: TextStyle(fontSize: 16)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// --- PANTALLA LISTA DE ANIMALES (Epic 2 - Read/Delete) ---
class AnimalListScreen extends StatefulWidget {
  const AnimalListScreen({Key? key}) : super(key: key);

  @override
  State<AnimalListScreen> createState() => _AnimalListScreenState();
}

class _AnimalListScreenState extends State<AnimalListScreen> {
  final db = MockDatabase();

  void _refreshList() {
    setState(() {});
  }

  void _confirmDelete(int id) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Eliminar Animal'),
        content: const Text('¿Estás seguro de que deseas borrar este registro de forma permanente?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancelar'),
          ),
          TextButton(
            onPressed: () {
              db.deleteAnimal(id);
              Navigator.pop(context);
              _refreshList();
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Registro eliminado correctamente')),
              );
            },
            child: const Text('Eliminar', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Panel de Animales'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () => Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const LoginScreen()),
            ),
          )
        ],
      ),
      body: db.animales.isEmpty
          ? const Center(child: Text('No hay animales registrados.'))
          : ListView.builder(
              itemCount: db.animales.length,
              itemBuilder: (context, index) {
                final animal = db.animales[index];
                return Card(
                  margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: animal.enPeligroExtincion ? Colors.red.shade100 : Colors.green.shade100,
                      child: Icon(
                        Icons.pets,
                        color: animal.enPeligroExtincion ? Colors.red : Colors.green,
                      ),
                    ),
                    title: Text(animal.nombre, style: const TextStyle(fontWeight: FontWeight.bold)),
                    subtitle: Text(animal.raza),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete, color: Colors.red),
                      onPressed: () => _confirmDelete(animal.id!),
                    ),
                    onTap: () async {
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AnimalDetailScreen(animal: animal),
                        ),
                      );
                      _refreshList();
                    },
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        child: const Icon(Icons.add, color: Colors.white),
        onPressed: () async {
          await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AnimalFormScreen()),
          );
          _refreshList();
        },
      ),
    );
  }
}

// --- PANTALLA DETALLE DEL ANIMAL (Epic 2 - Read Detail) ---
class AnimalDetailScreen extends StatelessWidget {
  final Animal animal;

  const AnimalDetailScreen({Key? key, required this.animal}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ficha de ${animal.nombre}'),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () async {
              await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AnimalFormScreen(animalToEdit: animal),
                ),
              );
              Navigator.pop(context); // Volver a la lista tras editar
            },
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (animal.enPeligroExtincion)
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(12),
                margin: const EdgeInsets.only(bottom: 20),
                color: Colors.red.shade100,
                child: const Text(
                  '⚠️ En peligro de extinción',
                  style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold, fontSize: 16),
                  textAlign: TextAlign.center,
                ),
              ),
            _buildDetailRow('Nombre:', animal.nombre),
            _buildDetailRow('Raza:', animal.raza),
            _buildDetailRow('Hábitat:', animal.habitat),
            _buildDetailRow('Alimentación:', animal.alimentacion),
            _buildDetailRow('Comportamiento:', animal.comportamiento),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.grey)),
          const SizedBox(height: 4),
          Text(value, style: const TextStyle(fontSize: 18)),
          const Divider(),
        ],
      ),
    );
  }
}

// --- PANTALLA DE FORMULARIO DE ANIMAL (Epic 2 - Create & Update) ---
class AnimalFormScreen extends StatefulWidget {
  final Animal? animalToEdit;

  const AnimalFormScreen({Key? key, this.animalToEdit}) : super(key: key);

  @override
  State<AnimalFormScreen> createState() => _AnimalFormScreenState();
}

class _AnimalFormScreenState extends State<AnimalFormScreen> {
  final _formKey = GlobalKey<FormState>();
  final db = MockDatabase();

  late TextEditingController _nombreCtrl;
  late TextEditingController _razaCtrl;
  late TextEditingController _alimentacionCtrl;
  late TextEditingController _habitatCtrl;
  late TextEditingController _comportamientoCtrl;
  bool _enPeligro = false;

  @override
  void initState() {
    super.initState();
    _nombreCtrl = TextEditingController(text: widget.animalToEdit?.nombre ?? '');
    _razaCtrl = TextEditingController(text: widget.animalToEdit?.raza ?? '');
    _alimentacionCtrl = TextEditingController(text: widget.animalToEdit?.alimentacion ?? '');
    _habitatCtrl = TextEditingController(text: widget.animalToEdit?.habitat ?? '');
    _comportamientoCtrl = TextEditingController(text: widget.animalToEdit?.comportamiento ?? '');
    _enPeligro = widget.animalToEdit?.enPeligroExtincion ?? false;
  }

  void _saveAnimal() {
    if (_formKey.currentState!.validate()) {
      final newAnimal = Animal(
        id: widget.animalToEdit?.id,
        nombre: _nombreCtrl.text,
        raza: _razaCtrl.text,
        alimentacion: _alimentacionCtrl.text,
        habitat: _habitatCtrl.text,
        comportamiento: _comportamientoCtrl.text,
        enPeligroExtincion: _enPeligro,
      );

      if (widget.animalToEdit == null) {
        db.addAnimal(newAnimal);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Animal registrado exitosamente')),
        );
      } else {
        db.updateAnimal(newAnimal);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Información actualizada correctamente')),
        );
      }
      Navigator.pop(context);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Por favor, revisa los campos en rojo'), backgroundColor: Colors.red),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    bool isEditing = widget.animalToEdit != null;

    return Scaffold(
      appBar: AppBar(
        title: Text(isEditing ? 'Editar Animal' : 'Registrar Animal'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              _buildTextField(_nombreCtrl, 'Nombre'),
              const SizedBox(height: 12),
              _buildTextField(_razaCtrl, 'Raza'),
              const SizedBox(height: 12),
              _buildTextField(_habitatCtrl, 'Hábitat'),
              const SizedBox(height: 12),
              _buildTextField(_alimentacionCtrl, 'Alimentación', maxLines: 2),
              const SizedBox(height: 12),
              _buildTextField(_comportamientoCtrl, 'Comportamiento', maxLines: 3),
              const SizedBox(height: 12),
              SwitchListTile(
                title: const Text('¿En peligro de extinción?'),
                value: _enPeligro,
                activeColor: Colors.red,
                onChanged: (bool value) {
                  setState(() {
                    _enPeligro = value;
                  });
                },
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: _saveAnimal,
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white,
                ),
                child: Text(isEditing ? 'ACTUALIZAR' : 'GUARDAR', style: const TextStyle(fontSize: 16)),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(TextEditingController ctrl, String label, {int maxLines = 1}) {
    return TextFormField(
      controller: ctrl,
      maxLines: maxLines,
      decoration: InputDecoration(
        labelText: label,
        border: const OutlineInputBorder(),
      ),
      validator: (value) => value!.isEmpty ? 'Este campo es obligatorio' : null,
    );
  }
}
