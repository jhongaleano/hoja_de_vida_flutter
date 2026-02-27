import 'dart:ui';

import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: DevResumePage(),
  ));
}

class DevResumePage extends StatelessWidget {
  const DevResumePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Obtenemos el ancho de la pantalla para saber si es móvil o PC
    double screenWidth = MediaQuery.of(context).size.width;
    bool isMobile = screenWidth < 700;

    return Scaffold(
      backgroundColor:  Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text("DevResume", 
            style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold)),
        actions: isMobile ? null : [
          
          TextButton(onPressed: () {}, child: const Text("About")),
          TextButton(onPressed: () {}, child: const Text("Experience")),
          TextButton(onPressed: () {}, child: const Text("Skills")),
          Padding(
            padding: const EdgeInsets.only(right: 10, left: 450),
            child: ElevatedButton(onPressed: () {},style: ElevatedButton.styleFrom(backgroundColor: const Color.fromARGB(255, 50, 144, 187)), child: const Text("Download CV",style: TextStyle(color: Color.fromARGB(209, 252, 232, 232)),)),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // --- SECCIÓN HERO ---
            isMobile 
              ? Column(children: [const HeroText(), const HeroImage()])
              : Row(
                  children: const [
                    Expanded(child: HeroText()),
                    Expanded(child: HeroImage()),
                  ],
                ),
            
            const SizedBox(height: 50),
            
            // --- SECCIÓN TÍTULO EXPERTISE ---
            const Text("Technical Expertise", 
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
            const Text("Tools and technologies I use to bring ideas to life.",
                style: TextStyle(color: Colors.grey)),
            
            const SizedBox(height: 30),

            // --- GRID RESPONSIVO ---
            LayoutBuilder(

          
              builder: (context, constraints) {
                int crossAxisCount = 4; // Por defecto PC
                if (constraints.maxWidth < 600) crossAxisCount = 1; // Celular
                else if (constraints.maxWidth < 900) crossAxisCount = 2; // Tablet

                return GridView.count(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisCount: crossAxisCount,
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 20,
                  childAspectRatio: 1.5,
                  children: [
                    skillCard("React", "Component-based UI development.", Icons.code_off_rounded),
                    skillCard("Node.js", "Scalable server-side logic.", Icons.terminal),
                    skillCard("PostgreSQL", "Complex querying and data modeling.", Icons.storage),
                    skillCard("TypeScript", "Writing robust, type-safe code.", Icons.verified_user),
                    skillCard("AWS", "Cloud infrastructure and S3.", Icons.cloud),
                    skillCard("UI Design", "Prototyping in Figma.", Icons.edit),
                    skillCard("Docker", "Containerization and CI/CD.", Icons.settings_input_component),
                    skillCard("Python", "Scripting and data analysis.", Icons.bolt),
                  ],
                );
              },
            ),
          
            isMobile ? Column(children: [const HeroContact()]): Row(
                children: const [
                    Expanded(child: HeroContact()),
                  ],
                ),
          ],
          
        ),
      ),
    );
  }

  // Widget pequeño para cada tarjeta
  Widget skillCard(String title, String desc, IconData icon) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade200),
        boxShadow: [
          BoxShadow(color: Colors.black.withAlpha(2), blurRadius: 10, offset: const Offset(0, 5))
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: Colors.blue, size: 28),
          const SizedBox(height: 12),
          Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          const SizedBox(height: 4),
          Text(desc, style: const TextStyle(color: Colors.grey, fontSize: 12), maxLines: 2),
        ],
      ),
    );
  }
}

// Sub-widget para el texto del Hero
class HeroText extends StatelessWidget {
  const HeroText({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          decoration: BoxDecoration(color: const Color.fromARGB(106, 210, 146, 223), borderRadius: BorderRadius.circular(5)),
          child: const Text("INGENIERO DE SOFTWARE", style: TextStyle(color: Color.fromARGB(255, 136, 6, 125), fontSize: 10, fontWeight: FontWeight.bold)),
        ),
        const SizedBox(height: 20),
        const Text("Building the\nfuture of the web.", 
            style: TextStyle(fontSize: 45, fontWeight: FontWeight.bold, height: 1.1)),
        const SizedBox(height: 20),
        const Text("I specialize in crafting high-performance web applications...",
            style: TextStyle(color: Colors.grey, fontSize: 16)),
        const SizedBox(height: 30),
        Row(
          children: [
            ElevatedButton(onPressed: () {}, child: const Text("Get In Touch") ),
            const SizedBox(width: 15),
            OutlinedButton(onPressed: () {},style: OutlinedButton.styleFrom(backgroundColor: const Color.fromARGB(195, 68, 113, 190)) , child: const Text("View Projects",style: TextStyle(color: Colors.white),)),
          ],
        ),
      ],
    );
  }
}

// Sub-widget para la imagen
class HeroImage extends StatelessWidget {
  const HeroImage({super.key});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.all(20),
        width: 300,
        height: 300,
        decoration: BoxDecoration(
          color: Colors.blue.shade100,
          borderRadius: BorderRadius.circular(30),
        ),
         child:ClipRRect(
           borderRadius: BorderRadius.circular(20.0), // Ajusta el radio aquí
          child: Image.network(
                'https://images.pexels.com/photos/1516680/pexels-photo-1516680.jpeg',
                 fit: BoxFit.cover,
                 width: 100,
                 height: 100,
               ),
            )
       
      ),
      );
  }
}

class HeroContact extends StatelessWidget{
  const HeroContact ({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
          margin: EdgeInsets.only(top: 60,bottom: 35),
          padding: const EdgeInsets.all(45),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(25),
            border: Border.all(color: Colors.black.withAlpha(20)),
            boxShadow: [
              BoxShadow(color: Colors.black.withAlpha(2), blurRadius: 10, offset: const Offset(0, 5))
            ],
          ),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            Text("Let's build something\n          extraordinary together.",style:TextStyle(fontSize: 40, fontWeight: FontWeight.bold)),
              const SizedBox(height: 20),
              Text("Currently available for select freelance opportunities and full-time positions. I'd love to hear about your project.",style:TextStyle(fontSize: 16)),
              const SizedBox(height: 35),
              Row(
                children: [
                  ElevatedButton(onPressed: (){},style: ElevatedButton.styleFrom(backgroundColor: const Color.fromARGB(106, 210, 146, 223)), child: const Text("GitHub",style: TextStyle(color: Colors.white))),
                  const SizedBox(width: 35),
                  ElevatedButton(onPressed: (){}, child: const Text("Linkedln"))


                ],
              )
            ],
          ),
    );
  }
}