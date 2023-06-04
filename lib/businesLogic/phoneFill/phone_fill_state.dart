part of 'phone_fill_cubit.dart';

@immutable
abstract class PhoneFillState {}

class PhoneFillInitial extends PhoneFillState {}
class PhoneFillLoading extends PhoneFillState {}
class PhoneFillSuccess extends PhoneFillState {}
class PhoneFillFailuer extends PhoneFillState {}

