import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:greengrocer/src/config/custom_colors.dart';
import 'package:greengrocer/src/pages/auth/controller/auth_controller.dart';
import 'package:greengrocer/src/pages/common_widgets/custom_text_field.dart';
import 'package:greengrocer/src/services/validators.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({Key? key}) : super(key: key);

  final cpfFormatter = MaskTextInputFormatter(
    mask: '###.###.###-##',
    filter: {'#': RegExp(r'[0-9]')},
  );

  final phoneFormatter = MaskTextInputFormatter(
    mask: '## # ####-####',
    filter: {'#': RegExp(r'[0-9]')},
  );

  final _formKey = GlobalKey<FormState>();
  final authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: CustomColors.customSwatchColor,
      body: SingleChildScrollView(
        child: SizedBox(
          height: size.height,
          width: size.width,
          child: Stack(
            children: [
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    const Expanded(
                      child: Center(
                        child: Text(
                          'Cadastro',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 35,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 32,
                        vertical: 40,
                      ),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(45),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          CustomTextField(
                            icon: Icons.email,
                            textInputType: TextInputType.emailAddress,
                            validator: emailValidator,
                            label: 'Email',
                            onSaved: (value) =>
                                authController.user.email = value,
                          ),
                          CustomTextField(
                            icon: Icons.lock,
                            validator: passwordValidator,
                            label: 'Senha',
                            onSaved: (value) =>
                                authController.user.password = value,
                            isSecret: true,
                          ),
                          CustomTextField(
                            icon: Icons.person,
                            validator: nameValidator,
                            label: 'Nome',
                            onSaved: (value) =>
                                authController.user.name = value,
                          ),
                          CustomTextField(
                            icon: Icons.phone,
                            inputFormatters: [phoneFormatter],
                            textInputType: TextInputType.phone,
                            validator: phoneValidator,
                            label: 'Celular',
                            onSaved: (value) =>
                                authController.user.phone = value,
                          ),
                          CustomTextField(
                            icon: Icons.file_copy,
                            inputFormatters: [cpfFormatter],
                            validator: cpfValidator,
                            label: 'CPF',
                            onSaved: (value) => authController.user.cpf = value,
                            textInputType: TextInputType.number,
                          ),
                          SizedBox(
                            height: 50,
                            child: Obx(
                              () => ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18),
                                  ),
                                ),
                                onPressed: authController.isLoading.value
                                    ? null
                                    : () {
                                        FocusScope.of(context).unfocus();

                                        if (_formKey.currentState!.validate()) {
                                          _formKey.currentState!.save();
                                          authController.signUp();
                                        }
                                      },
                                child: authController.isLoading.value
                                    ? const CircularProgressIndicator()
                                    : const Text(
                                        'Cadastrar',
                                        style: TextStyle(fontSize: 18),
                                      ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SafeArea(
                child: Positioned(
                  top: 10,
                  left: 10,
                  child: IconButton(
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                    ),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
