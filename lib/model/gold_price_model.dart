class GoldPriceModel{

  late String? fullName;
  late String? shortName;
  late double? buyPrice;
  late double? sellPrice;
  late double? fee;
  late String? remark;

  GoldPriceModel(
    {
      this.fullName,
      this.shortName,
      this.buyPrice,
      this.sellPrice,
      this.fee,
      this.remark,
    }
  );
}