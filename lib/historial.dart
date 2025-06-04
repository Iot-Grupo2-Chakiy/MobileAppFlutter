import 'package:flutter/material.dart';

class HistorialScreen extends StatefulWidget {
  const HistorialScreen({super.key});

  @override
  State<HistorialScreen> createState() => _HistorialScreenState();
}

class _HistorialScreenState extends State<HistorialScreen> {
  Widget _buildHistoryCard() {
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
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildLabelRow('Fecha y Hora:', '10-05-2025 18:30'),
          const SizedBox(height: 4),
          _buildLabelRow('Dispositivo:', 'Dispositivo 1'),
          const SizedBox(height: 4),
          _buildLabelRow('Evento:', 'Automático', icon: Icons.remove_red_eye),
        ],
      ),
    );
  }

  Widget _buildLabelRow(String label, String value, {IconData? icon}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Poppins'
          ),
        ),
        const SizedBox(width: 4),
        Expanded(
          child: Text(value),
        ),
        if (icon != null)
          Icon(
            icon,
            size: 18,
            color: Colors.black87,
          ),
      ],
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
                  'Historial',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    fontFamily: 'Poppins',
                      color: Color(0xFF5DADE2)
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Expanded(
                child: ListView(
                  children: [
                    _buildHistoryCard(),
                    _buildHistoryCard(),
                    _buildHistoryCard(),
                    _buildHistoryCard(),
                    _buildHistoryCard(),
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
