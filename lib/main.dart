import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AssociationHome(),
    );
  }
}

// 1. Prima Pagina: Presentazione dell'Associazione
class AssociationHome extends StatelessWidget {
  const AssociationHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Associazione Insieme per Sestri Levante ODV'),
        backgroundColor: Colors.blue.shade700,
        foregroundColor: Colors.white,
      ),
      drawer: const AppDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Center(
              child: CircleAvatar(
                radius: 60,
                backgroundColor: Colors.blue.shade100,
                child: Icon(Icons.group, size: 60, color: Colors.blue.shade700),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Benvenuti nell\'App Ufficiale',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              'Associazione Insieme per Sestri Levante ODV',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, color: Colors.blue.shade800, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.blue.shade50,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.blue.shade100),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Chi Siamo e Cosa Facciamo',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Siamo un\'associazione impegnata nella promozione sociale, culturale e ricreativa sul territorio. Attraverso la nostra app puoi rimanere in contatto con noi, rinnovare la tua quota associativa e consultare i servizi dedicati.',
                    style: TextStyle(fontSize: 14, height: 1.4),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            const ListTile(
              leading: Icon(Icons.location_on, color: Colors.blue),
              title: Text('Sede Principale'),
              subtitle: Text('Via Roma 1, 16100 Genova (GE)'),
            ),
            const ListTile(
              leading: Icon(Icons.email, color: Colors.blue),
              title: Text('Contatto Email'),
              subtitle: Text('info@tuaassociazione.it'),
            ),
            const SizedBox(height: 20),
            // Utilizzo di Builder per ottenere il contesto corretto dello Scaffold
            Builder(
              builder: (BuildContext innerContext) {
                return ElevatedButton.icon(
                  onPressed: () {
                    Scaffold.of(innerContext).openDrawer();
                  },
                  icon: const Icon(Icons.menu),
                  label: const Text('Apri il Menu delle Sezioni'),
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size.fromHeight(50),
                    backgroundColor: Colors.blue.shade700,
                    foregroundColor: Colors.white,
                    textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

// Menu Laterale Condiviso (Drawer)
class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(color: Colors.blue.shade700),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'Menu Associazione',
                  style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 4),
                Text(
                  'Seleziona una sezione',
                  style: TextStyle(color: Colors.white70, fontSize: 14),
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Home / Associazione'),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const AssociationHome()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.lock),
            title: const Text('I Miei Dati & Profilo (Login)'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const LoginScreen()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.payment),
            title: const Text('Versamento Quota & IBAN'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const PaymentScreen()),
              );
            },
          ),
          const Divider(),
          const Padding(
            padding: EdgeInsets.fromLTRB(16, 8, 16, 4),
            child: Text('AREA RISERVATA ADMIN', style: TextStyle(color: Colors.grey, fontSize: 12, fontWeight: FontWeight.bold)),
          ),
          ListTile(
            leading: const Icon(Icons.people, color: Colors.blue),
            title: const Text('Elenco Soci'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const AdminMemberListScreen()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.admin_panel_settings, color: Colors.blue),
            title: const Text('Dashboard & Annunci Social'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const AdminDashboardScreen()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.receipt_long, color: Colors.blue),
            title: const Text('Ricevute & Modelli Email'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ReceiptAndEmailScreen()),
              );
            },
          ),
        ],
      ),
    );
  }
}

// 2. Schermata di Login per accedere al Profilo Socio
class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Accesso Area Socio'),
        backgroundColor: Colors.blue.shade700,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.lock_person, size: 80, color: Colors.blue),
            const SizedBox(height: 20),
            const Text('Inserisci le tue credenziali', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                prefixIcon: const Icon(Icons.email),
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                prefixIcon: const Icon(Icons.lock),
              ),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const ProfileScreen()),
                );
              },
              style: ElevatedButton.styleFrom(
                minimumSize: const Size.fromHeight(50),
                backgroundColor: Colors.blue.shade700,
                foregroundColor: Colors.white,
              ),
              child: const Text('Accedi al Profilo', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            ),
          ],
        ),
      ),
    );
  }
}

// 3. Schermata del Profilo Socio (dopo il login)
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final String nomeSocio = "Mario Rossi";
    final String emailSocio = "mario.rossi@email.it";
    final DateTime scadenzaQuota = DateTime(2026, 12, 31);
    bool isScaduta = DateTime.now().isAfter(scadenzaQuota);

    return Scaffold(
      appBar: AppBar(
        title: const Text('I miei dati - Profilo Socio'),
        backgroundColor: Colors.blue.shade700,
        foregroundColor: Colors.white,
      ),
      drawer: const AppDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CircleAvatar(
                radius: 50,
                backgroundColor: Colors.blue.shade100,
                child: const Icon(Icons.person, size: 50, color: Colors.blue),
              ),
            ),
            const SizedBox(height: 24),
            Text('Nome Socio: $nomeSocio', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Text('Email: $emailSocio', style: const TextStyle(fontSize: 16, color: Colors.grey)),
            const SizedBox(height: 24),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: isScaduta ? Colors.red.shade50 : Colors.green.shade50,
                border: Border.all(color: isScaduta ? Colors.red : Colors.green),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  Icon(
                    isScaduta ? Icons.warning_amber_rounded : Icons.check_circle,
                    color: isScaduta ? Colors.red : Colors.green,
                    size: 28,
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      isScaduta 
                        ? 'La tua quota associativa è scaduta! Rinnovala al più presto.'
                        : 'Quota attiva regolarmente fino al: ${scadenzaQuota.day}/${scadenzaQuota.month}/${scadenzaQuota.year}',
                      style: TextStyle(
                        color: isScaduta ? Colors.red.shade900 : Colors.green.shade900,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// 4. Schermata Pagamento e IBAN
class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final String nomeAssociazione = "Associazione Insieme per Sestri Levante ODV";
    final String codiceFiscale = "90088290102";
    final String indirizzoAssociazione = "Via Alessandro Manzoni 5, 16039 Sestri Levante (GE)";
    final String ibanAssociazione = "IT24S0623032231000035664162";
    final String intestatarioConto = "Associazione Insieme per Sestri Levante ODV";

    return Scaffold(
      appBar: AppBar(
        title: const Text('Versamento Quota'),
        backgroundColor: Colors.blue.shade700,
        foregroundColor: Colors.white,
      ),
      drawer: const AppDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Text(
              nomeAssociazione,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.blue.shade800),
            ),
            const SizedBox(height: 4),
            Text('Codice Fiscale: $codiceFiscale', style: const TextStyle(fontSize: 14, color: Colors.black87)),
            Text('Sede: $indirizzoAssociazione', style: const TextStyle(fontSize: 14, color: Colors.black87)),
            const Divider(height: 32, thickness: 1),
            const Text('Coordinate Bancarie per il Bonifico', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                border: Border.all(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Intestato a: $intestatarioConto', style: const TextStyle(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  Text('IBAN:', style: TextStyle(color: Colors.grey.shade600, fontSize: 12)),
                  const SizedBox(height: 2),
                  Text(
                    ibanAssociazione,
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, fontFamily: 'monospace'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// 5. Area Admin: Elenco Soci
class AdminMemberListScreen extends StatelessWidget {
  const AdminMemberListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> soci = [
      {'nome': 'Mario Rossi', 'email': 'mario.rossi@email.it', 'attivo': true},
      {'nome': 'Giulia Bianchi', 'email': 'giulia.bianchi@email.it', 'attivo': false},
      {'nome': 'Luca Verdi', 'email': 'luca.verdi@email.it', 'attivo': true},
      {'nome': 'Anna Neri', 'email': 'anna.neri@email.it', 'attivo': false},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Elenco Soci [Admin]'),
        backgroundColor: Colors.blue.shade700,
        foregroundColor: Colors.white,
      ),
      drawer: const AppDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Gestione e Verifica Stato Soci',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            Expanded(
              child: ListView.builder(
                itemCount: soci.length,
                itemBuilder: (context, index) {
                  final socio = soci[index];
                  final bool isAttivo = socio['attivo'];
                  return Card(
                    margin: const EdgeInsets.only(bottom: 10),
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: isAttivo ? Colors.green.shade100 : Colors.red.shade100,
                        child: Icon(
                          isAttivo ? Icons.check : Icons.warning_amber_rounded,
                          color: isAttivo ? Colors.green.shade700 : Colors.red.shade700,
                        ),
                      ),
                      title: Text(socio['nome'], style: const TextStyle(fontWeight: FontWeight.bold)),
                      subtitle: Text(socio['email']),
                      trailing: Text(
                        isAttivo ? 'In regola' : 'Scaduto',
                        style: TextStyle(
                          color: isAttivo ? Colors.green.shade700 : Colors.red.shade700,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// 6. Area Admin: Ricevute e Modelli Email
class ReceiptAndEmailScreen extends StatelessWidget {
  const ReceiptAndEmailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ricevute e Modelli Email [Admin]'),
        backgroundColor: Colors.blue.shade700,
        foregroundColor: Colors.white,
      ),
      drawer: const AppDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            const Text('Modello Email Invito / Sollecito Quota', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.amber.shade50,
                border: Border.all(color: Colors.amber.shade200),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Text(
                'Gentile Socio,\n\nTi ricordiamo di procedere al versamento della quota associativa annuale per sostenere le attività della nostra associazione.\n\nCordiali saluti,\nNome della Tua Associazione APS\nIBAN: IT01X0306909606100000012345',
                style: TextStyle(fontSize: 13),
              ),
            ),
            const SizedBox(height: 24),
            const Text('Anteprima Ricevuta (Senza Timbro/Firma)', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.grey.shade400),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(child: Text('RICEVUTA QUOTA ASSOCIATIVA', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14))),
                  Divider(),
                  Text('Associazione Insieme per Sestri Levante ODV'),
                  Text('Codice Fiscale: 90088290102'),
                  Text('Sede: Via Alessandro Manzoni 5, 16039 Sestri Levante (GE)'),
                  SizedBox(height: 12),
                  Text('Ricevuto dal socio: Mario Rossi'),
                  Text('Causale: Quota associativa anno 2026'),
                  Text('Importo: € 30,00'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// 7. Area Admin: Dashboard Annunci e Social
class AdminDashboardScreen extends StatelessWidget {
  const AdminDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard Amministratore'),
        backgroundColor: Colors.blue.shade700,
        foregroundColor: Colors.white,
      ),
      drawer: const AppDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            const Text('Pubblica un Annuncio Ufficiale', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            TextField(
              maxLines: 4,
              decoration: InputDecoration(
                hintText: 'Scrivi qui il comunicato per i soci...',
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
              ),
            ),
            const SizedBox(height: 16),
            OutlinedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.add_a_photo),
              label: const Text('Allega Foto per il Post / Annuncio'),
              style: OutlinedButton.styleFrom(
                minimumSize: const Size.fromHeight(45),
                foregroundColor: Colors.blue.shade700,
              ),
            ),
            const SizedBox(height: 16),
            SwitchListTile(
              title: const Text('Pubblica anche su Facebook'),
              value: true,
              onChanged: (bool value) {},
            ),
            SwitchListTile(
              title: const Text('Pubblica anche su Instagram'),
              value: true,
              onChanged: (bool value) {},
            ),
            const SizedBox(height: 24),
            ElevatedButton.icon(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Annuncio pubblicato con successo!')),
                );
              },
              icon: const Icon(Icons.send),
              label: const Text('Pubblica Annuncio con Foto'),
              style: ElevatedButton.styleFrom(
                minimumSize: const Size.fromHeight(50),
                backgroundColor: Colors.blue.shade700,
                foregroundColor: Colors.white,
                textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}