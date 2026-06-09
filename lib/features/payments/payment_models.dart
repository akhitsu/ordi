class PaymentCreateRequest {
  const PaymentCreateRequest({
    required this.uuid,
    required this.saleUuid,
    required this.paymentMethodUuid,
    required this.paymentMethodCode,
    required this.amount,
    required this.paidAt,
    required this.idempotencyKey,
    this.referenceNo,
    this.changeAmount,
    this.notes,
  });

  final String uuid;
  final String saleUuid;
  final String paymentMethodUuid;
  final String paymentMethodCode;
  final int amount;
  final DateTime paidAt;
  final String idempotencyKey;
  final String? referenceNo;
  final int? changeAmount;
  final String? notes;

  Map<String, dynamic> toJson({required String deviceUuid}) {
    return <String, dynamic>{
      'uuid': uuid,
      'sale_uuid': saleUuid,
      'device_uuid': deviceUuid,
      'payment_method_uuid': paymentMethodUuid,
      'payment_method_code': paymentMethodCode,
      'amount': amount,
      'paid_at': paidAt.toIso8601String(),
      'reference_no': referenceNo,
      'change_amount': changeAmount,
      'notes': notes,
    }..removeWhere((key, value) => value == null);
  }
}

class PaymentMethodSnapshot {
  const PaymentMethodSnapshot({
    required this.uuid,
    required this.name,
    required this.code,
  });

  final String uuid;
  final String name;
  final String code;

  factory PaymentMethodSnapshot.fromJson(Map<String, dynamic> json) {
    return PaymentMethodSnapshot(
      uuid: json['uuid']?.toString() ?? '',
      name: json['name']?.toString() ?? '-',
      code: json['code']?.toString() ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{'uuid': uuid, 'name': name, 'code': code};
  }
}

enum SalePaymentSummaryStatus {
  unpaid('unpaid'),
  partial('partial'),
  paid('paid'),
  overpaid('overpaid');

  const SalePaymentSummaryStatus(this.apiValue);

  final String apiValue;

  static SalePaymentSummaryStatus fromValue(String? value) {
    for (final item in values) {
      if (item.apiValue == value) {
        return item;
      }
    }
    return SalePaymentSummaryStatus.unpaid;
  }
}

class SalePaymentSummary {
  const SalePaymentSummary({
    required this.grandTotal,
    required this.paidTotal,
    required this.remainingAmount,
    required this.changeAmount,
    required this.status,
  });

  final int grandTotal;
  final int paidTotal;
  final int remainingAmount;
  final int changeAmount;
  final SalePaymentSummaryStatus status;

  factory SalePaymentSummary.fromJson(Map<String, dynamic> json) {
    return SalePaymentSummary(
      grandTotal: _asInt(json['grand_total']),
      paidTotal: _asInt(json['paid_total']),
      remainingAmount: _asInt(json['remaining_amount']),
      changeAmount: _asInt(json['change_amount']),
      status: SalePaymentSummaryStatus.fromValue(json['status']?.toString()),
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'grand_total': grandTotal,
      'paid_total': paidTotal,
      'remaining_amount': remainingAmount,
      'change_amount': changeAmount,
      'status': status.apiValue,
    };
  }
}

class PaymentRecord {
  const PaymentRecord({
    required this.uuid,
    required this.saleUuid,
    required this.amount,
    required this.status,
    required this.paidAt,
    required this.paymentMethod,
    required this.salePaymentSummary,
    this.referenceNo,
  });

  final String uuid;
  final String saleUuid;
  final int amount;
  final String status;
  final DateTime paidAt;
  final PaymentMethodSnapshot paymentMethod;
  final SalePaymentSummary salePaymentSummary;
  final String? referenceNo;

  factory PaymentRecord.fromJson(Map<String, dynamic> json) {
    return PaymentRecord(
      uuid: json['uuid']?.toString() ?? '',
      saleUuid: json['sale_uuid']?.toString() ?? '',
      amount: _asInt(json['amount']),
      status: json['status']?.toString() ?? 'paid',
      paidAt: _parseDateTime(json['paid_at']) ?? DateTime.now(),
      paymentMethod: PaymentMethodSnapshot.fromJson(
        _asMap(json['payment_method']),
      ),
      salePaymentSummary: SalePaymentSummary.fromJson(
        _asMap(json['sale_payment_summary']),
      ),
      referenceNo: json['reference_no']?.toString(),
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'uuid': uuid,
      'sale_uuid': saleUuid,
      'amount': amount,
      'status': status,
      'paid_at': paidAt.toIso8601String(),
      'payment_method': paymentMethod.toJson(),
      'sale_payment_summary': salePaymentSummary.toJson(),
      'reference_no': referenceNo,
    };
  }
}

Map<String, dynamic> _asMap(Object? value) {
  if (value is Map<String, dynamic>) {
    return value;
  }
  return <String, dynamic>{};
}

int _asInt(Object? value) {
  if (value is int) {
    return value;
  }
  return int.tryParse(value?.toString() ?? '') ?? 0;
}

DateTime? _parseDateTime(Object? value) {
  final text = value?.toString();
  if (text == null || text.isEmpty) {
    return null;
  }
  return DateTime.tryParse(text);
}
