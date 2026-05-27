import 'package:flutter/material.dart';

void main() {
  runApp(const PoupePCApp());
}

class PoupePCApp extends StatefulWidget {
  const PoupePCApp({super.key});

  @override
  State<PoupePCApp> createState() => _PoupePCAppState();
}

class _PoupePCAppState extends State<PoupePCApp> {
  // Gerenciador de estado simples para o tema
  final ValueNotifier<ThemeMode> _themeNotifier = ValueNotifier(ThemeMode.light);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
      valueListenable: _themeNotifier,
      builder: (_, mode, __) {
        return MaterialApp(
          title: 'Poupe PC',
          debugShowCheckedModeBanner: false,
          themeMode: mode,
          // Definição do Tema Claro
          theme: ThemeData(
            useMaterial3: true,
            brightness: Brightness.light,
            colorSchemeSeed: Colors.blueAccent,
            scaffoldBackgroundColor: const Color(0xFFF8F9FA),
          ),
          // Definição do Tema Escuro
          darkTheme: ThemeData(
            useMaterial3: true,
            brightness: Brightness.dark,
            colorSchemeSeed: Colors.blueAccent,
            scaffoldBackgroundColor: const Color(0xFF121212), // Fundo escuro real
            cardColor: const Color(0xFF1E1E1E),
          ),
          home: HomeScreen(themeNotifier: _themeNotifier),
        );
      },
    );
  }
}

class HomeScreen extends StatelessWidget {
  final ValueNotifier<ThemeMode> themeNotifier;
  const HomeScreen({super.key, required this.themeNotifier});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildTopNavBar(context),
            _buildHeroSection(context),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Expanded(flex: 1, child: FiltersSidebar()),
                  SizedBox(width: 30),
                  // O MainContentArea agora gerencia seu próprio estado
                  Expanded(flex: 4, child: MainContentArea()),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // --- COMPONENTES DA UI ---

  Widget _buildTopNavBar(BuildContext context) {
    bool isDark = themeNotifier.value == ThemeMode.dark;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
      color: Theme.of(context).cardColor,
      child: Row(
        children: [
          const Icon(Icons.forum_outlined, color: Colors.blue, size: 30),
          const SizedBox(width: 10),
          const Text(
            "Poupe PC",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const Spacer(),
          _navItem("Início"),
          _navItem("Peças"),
          _navItem("Comparações"),
          _navItem("Ofertas"),
          const SizedBox(width: 20),
          IconButton(
            icon: Icon(isDark ? Icons.light_mode : Icons.dark_mode),
            onPressed: () {
              themeNotifier.value = isDark ? ThemeMode.light : ThemeMode.dark;
            },
          ),
          ElevatedButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.person, color: Colors.white),
            label: const Text("Login", style: TextStyle(color: Colors.white)),
            style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
          ),
        ],
      ),
    );
  }

  Widget _navItem(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Text(title, style: const TextStyle(fontWeight: FontWeight.w500)),
    );
  }

  Widget _buildHeroSection(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(60),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          // Ajuste do gradiente para suportar o tema escuro sem estourar o fundo
          colors: isDark 
              ? [Colors.blue.shade900.withOpacity(0.2), Theme.of(context).scaffoldBackgroundColor]
              : [Colors.blue.shade50.withOpacity(0.5), Colors.white],
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Compare preços de\npeças de PC em tempo real",
                  style: TextStyle(fontSize: 42, fontWeight: FontWeight.w900),
                ),
                const SizedBox(height: 15),
                Text(
                  "Encontre as melhores ofertas de hardware!",
                  style: TextStyle(
                    fontSize: 18, 
                    color: isDark ? Colors.grey.shade400 : Colors.grey.shade600
                  ),
                ),
                const SizedBox(height: 30),
                Row(
                  children: [
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                      ),
                      child: const Text("Comparar Agora", style: TextStyle(color: Colors.white)),
                    ),
                    const SizedBox(width: 15),
                    OutlinedButton(
                      onPressed: () {},
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                      ),
                      child: const Text("Ver Categorias"),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const Expanded(
            child: Icon(Icons.computer, size: 200, color: Colors.blueGrey),
          ),
        ],
      ),
    );
  }
}

class FiltersSidebar extends StatelessWidget {
  const FiltersSidebar({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Filtros", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        const Divider(),
        _filterSection("Faixa de Preço", Slider(value: 0.5, onChanged: (v) {})),
        _filterSection("Marca", Column(
          children: [
            CheckboxListTile(value: false, title: const Text("Intel"), onChanged: (v) {}),
            CheckboxListTile(value: true, title: const Text("AMD"), onChanged: (v) {}),
          ],
        )),
        _filterSection("Capacidade", Wrap(
          spacing: 8,
          children: ["256GB", "512GB", "1TB", "2TB"].map((e) => Chip(label: Text(e))).toList(),
        )),
      ],
    );
  }

  Widget _filterSection(String title, Widget content) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: ExpansionTile(
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        initiallyExpanded: true,
        children: [content],
      ),
    );
  }
}

// Transformado em StatefulWidget para gerenciar as abas selecionadas
class MainContentArea extends StatefulWidget {
  const MainContentArea({super.key});

  @override
  State<MainContentArea> createState() => _MainContentAreaState();
}

class _MainContentAreaState extends State<MainContentArea> {
  // Aba atualmente selecionada (0 = Processadores, 1 = Placas de Vídeo, etc.)
  int _selectedIndex = 0;

  // Lista de categorias
  final List<Map<String, dynamic>> _categories = [
    {"title": "Processadores", "icon": Icons.memory},
    {"title": "Placas de Vídeo", "icon": Icons.settings_input_component},
    {"title": "Memória RAM", "icon": Icons.sd_storage},
    {"title": "SSDs", "icon": Icons.developer_board},
  ];

  // Dados simulados para cada categoria (para demonstrar a mudança)
  final Map<int, List<Map<String, dynamic>>> _categoryData = {
    0: [ // Processadores
      {"name": "AMD Ryzen 7 5800X", "store": "Kabum!", "price": "R\$ 1.499", "savings": "Economize R\$ 150", "color": Colors.green},
      {"name": "Intel Core i5-13400F", "store": "Terabyte", "price": "R\$ 1.399", "savings": "R\$ 1.499", "color": Colors.grey},
    ],
    1: [ // Placas de Vídeo
      {"name": "GeForce RTX 3060 12GB", "store": "Kabum!", "price": "R\$ 2.199", "savings": "Economize R\$ 300", "color": Colors.green},
      {"name": "GeForce RTX 3060 12GB", "store": "Terabyte", "price": "R\$ 2.249", "savings": "R\$ 2.599", "color": Colors.grey},
      {"name": "GeForce RTX 3060 12GB", "store": "Pichau", "price": "R\$ 2.320", "savings": "+ R\$ 121", "color": Colors.red},
    ],
    2: [ // Memória RAM
      {"name": "Corsair Vengeance 16GB", "store": "Kabum!", "price": "R\$ 299", "savings": "Economize R\$ 40", "color": Colors.green},
      {"name": "Kingston Fury 16GB", "store": "Pichau", "price": "R\$ 320", "savings": "R\$ 350", "color": Colors.grey},
    ],
    3: [ // SSDs
      {"name": "SSD Kingston NV2 1TB", "store": "Terabyte", "price": "R\$ 389", "savings": "Economize R\$ 50", "color": Colors.green},
      {"name": "SSD Adata XPG 1TB", "store": "Kabum!", "price": "R\$ 419", "savings": "R\$ 450", "color": Colors.grey},
    ],
  };

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final currentProducts = _categoryData[_selectedIndex] ?? [];

    return Column(
      children: [
        // Tabs de Categoria
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(_categories.length, (index) {
              final cat = _categories[index];
              return _categoryTab(
                context, 
                cat["title"], 
                cat["icon"], 
                index, 
                _selectedIndex == index,
                isDark
              );
            }),
          ),
        ),
        const SizedBox(height: 20),
        // Tabela de Produtos
        Card(
          elevation: 0,
          color: Theme.of(context).cardColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: BorderSide(color: isDark ? Colors.grey.shade800 : Colors.grey.shade300),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            // Adicionado um width para evitar overflow em telas menores e garantir o formato da tabela
            child: SizedBox(
              width: double.infinity,
              child: DataTable(
                columns: const [
                  DataColumn(label: Text('Produto')),
                  DataColumn(label: Text('Loja')),
                  DataColumn(label: Text('Menor Preço')),
                  DataColumn(label: Text('Economia')),
                ],
                rows: currentProducts.map((product) {
                  return _buildDataRow(
                    product["name"], 
                    product["store"], 
                    product["price"], 
                    product["savings"], 
                    product["color"]
                  );
                }).toList(),
              ),
            ),
          ),
        ),
        const SizedBox(height: 30),
        // Footer Stats
        Row(
          children: [
            _statCard(context, "Menor Preço Atual", "R\$ 2.199", Icons.local_offer, isDark),
            const SizedBox(width: 20),
            _statCard(context, "Mais de 5.000 Peças", "Atualização Diária", Icons.storage, isDark),
          ],
        )
      ],
    );
  }

  DataRow _buildDataRow(String name, String store, String price, String savings, Color color) {
    return DataRow(cells: [
      DataCell(Text(name)),
      DataCell(Text(store, style: const TextStyle(fontWeight: FontWeight.bold, fontStyle: FontStyle.italic))),
      DataCell(Text(price, style: const TextStyle(fontWeight: FontWeight.bold))),
      DataCell(Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(color: color.withOpacity(0.1), borderRadius: BorderRadius.circular(5)),
        child: Text(savings, style: TextStyle(color: color, fontWeight: FontWeight.bold)),
      )),
    ]);
  }

  Widget _categoryTab(BuildContext context, String title, IconData icon, int index, bool active, bool isDark) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      child: ChoiceChip(
        label: Text(title),
        avatar: Icon(icon, size: 18, color: active ? Colors.white : Colors.blue),
        selected: active,
        selectedColor: Colors.blue,
        // Correção da cor da fonte no tema escuro quando não estiver selecionado
        labelStyle: TextStyle(
          color: active ? Colors.white : (isDark ? Colors.white70 : Colors.black)
        ),
        onSelected: (bool selected) {
          if (selected) {
            setState(() {
              _selectedIndex = index;
            });
          }
        },
      ),
    );
  }

  Widget _statCard(BuildContext context, String title, String subtitle, IconData icon, bool isDark) {
    return Expanded(
      child: Card(
        color: Theme.of(context).cardColor,
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: isDark ? Colors.blue.withOpacity(0.2) : Colors.blue.shade50, 
            // CORRIGIDO: Usando a variável 'icon' passada no método e removendo o 'const'
            child: Icon(icon, color: Colors.blue), 
          ),
          title: Text(title, style: const TextStyle(fontSize: 12)),
          subtitle: Text(subtitle, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        ),
      ),
    );
  }
}