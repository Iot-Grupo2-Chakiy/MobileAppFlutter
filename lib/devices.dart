import 'package:flutter/material.dart';

class DevicesScreen extends StatefulWidget {
  @override
  _DevicesScreenState createState() => _DevicesScreenState();
}

class _DevicesScreenState extends State<DevicesScreen> {
  void _showAddDeviceDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
          backgroundColor: Colors.white,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.add_circle_outline, size: 48, color: Color(0xFF3A88D0)),
                const SizedBox(height: 12),
                const Text(
                  'Agregar /Editar Dispositivo',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF3A88D0),
                  ),
                ),
                const SizedBox(height: 20),
                _buildInputField('Nombre'),
                _buildInputField('Temperatura Min'),
                _buildInputField('Temperatura Max'),
                _buildInputField('Humedad Min'),
                _buildInputField('Humedad Max'),
                _buildInputField('ICA Min'),
                _buildInputField('ICA Max'),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () => Navigator.of(context).pop(),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF60B4E4),
                    foregroundColor: Colors.white,
                    minimumSize: const Size(double.infinity, 45),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  ),
                  child: const Text('Guardar'),
                ),
                const SizedBox(height: 10),
                OutlinedButton(
                  onPressed: () => Navigator.of(context).pop(),
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: Color(0xFF60B4E4)),
                    minimumSize: const Size(double.infinity, 45),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  ),
                  child: const Text('Cancelar', style: TextStyle(color: Color(0xFF60B4E4))),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildInputField(String label) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4),
      child: TextField(
        decoration: InputDecoration(
          filled: true,
          fillColor: Color(0xFFF0F0F0),
          hintText: label,
          contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }

  Widget _buildDeviceCard() {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            offset: Offset(0, 6),
            blurRadius: 12,
          )
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.memory, size: 100, color: Color(0xFF60B4E4)),
          const SizedBox(width: 16),
          Expanded(
            child: Text(
              'Temp: 24°C\nHumedad: 55%\nICA: 42\nUmbrales: T 20–26°C\n| H 40–60% | ICA < 50',
              style: const TextStyle(fontSize: 14, height: 1.5),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              const Center(
                child: Text(
                  'Dispositivos',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Color(0xFF3A88D0),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: _showAddDeviceDialog,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF60B4E4),
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  minimumSize: Size(double.infinity, 40),
                ),
                child: const Text('Agregar', style: TextStyle(fontSize: 16)),
              ),
              const SizedBox(height: 16),
              Expanded(
                child: ListView(
                  children: [
                    _buildDeviceCard(),
                    _buildDeviceCard(),
                    _buildDeviceCard(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
