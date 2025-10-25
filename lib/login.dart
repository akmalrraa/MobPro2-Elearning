import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> with TickerProviderStateMixin {
  bool _isObscure = true;
  bool _rememberMe = false;
  late AnimationController _fadeController;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();

    // Controller animasi fade
    _fadeController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    // Animasi dari 0 ke 1 (transparan -> terlihat)
    _fadeAnimation = CurvedAnimation(
      parent: _fadeController,
      curve: Curves.easeInOut,
    );

    // Jalankan animasi saat halaman muncul
    _fadeController.forward();
  }

  @override
  void dispose() {
    _fadeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: FadeTransition(
        opacity: _fadeAnimation,
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Bagian atas dengan background daun dan lengkungan
              Stack(
                children: [
                  ClipPath(
                    clipper: TopWaveClipper(),
                    child: Container(
                      height: 250,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/images/leaf_bg.jpeg"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),

                  // Tombol back di atas background
                  Positioned(
                    top: 40,
                    left: 20,
                    child: CircleAvatar(
                      backgroundColor: Colors.white.withOpacity(0.2),
                      child:
                          const Icon(Icons.arrow_back, color: Colors.white),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 10),

              // Welcome Back
              const Text(
                "Welcome Back",
                style: TextStyle(
                  fontFamily: 'IndieFlower',
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
              const SizedBox(height: 5),
              const Text(
                "Login to your account",
                style: TextStyle(
                  fontFamily: 'IndieFlower',
                  color: Colors.grey,
                  fontSize: 14,
                ),
              ),

              const SizedBox(height: 25),

              // Input Nama
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: TextField(
                  style: const TextStyle(fontFamily: 'Poppins'),
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.person, color: Colors.green),
                    hintText: "Full Name",
                    hintStyle: const TextStyle(fontFamily: 'Poppins'),
                    filled: true,
                    fillColor: Colors.green.withOpacity(0.1),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 15),

              // Input Password
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: TextField(
                  style: const TextStyle(fontFamily: 'Poppins'),
                  obscureText: _isObscure,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.lock, color: Colors.green),
                    hintText: "Password",
                    hintStyle: const TextStyle(fontFamily: 'Poppins'),
                    filled: true,
                    fillColor: Colors.green.withOpacity(0.1),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _isObscure
                            ? Icons.visibility_off
                            : Icons.visibility,
                        color: Colors.green,
                      ),
                      onPressed: () {
                        setState(() {
                          _isObscure = !_isObscure;
                        });
                      },
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 10),

              // Remember Me & Forgot Password
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 35),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Checkbox(
                          activeColor: Colors.green,
                          value: _rememberMe,
                          onChanged: (val) {
                            setState(() {
                              _rememberMe = val ?? false;
                            });
                          },
                        ),
                        const Text(
                          "Remember Me",
                          style: TextStyle(fontFamily: 'Poppins'),
                        ),
                      ],
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        "Forgot Password ?",
                        style: TextStyle(
                          color: Colors.green,
                          fontFamily: 'Poppins',
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // Tombol Login
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Text(
                      "Login",
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 25),

              // Sign Up link
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Don’t have account? ",
                    style: TextStyle(fontFamily: 'Poppins'),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: const Text(
                      "Sign up",
                      style: TextStyle(
                        color: Colors.green,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 25),

              // Login with text
              const Text(
                "Or login with",
                style: TextStyle(
                  fontFamily: 'Poppins',
                  color: Colors.grey,
                  fontSize: 14,
                ),
              ),

              const SizedBox(height: 15),

              // Icon Google & Facebook
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _socialButton("assets/images/google.png"),
                  const SizedBox(width: 20),
                  _socialButton("assets/images/facebook.jpg"),
                ],
              ),

              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }

  // Widget tombol sosial media
  Widget _socialButton(String imagePath) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
          color: Colors.grey.shade100,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey.shade300),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(imagePath),
        ),
      ),
    );
  }
}

// Custom Clip untuk bagian atas melengkung
class TopWaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height - 60);
    path.quadraticBezierTo(
      size.width / 2,
      size.height,
      size.width,
      size.height - 60,
    );
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
