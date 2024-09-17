import 'package:flutter/material.dart';
import 'main.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _obscurePassword = true;
  bool _emailNotification = false;
  bool _phoneNotification = false;
  String? _selectedGender;
  final ValueNotifier<double> _fontSizeNotifier = ValueNotifier<double>(16.0);
  final _nameController = TextEditingController();
  final _dobController = TextEditingController();
  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (selectedDate != null && selectedDate != DateTime.now()) {
      setState(() {
        _dobController.text = '${selectedDate.toLocal()}'.split(' ')[0];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cadastro',
      theme: ThemeData(
        useMaterial3: true,
        primaryColor: Colors.deepPurple,
        hintColor: Colors.pinkAccent,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple)
            .copyWith(background: Colors.white),
      ),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepPurple,
          title: ValueListenableBuilder<double>(
            valueListenable: _fontSizeNotifier,
            builder: (context, fontSize, child) {
              return Text(
                'Tela de Cadastro',
                style: TextStyle(fontSize: fontSize),
              );
            },
          ),
          leading: IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.deepPurple,
                ),
                child: ValueListenableBuilder<double>(
                  valueListenable: _fontSizeNotifier,
                  builder: (context, fontSize, child) {
                    return Text(
                      'Menu',
                      style: TextStyle(
                          color: Colors.white, fontSize: fontSize * 1.5),
                    );
                  },
                ),
              ),
              ListTile(
                title: ValueListenableBuilder<double>(
                  valueListenable: _fontSizeNotifier,
                  builder: (context, fontSize, child) {
                    return Text(
                      'Home',
                      style: TextStyle(fontSize: fontSize),
                    );
                  },
                ),
                onTap: () {},
              ),
              ListTile(
                title: ValueListenableBuilder<double>(
                  valueListenable: _fontSizeNotifier,
                  builder: (context, fontSize, child) {
                    return Text(
                      'Profile',
                      style: TextStyle(fontSize: fontSize),
                    );
                  },
                ),
                onTap: () {},
              ),
            ],
          ),
        ),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/background.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: SingleChildScrollView(
            child: ValueListenableBuilder<double>(
              valueListenable: _fontSizeNotifier,
              builder: (context, fontSize, child) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 20),
                    SizedBox(
                      width: 300,
                      child: TextField(
                        controller: _nameController,
                        decoration: InputDecoration(labelText: 'Nome'),
                        keyboardType: TextInputType.name,
                        maxLength: 50,
                      ),
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: 300,
                      child: GestureDetector(
                        onTap: () => _selectDate(context),
                        child: AbsorbPointer(
                          child: TextField(
                            controller: _dobController,
                            decoration: InputDecoration(
                                labelText: 'Data de Nascimento'),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: 300,
                      child: TextField(
                        controller: _phoneController,
                        decoration: InputDecoration(labelText: 'Telefone'),
                        keyboardType: TextInputType.phone,
                        maxLength: 15,
                      ),
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: 300,
                      child: TextField(
                        controller: _emailController,
                        decoration: InputDecoration(labelText: 'E-mail'),
                        keyboardType: TextInputType.emailAddress,
                      ),
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: 300,
                      child: TextField(
                        controller: _passwordController,
                        obscureText: _obscurePassword,
                        decoration: InputDecoration(
                          labelText: 'Senha',
                          suffixIcon: IconButton(
                            icon: Icon(
                              _obscurePassword
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                            ),
                            onPressed: () {
                              setState(() {
                                _obscurePassword = !_obscurePassword;
                              });
                            },
                          ),
                        ),
                        maxLength: 20,
                      ),
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: 300,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Expanded(
                                child: RadioListTile<String>(
                                  title: ValueListenableBuilder<double>(
                                    valueListenable: _fontSizeNotifier,
                                    builder: (context, fontSize, child) {
                                      return Text(
                                        'M',
                                        style: TextStyle(fontSize: fontSize),
                                      );
                                    },
                                  ),
                                  value: 'Masculino',
                                  groupValue: _selectedGender,
                                  onChanged: (value) {
                                    setState(() {
                                      _selectedGender = value;
                                    });
                                  },
                                ),
                              ),
                              Expanded(
                                child: RadioListTile<String>(
                                  title: ValueListenableBuilder<double>(
                                    valueListenable: _fontSizeNotifier,
                                    builder: (context, fontSize, child) {
                                      return Text(
                                        'F',
                                        style: TextStyle(fontSize: fontSize),
                                      );
                                    },
                                  ),
                                  value: 'Feminino',
                                  groupValue: _selectedGender,
                                  onChanged: (value) {
                                    setState(() {
                                      _selectedGender = value;
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                          SwitchListTile(
                            title: ValueListenableBuilder<double>(
                              valueListenable: _fontSizeNotifier,
                              builder: (context, fontSize, child) {
                                return Text(
                                  'Receber Notificações por E-mail',
                                  style: TextStyle(fontSize: fontSize),
                                );
                              },
                            ),
                            value: _emailNotification,
                            onChanged: (value) {
                              setState(() {
                                _emailNotification = value;
                              });
                            },
                          ),
                          SwitchListTile(
                            title: ValueListenableBuilder<double>(
                              valueListenable: _fontSizeNotifier,
                              builder: (context, fontSize, child) {
                                return Text(
                                  'Receber Notificações por Telefone',
                                  style: TextStyle(fontSize: fontSize),
                                );
                              },
                            ),
                            value: _phoneNotification,
                            onChanged: (value) {
                              setState(() {
                                _phoneNotification = value;
                              });
                            },
                          ),
                          const SizedBox(height: 20),
                          Text('Ajustar Tamanho da Fonte',
                              style: TextStyle(fontSize: fontSize)),
                          Slider(
                            value: fontSize,
                            min: 12.0,
                            max: 24.0,
                            divisions: 6,
                            label: fontSize.toString(),
                            onChanged: (newValue) {
                              _fontSizeNotifier.value = newValue;
                            },
                          ),
                          const SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: 150,
                                child: ElevatedButton(
                                  onPressed: () {},
                                  child: ValueListenableBuilder<double>(
                                    valueListenable: _fontSizeNotifier,
                                    builder: (context, fontSize, child) {
                                      return Text(
                                        "Cadastrar",
                                        style: TextStyle(fontSize: fontSize),
                                      );
                                    },
                                  ),
                                  style: ElevatedButton.styleFrom(
                                    foregroundColor: Colors.white,
                                    backgroundColor: Colors.deepPurple,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 20),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const LoginPage(),
                                    ),
                                  );
                                },
                                child: Text(
                                  'Faça login',
                                  style: TextStyle(
                                    fontSize: fontSize,
                                    color: Colors.deepPurple,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.person), label: 'Minha Conta'),
          ],
        ),
      ),
    );
  }
}
