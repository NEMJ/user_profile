import 'package:flutter/material.dart';

class UserProfilePage extends StatefulWidget {
  const UserProfilePage({ Key? key }) : super(key: key);

  @override
  State<UserProfilePage> createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfilePage> {
  bool isObscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("User Profile Page"),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.settings,
              color: Colors.white,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.only(left: 20, top: 30, right: 20),
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(), // Retira o foco dos campos de texto
          child: ListView(
            children: [
              Center(
                child: Stack(
                  children: [
                    Container(
                      width: 130,
                      height: 130,
                      decoration: BoxDecoration(
                        border: Border.all(width: 4, color: Colors.white),
                        boxShadow: [
                          BoxShadow(
                            spreadRadius: 2,
                            blurRadius: 10,
                            color: Colors.black.withOpacity(0.1),
                          ),
                        ],
                        shape: BoxShape.circle,
                        image: const DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage('https://cdn.pixabay.com/photo/2017/11/19/07/30/girl-2961959_960_720.jpg'),
                        ),
                      )
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            width: 3,
                            color: Colors.white,
                          ),
                          color: Colors.blue,
                        ),
                        child: IconButton(
                          padding: const EdgeInsets.only(top: 0),
                          icon: const Icon(Icons.edit),
                          color: Colors.white,
                          onPressed: () {},
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 40),
              buildTextField("Nome Completo", "Augusto Motta", false),
              buildTextField("E-mail", "email@email.com.br", false),
              buildTextField("Senha", "*******", true),
              buildTextField("Localidade", "São Paulo", false),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  OutlinedButton(
                    onPressed: () {}, 
                    child: const Text("CANCELAR", style: TextStyle(
                      fontSize: 15,
                      letterSpacing: 2,
                      color: Colors.black,
                    )),
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 35),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text("SALVAR", style: TextStyle(
                      fontSize: 16,
                      letterSpacing: 2,
                      color: Colors.white,
                    )),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blue,
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Widget de Campo de texto com dondição específica para o campo Password
  Widget buildTextField(String labelText, String placeholder, bool isPasswordTextField) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: TextField(
        obscureText: isPasswordTextField ? isObscurePassword : false, // Se for senha os caracteres não são mostrados
        decoration: InputDecoration(
          filled: true,
          fillColor: Color.fromARGB(255, 229, 233, 234),
          suffixIcon: isPasswordTextField
          ? IconButton(
            icon: const Icon(Icons.remove_red_eye, color: Colors.grey),
            onPressed: () {
              setState(() {
                isObscurePassword = !isObscurePassword;
              });
            }
          )
          : null,
          contentPadding: const EdgeInsets.only(bottom: 5, left: 10), // Espaçamento interno do campo de texto; o título acompanha
          labelText: labelText,
          labelStyle: TextStyle(color: Colors.blue),
          floatingLabelBehavior: FloatingLabelBehavior.always, // Mantém o título do campo sempre acima
          hintText: placeholder,
          hintStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: Colors.grey,
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey, width: 1.2),
            borderRadius: BorderRadius.all(Radius.circular(10)),
          )
        ),
      ),
    );
  }
}