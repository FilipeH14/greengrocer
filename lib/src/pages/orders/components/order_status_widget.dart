import 'package:flutter/material.dart';
import 'package:greengrocer/src/config/custom_colors.dart';

class OrderStatusWidget extends StatelessWidget {
  final String status;
  final bool isOverdue;

  const OrderStatusWidget({
    required this.status,
    required this.isOverdue,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        _StatusDot(
          isActive: true,
          title: 'Teste de pagamento',
        ),
        _StatusDot(
          isActive: false,
          title: 'Pagamento efetuado',
        ),
      ],
    );
  }
}

class _StatusDot extends StatelessWidget {
  final bool isActive;
  final String title;

  const _StatusDot({
    required this.isActive,
    required this.title,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          alignment: Alignment.center,
          height: 20,
          width: 20,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: CustomColors.customSwatchColor),
            color: isActive ? CustomColors.customSwatchColor : Colors.white,
          ),
          child: isActive
              ? const Icon(
                  Icons.check,
                  size: 13,
                  color: Colors.white,
                )
              : const SizedBox.shrink(),
        ),
        const SizedBox(width: 5),
        Expanded(
          child: Text(title),
        ),
      ],
    );
  }
}
